class PostsController < ApplicationController

  def index
    @posts = Post.all
    @authors = Author.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    #@post = Post.new(params[:post])
    @post = Post.new(post_params)
    @post.save
    redirect_to "/posts/#{@post.id}"
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end

  private

  def post_params
    # params.require(:key).permit(:filter)
    params.require(:post).permit(
      :title,
      :category,
      :body
    )
  end

end
