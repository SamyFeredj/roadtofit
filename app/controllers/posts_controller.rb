class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.new
    @commentaire = Commentaire.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.total_likes = 0
    if @post.save!
      # like generation
      @like = Like.new(like_flag: 0, post_id: @post.id, user_id: current_user.id)
      @like.save!
      redirect_to posts_path
    else
      render "index", alert: "Erreur lors de la création du post", status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update!(post_params)
      flash[:notice] = "Post modifié avec succès !"
      redirect_to posts_path
    else
      flash.now[:alert] = "Erreur lors de la modification du post"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:contenu, :image_url, :user_id)
  end
end
