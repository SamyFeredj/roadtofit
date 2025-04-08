class CommentairesController < ApplicationController

  def index
    @commentaires = Commentaire.all
    @commentaire = Commentaire.new
    @post = Post.find(params[:post_id])
  end

  def new
    @commentaire = Commentaire.new
  end

  def create
    @post = Post.find(params[:post_id])
    @commentaire = Commentaire.new(commentaire_params)
    @commentaire.post = @post
    @commentaire.user = current_user
    if @commentaire.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to posts_path, notice: "Commentaire enregistré" }
      end
    else
      raise
    end
    # if @commentaire.save
    #   redirect_to post_commentaires_path(@commentaire.post)
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @commentaire = Commentaire.find(params[:id])
    @commentaire.post = @post
    @commentaire.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to posts_path, notice: "Commentaire supprimé" }
    end
    # redirect_to post_commentaires_path(@commentaire.post), status: :see_other
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:user_id, :post_id, :content)
  end
end
