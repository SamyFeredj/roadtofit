class RecettesController < ApplicationController

  def index
    @recettes = Recette.all
    if params[:query].present?
      sql_subquery = "nom ILIKE :query OR ingredients ILIKE :query"
      @recettes = @recettes.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end
end
