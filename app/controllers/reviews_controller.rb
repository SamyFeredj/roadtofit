class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.recette = Recette.find(params[:recette_id])
    if @review.save!
      calculate_average_rating
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

  def calculate_average_rating
    recette = @review.recette
    if recette.note_globale.nil?
      if recette.reviews.count > 0
        recette.note_globale = recette.reviews.sum(:note) / recette.reviews.count
      else
        recette.note_globale = @review.note
      end
    else
      recette.note_globale = (recette.note_globale * (recette.reviews.count - 1) + @review.note) / (recette.reviews.count)
    end
    recette.save!
  end
end
