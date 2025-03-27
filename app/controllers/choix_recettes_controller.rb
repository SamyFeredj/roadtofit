class ChoixRecettesController < ApplicationController
  before_action :set_choix_recette, only: [:edit, :update, :destroy]

  def index
    choix_historiques = current_user.choix_recettes
      .where("date < ?", Date.today)
      .order(date: :asc)
      .includes(:recette)

    @choix_par_jour = choix_historiques.group_by(&:date)
  end


  def new
    @choix_recette = ChoixRecette.new
    @recettes = Recette.all
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
      redirect_to choix_recettes_path, notice: "Recette mise à jour !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @choix_recette.destroy
    redirect_to choix_recettes_path, notice: "Recette supprimée !"
  end

  private

  def set_choix_recette
    @choix_recette = ChoixRecette.find(params[:id])
  end

  def choix_recette_params
    params.require(:choix_recette).permit(:recette_id, :date, :done)
  end
end
