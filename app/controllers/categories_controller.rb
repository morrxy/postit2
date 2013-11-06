class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      flash[:notice] = 'Your category was created'
      # redirect_to categories_path
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit!
  end

end