class CoursesController < ApplicationController
  before_action :set_course, only: %i[ edit update destroy ]
	before_action :authenticate_user!, except: %i[ index show ]

  def index
  	@courses = Course.all
  end

  def show
  	@course = Course.find(params[:id])
  end

  def new
  	check_rights do
  		@course = Course.new
	  end
  end

  def edit
  end

  def create
  	check_rights do
	  	@course = Course.new(courses_params)

	  	respond_to do |format|
	      if @course.save
	        format.html { redirect_to @course, notice: "Course was successfully created." }
	      else
	        format.html { render :new, status: :unprocessable_entity }
	      end
	    end
	  end
  end

  def update
  	respond_to do |format|
      if @course.update(courses_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
    end
  end

  private

	  def set_course
	  	check_rights do
	    	@course = Course.find(params[:id])
		  end
	  end

  	def courses_params
      params.require(:course).permit(:category_id, :name, :description)
    end

    def check_rights
      if user_signed_in? and current_user.is_superuser?
        yield
      else
        redirect_to courses_url, status: :found, alert: "You don't have enough rights"
      end
    end
end