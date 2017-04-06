class DisponibilitesController < ApplicationController
  before_action :set_disponibilite, only: [:show, :edit, :update, :destroy]

  # GET /disponibilites
  # GET /disponibilites.json
  def index
    @disponibilites = Disponibilite.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # GET /disponibilites/1
  # GET /disponibilites/1.json
  def show
  end

  # GET /disponibilites/new
  def new
    @disponibilite = Disponibilite.new
  end

  # GET /disponibilites/1/edit
  def edit
  end

  # POST /disponibilites
  # POST /disponibilites.json
  def create
    @disponibilite = Disponibilite.new(disponibilite_params)

    respond_to do |format|
      if @disponibilite.save
        format.html { redirect_to @disponibilite, notice: 'Disponibilite was successfully created.' }
        format.json { render :show, status: :created, location: @disponibilite }
      else
        format.html { render :new }
        format.json { render json: @disponibilite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disponibilites/1
  # PATCH/PUT /disponibilites/1.json
  def update
    respond_to do |format|
      if @disponibilite.update(disponibilite_params)
        format.html { redirect_to @disponibilite, notice: 'Disponibilite was successfully updated.' }
        format.json { render :show, status: :ok, location: @disponibilite }
      else
        format.html { render :edit }
        format.json { render json: @disponibilite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disponibilites/1
  # DELETE /disponibilites/1.json
  def destroy
    @disponibilite.destroy
    respond_to do |format|
      format.html { redirect_to disponibilites_url, notice: 'Disponibilite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disponibilite
      @disponibilite = Disponibilite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disponibilite_params
      params.require(:disponibilite).permit(:nom, :start_time, :end_time)
    end
end
