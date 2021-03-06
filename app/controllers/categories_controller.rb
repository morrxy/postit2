class CategoriesController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    # binding.pry
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category has been created.'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end