class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.recette = Recette.find(params[:recette_id])
    if @review.save!
      redirect_to recette_path(@review.recette)
    else
      render 'recettes/show', alert: "Erreur lors de la création de l'avis", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to recette_path(@review.recette)
  end

  private

  def review_params
    params.require(:review).permit(:commentaire, :note, :recette_id)
  end
end
