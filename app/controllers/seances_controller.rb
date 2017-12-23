class SeancesController < ApplicationController

  before_action :get_lieu
  before_action :require_login
  before_action :set_seance, only: [:show, :edit, :update, :destroy]

   def index
    @seances = Seance.all
    @disponibilites = Disponibilite.all
    respond_to do |format|
        format.pdf do
        render :pdf => "index.pdf",
          :orientation => 'Landscape',
          :layout => "layouts/pdf.html",
          :disable_javascript => false,
          show_as_html: params[:debug].present?
        end
      format.html
      end
  end

  def seances_passees
    @seances = Seance.all
    respond_to do |format|
        format.pdf do
        render :pdf => "seances_passees.pdf",
          :orientation => 'Landscape',
          :layout => "layouts/pdf.html",
          :disable_javascript => false,
          show_as_html: params[:debug].present?
        end
      format.html
      end
  end

  def mes_seances
    @seances = Seance.all
    @users = User.all
    user = current_user
  end

  def a_completer
    @seances = Seance.all
    @disponibilites = Disponibilite.all
  end

  def edition_calendrier
    @seances = Seance.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
      respond_to do |format|
      format.pdf do
        render :pdf => "edition_calendrier.pdf",
          :orientation => 'Landscape',
          :layout => "layouts/pdf.html",
          :disable_javascript => false,
          show_as_html: params[:debug].present?
        end
      format.html
      end
  end

  def entrees
    @search = SeanceSearch.new(params[:search])
    @seances = @search.scope
    @stats = EntreeFacade.new(@seances)
    @films = Film.all
    respond_to do |format|
        format.pdf do
        render :pdf => "entrees.pdf",
          :layout => "layouts/pdf.html",
          :disable_javascript => false,
          show_as_html: params[:debug].present?
        end
      format.html
      end
  end

  # GET /seances/1
  # GET /seances/1.json
  def show
  end

  # GET /seances/new
  def new
    @seance = Seance.new(params[:seance])
    @films = Film.all
    @villages = Village.all
  end

  # GET /seances/1/edit
  def edit
  end

  # POST /seances
  # POST /seances.json
  def create
    film_selectionne = Film.find_by_id(params["seance"]["film_id"])
    village_selectionne = Village.find_by_id(params["seance"]["village_id"])
    seance = Seance.new(seance_params)
    seance.film_id = film_selectionne.id
    seance.village_id = village_selectionne.id
    seance.save
    redirect_to films_a_venir_url, notice: 'la Séance a bien été créée.'
  end


  # PATCH/PUT /seances/1
  # PATCH/PUT /seances/1.json
  def update
    respond_to do |format|
      if @seance.update(seance_params)
        format.html { redirect_to seance_path, notice: 'La séance a bien été modifiée.' }
      else
        format.html { render :edit }
        format.json { render json: @seance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seances/1
  # DELETE /seances/1.json
  def destroy
    @seance.destroy
    respond_to do |format|
      format.html { redirect_to films_a_venir_url, notice: 'La Séance a bien été suprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seance
      @seance = Seance.find(params[:id])
    end

    def get_lieu
      @lieu = params[:lieu]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seance_params
      params.require(:seance).permit(:horaire, :film_id, :village_id, :version, :projection, :commentaire, :caisse, :extras, :annulee, :billets_adultes, :billets_scolaires, :billets_enfants, :total_billets )
    end
end