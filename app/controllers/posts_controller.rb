class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.total_likes = 0
    if @post.save!
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

  private

  def post_params
    params.require(:post).permit(:contenu, :image_url, :user_id)
  end
end
