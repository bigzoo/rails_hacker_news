class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice]= "Post Created Succesfully!"
      redirect_to posts_path
    else
      render :new
    end
  end
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice]= "Post Updated Succesfully!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice]= "Post Deleted Succesfully!"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id,:link,:votes,:ranking,:description)
  end
end
