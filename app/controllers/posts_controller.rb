class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]

  def index
    @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'Your post was created'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    # @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = 'The post was updated'
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
