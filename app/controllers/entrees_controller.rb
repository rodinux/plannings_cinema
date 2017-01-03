class EntreesController < ApplicationController

  before_action :set_locale
  def set_locale
    I18n.locale = :fr
  end

  before_action :set_entree, only: [:show, :edit, :update, :destroy]


  # GET /entrees
  # GET /entrees.json
  def index
    @entrees = Entree.all
  end


  # GET /entrees/1
  # GET /entrees/1.json
  def show
  end

  # GET /entrees/new
  def new
    @entree = Entree.new
  end

  # GET /entrees/1/edit
  def edit
  end

  # POST /entrees
  # POST /entrees.json
  def create
    @entree = Entree.new(entree_params)
    seance_selectionne = Seance.find_by_id(params["entree"]["seance_id"])
    entree = Entree.new(entree_params)
    entree.seance_id = seance_selectionne.id
    entree.save
    Seance.find(entree.seance_id)
    redirect_to entrees_url, notice: 'l\'entrée a bien été créée.'
  end

  # PATCH/PUT /entrees/1
  # PATCH/PUT /entrees/1.json
  def update
    respond_to do |format|
      if @entree.update(entree_params)
        format.html { redirect_to @entree, notice: 'Entree was successfully updated.' }
        format.json { render :show, status: :ok, location: @entree }
      else
        format.html { render :edit }
        format.json { render json: @entree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrees/1
  # DELETE /entrees/1.json
  def destroy
    @entree.destroy
    respond_to do |format|
      format.html { redirect_to entrees_url, notice: 'Entree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entree
      @entree = Entree.find(params[:id])
      @seances = Seance.all
      @films = Film.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entree_params
      params.require(:entree).permit(:billet, :nombre, :seance_id)
    end
end
