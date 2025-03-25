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
      # Si la création du commentaire réussit, rendre une réponse Turbo Stream
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append("comments_#{@commentaire.post.id}", target: "comment_list", partial: "commentaires/commentaire", locals: { commentaire: @commentaire, post: @commentaire.post }) }
        format.html { redirect_to post_path(@commentaire.post), notice: "Commentaire ajouté." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @commentaire = Commentaire.find(params[:id])
    @commentaire.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("commentaire_#{@commentaire.id}") }
      format.json { head :no_content }
      format.html { redirect_to post_path(@commentaire.post), notice: "Commentaire supprimé." }
    end
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:user_id, :post_id, :content)
  end
end
