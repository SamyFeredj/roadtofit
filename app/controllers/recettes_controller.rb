class RecettesController < ApplicationController

  def index
    @recettes = Recette.all
    if params[:query].present?
      sql_subquery = "nom ILIKE :query OR ingredients ILIKE :query"
      @recettes = @recettes.where(sql_subquery, query: "%#{params[:query]}%")
    end

    # if params[:repas_de_la_journee].present?
    #   @recettes = @recettes.where(repas_de_la_journee: params[:repas_de_la_journee])
    # end
  end

  def show
    @recette = Recette.find(params[:id])
    @reviews = Review.where(recette: @recette)
    @review = Review.new
  end

  def new
    @recette = Recette.new
  end

  def create
    @recette = Recette.new(recette_params)
    if @recette.save
      redirect_to @recette, notice: "Recette ajoutée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recette_params
    params.require(:recette).permit(:nom, :lipides, :glucides, :proteines, :calories, :ingredients, :repas_de_la_journee, :tips, :instructions, :difficulte, :temps_de_preparation, :tags, :photo)
  end
end
