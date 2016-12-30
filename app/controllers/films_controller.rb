class FilmsController < ApplicationController

  before_action :set_locale
  def set_locale
    I18n.locale = :fr
  end

  skip_before_action :require_login, only: [:index, :ecranvillage, :show ]

  before_action :set_film, only: [:show, :edit, :update, :destroy]

  require 'httparty'

  # GET /ecranvillage.json
  def ecranvillage
       @films = Film.all
       response = HTTParty.get('http://www.ecranvillage.net/wp-json/ecranvillage-api/v2/export')
       puts response.body, response.code, response.message, response.headers.inspect
       JSON.parse(response.body).each do |item|
       nouveaux_films = Film.new( :id => item["id"], :titrefilm => item["titrefilm"], :description => item["description"] )
       nouveaux_films.save
    end
  end

  # GET /films
  # GET /films.json
  def index
    @films = Film.all
    @seances = Seance.all
    @search = Film.search(params[:q])
    @films = @search.result(distinct: true)
  end

  # GET /films/1
  # GET /films/1.json
  def show
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(film_params)

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      params.require(:film).permit(:titrefilm, :description, :distribution, classification_ids:[])
    end
end
