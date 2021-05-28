class LessonsController < ApplicationController
	before_action :set_lesson, only: %i[ show edit update destroy ]

  def index
  	@lessons = Lesson.where active: true
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
      check_superuser_rights do
        lesson = Lesson.find(params[:id])
        if check_active(lesson)
        	@lesson = lesson
        else
        	redirect_to lessons_url, status: :found
        end
      end
    end

  	def user_params
      params.require(:lesson).permit(:course_id, :free, :name, :text, :price, :active, :video, :files)
    end

    def check_active(lesson)
    	lesson.active and lesson.course.active
    end

    def check_superuser_rights
      if user_signed_in? and current_user.superuser?
        yield
      else
        redirect_to lessons_url, status: :found, alert: "You don't have enough rights"
      end
    end
end
