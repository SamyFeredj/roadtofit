class LikesController < ApplicationController
  def update
    @like = Like.find(params[:id])
    toggle_like!
    unless @like.save!
      flash[:alert] = "Erreur lors du like"
      redirect_to post_path(@like.post), status: :unprocessable_entity
    end
  end

  private

  def toggle_like!
    if @like.like_flag == 0
      @like.like_flag = 1
      @like.post.total_likes += 1
    else
      @like.like_flag = 0
      @like.post.total_likes -= 1
    end
  end
end
