class LessonsController < ApplicationController
	before_action :set_lesson, only: %i[ show edit update destroy ]

  def index
  	if check_superuser_rights
  		@lessons = Lesson.all
  	else
  		@lessons = Lesson.where active: true
  	end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def activate
  end

  def deactivate
  end

  private

  	def set_lesson
      lesson = Lesson.find(params[:id])
      if check_active(lesson) or check_superuser_rights or check_teacher_rights and lesson.course.user_id == current_user.id
      	@lesson = lesson
      else
      	redirect_to lessons_url, status: :found
      end
    end

  	def user_params
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
end
