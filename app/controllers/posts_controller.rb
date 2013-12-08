class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    # binding.pry

    @post = Post.new(post_params)
    # @post.creator = User.first # TODO: change onece have authentication
    @post.creator = current_user

    if @post.save
      flash[:notice] = 'Your post was created'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    # @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = 'The post was updated'
      redirect_to posts_path
    else
      render :edit
    end
  end

  def vote
    # binding.pry
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
