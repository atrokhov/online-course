class CoursesController < ApplicationController
  before_action :set_course, only: %i[ edit update destroy ]
	before_action :authenticate_user!, except: %i[ index show ]

  def index
    if user_signed_in? and current_user.superuser?
  	  @courses = Category.find(params[:category_id]).courses
    else
      @courses = Category.find(params[:category_id]).courses.where(active: true)
    end
  end

  def teacher_courses
    if current_user.teacher?
      @courses = Course.where(teacher_id: current_user.id)
    else
      redirect_to courses_url, status: :found, alert: "You are not a teacher"
    end
  end

  def show
  	@course = Category.find(params[:category_id]).courses.find(params[:id])
  end

  def new
  	check_rights do
  		@course = Category.find(params[:category_id]).courses.build
	  end
  end

  def edit
  end

  def create
  	check_rights do
	  	@course = Category.find(params[:category_id]).courses.build(courses_params)

	  	respond_to do |format|
	      if @course.save
	        format.html { redirect_to category_course_path(@course.category_id, @course), notice: "Course was successfully created." }
	      else
	        format.html { render :new, status: :unprocessable_entity }
	      end
	    end
	  end
  end

  def update
  	respond_to do |format|
      if @course.update(courses_params)
        format.html { redirect_to category_course_path(@course.category_id, @course), notice: "Course was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to category_courses_url, notice: "Course was successfully destroyed." }
    end
  end

  def activate
    if user_signed_in? and (current_user.superuser? or current_user.teacher?)
      course = Category.find(params[:category_id]).courses.find(params[:id])
      if course.teacher_id == current_user.id or current_user.superuser?
        course.active == true ? course.active = false : course.active = true
        course.save
        respond_to do |format|
          format.html { redirect_to category_course_path(course.category_id, course), notice: "Course was successfully activated." }
        end
      else
        redirect_to courses_url, status: :found, alert: "You don't have enough rights"
      end
    end
  end

  private

	  def set_course
	  	check_rights do
	    	@course = Category.find(params[:category_id]).courses.find(params[:id])
		  end
	  end

  	def courses_params
      params.require(:course).permit(:category_id, :name, :description, :active, :teacher_id)
    end

    def check_rights
      if user_signed_in? and current_user.superuser?
        yield
      else
        redirect_to courses_url, status: :found, alert: "You don't have enough rights"
      end
    end
end
