class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    # binding pry
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    binding.pry
    @post = Post.create(params[:my_title])
  end

  def edit
  end

  def update
  end

end
