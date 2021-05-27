class CategoriesController < ApplicationController
	before_action :set_category, only: %i[ edit update destroy ]
	before_action :authenticate_user!, except: %i[ index show ]

  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end

  def new
    check_rights do
      @category = Category.new
	  end
  end

  def edit
  end

  def create
  	check_rights do
	  	@category = Category.new(category_params)

	  	respond_to do |format|
	      if @category.save
	        format.html { redirect_to @category, notice: "Category was successfully created." }
	      else
	        format.html { render :new, status: :unprocessable_entity }
	      end
	    end
	  end
  end

  def update
  	respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
    end
  end

  private

	  def set_category
	  	check_rights do
	    	@category = Category.find(params[:id])
		  end
	  end

  	def category_params
      params.require(:category).permit(:name, :description)
    end

    def check_rights
      if user_signed_in? and current_user.superuser?
        yield
      else
        redirect_to categories_url, status: :found, alert: "You don't have enough rights"
      end
    end
end
