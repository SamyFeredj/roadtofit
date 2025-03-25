class CommentairesController < ApplicationController

  def index
    @post = Post.find(params[:post_id]) # Trouver le post correspondant
    @commentaire = Commentaire.new # Initialiser un nouveau commentaire
    @commentaires = @post.commentaires # Récupérer les commentaires associés au post
    render partial: "commentaires/commentaire", locals: { post: @post } # Rendre les commentaires dans la modal
  end

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

  def destroy
    @commentaire = Commentaire.find(params[:id])
    @commentaire.destroy
    redirect_to post_commentaires_path(@commentaire), status: :see_other
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:user_id, :post_id, :content)
  end
end
