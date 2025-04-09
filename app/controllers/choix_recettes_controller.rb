class ChoixRecettesController < ApplicationController
  before_action :set_choix_recette, only: [:edit, :update, :destroy]

  def index
    choix_historiques = current_user.choix_recettes
      .where("date < ?", Date.today)
      .order(date: :desc)
      .includes(:recette)

    @choix_par_jour = choix_historiques.group_by(&:date)
  end


  def new
    @choix_recette = ChoixRecette.new
    @recettes = Recette.all

    if params[:recette_id]
      @choix_recette.recette_id = params[:recette_id]
    end
  end

  def create
    @choix_recette = current_user.choix_recettes.build(choix_recette_params)
    if @choix_recette.save
      redirect_to dashboard_path, notice: "Recette ajoutée avec succès !"
    else
      @recettes = Recette.all  # ✅ Ajoute cette ligne ici
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    if @choix_recette.update(choix_recette_params)
      respond_to do |format|
        format.html { head :no_content } # ⛔️ pas de redirection
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_path, alert: "Erreur lors de la mise à jour." }
      end
    end
  end


  def destroy
    @choix_recette.destroy
    redirect_to dashboard_path, notice: "Recette supprimée !"
  end

  private

  def set_choix_recette
    @choix_recette = ChoixRecette.find(params[:id])
  end

  def choix_recette_params
    params.require(:choix_recette).permit(:recette_id, :date, :done)
  end
end
