class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params.merge({'post_id':@post.id}))
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      @post = Post.find(params[:post_id])
      render :new
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:user_id,:description)
  end
end
