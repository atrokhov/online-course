class LessonsController < ApplicationController
	before_action :set_lesson, only: %i[ show edit update destroy ]

  def index
  	if check_superuser_rights
  		@lessons = Course.find(params[:course_id]).lessons
  	else
  		@lessons = Course.find(params[:course_id]).lessons.where active: true
  	end
  end

  def show
  end

  def new
  	@lesson = Course.find(params[:course_id]).lessons.build
  end

  def edit
  end

  def create
  	@lesson = Course.find(params[:course_id]).lessons.build(lessons_params)
  	respond_to do |format|
      if @lesson.save
        format.html { redirect_to category_course_lesson_path(@lesson.course.category_id, @lesson.course_id, @lesson), notice: "Lesson was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
	  end
  end

  def update
  	respond_to do |format|
      if @lesson.update(lessons_params)
        format.html { redirect_to category_course_lesson_path(@lesson.course.category_id, @lesson.course_id, @lesson), notice: "Lesson was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@lesson.destroy
    respond_to do |format|
      format.html { redirect_to category_course_lessons_path, notice: "Lesson was successfully destroyed." }
    end
  end

  def activate
  	if user_signed_in? and (current_user.superuser? or current_user.teacher?)
      lesson = Course.find(params[:course_id]).lessons.find(params[:id])
      if lesson.course.teacher_id == current_user.id or current_user.superuser?
        lesson.active == true ? lesson.active = false : lesson.active = true
        lesson.save
        respond_to do |format|
          format.html { redirect_to category_course_lesson_path(lesson.course.category_id, lesson.course_id, lesson), notice: "Lesson was successfully activated." }
        end
      else
        redirect_to courses_url, status: :found, alert: "You don't have enough rights"
      end
    end
  end

  def add_to_basket
    if check_client_rights
      puts current_user.basket.orders
      puts 'puts'
      lesson = Course.find(params[:course_id]).lessons.find(params[:id])
      if current_user.basket.orders.where(lesson: lesson).empty?
        Order.create(lesson: lesson, basket: current_user.basket)
      end
    end
  end

  private

  	def set_lesson
      lesson = Course.find(params[:course_id]).lessons.find(params[:id])
      if check_active(lesson) or check_superuser_rights or (check_teacher_rights and lesson.course.teacher_id == current_user.id)
      	@lesson = lesson
      else
      	redirect_to category_course_lessons_url, status: :found
      end
    end

  	def lessons_params
      params.require(:lesson).permit(:course_id, :free, :name, :text, :price, :active, :video, :files)
    end

    def check_active(lesson)
    	lesson.active and lesson.course.active
    end

    def check_superuser_rights
      user_signed_in? and current_user.superuser? ? true : false
    end

    def check_teacher_rights
    	user_signed_in? and current_user.teacher? ? true : false
    end

    def check_client_rights
    	user_signed_in? and current_user.client? ? true : false
    end

    def check_admin_rights
    	user_signed_in? and current_user.admin? ? true : false
    end
end
