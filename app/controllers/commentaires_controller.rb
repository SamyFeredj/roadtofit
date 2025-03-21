class CommentairesController < ApplicationController

  def new
    @commentaire = Commentaire.new
  end

  def create
    @commentaire = Commentaire.new(commentaire_params)
    @commentaire.post = Post.find(params[:post_id])
    @commentaire.user = current_user
    if @commentaire.save
      redirect_to post_path(@commentaire.post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:user_id, :post_id, :content)
  end
end
