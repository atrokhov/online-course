class LessonsController < ApplicationController
	before_action :set_lesson, only: %i[ show edit update destroy ]

  def index
    course = Course.find(params[:course_id])
  	if check_superuser_rights
  		@lessons = course.lessons
      @course = course
    elsif check_teacher_rights and course.teacher_id == current_user.id
      @lessons = course.lessons
      @course = course
  	else
  		@lessons = course.lessons.where active: true
      @course = course
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
    if @lesson.free == true
      @lesson.price = 0
    end
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
    @lesson.video.purge
    @lesson.files.purge
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
        redirect_to category_course_lesson_path(lesson.course.category_id, lesson.course_id, lesson), status: :found, alert: "You don't have enough rights"
      end
    end
  end

  def add_to_basket
    if check_client_rights
      lesson = Course.find(params[:course_id]).lessons.find(params[:id])
      if PaidLesson.where(lesson: lesson, user: current_user).empty?
        if current_user.basket.orders.where(lesson: lesson).empty?
          Order.create(lesson: lesson, basket: current_user.basket)
          respond_to do |format|
            format.html { redirect_to category_course_lesson_path(lesson.course.category_id, lesson.course_id, lesson), notice: "Lesson was successfully added to cart." }
          end
        else
          redirect_to category_course_lesson_path(lesson.course.category_id, lesson.course_id, lesson), status: :found, alert: "You already added this lesson to cart"
        end
      else
        redirect_to category_course_lesson_path(lesson.course.category_id, lesson.course_id, lesson), status: :found, alert: "You already bought this lesson"
      end
    end
  end

  def delete_from_basket
    if check_client_rights
      lesson = Course.find(params[:course_id]).lessons.find(params[:id])
      order = current_user.basket.orders.where(lesson: lesson)
      if !order.empty?
        order.first.destroy
        respond_to do |format|
          format.html { redirect_to baskets_index_path, notice: "Lesson was successfully deleted from cart." }
        end
      else
        redirect_to category_course_lesson_path(lesson.course.category_id, lesson.course_id, lesson), status: :found, alert: "Nothing to delete from cart"
      end
    end
  end

  def buy
    if check_client_rights
      lesson = Course.find(params[:course_id]).lessons.find(params[:id])
      if PaidLesson.where(lesson: lesson, user: current_user).empty?
        check = Check.create(sum: lesson.price, customer: SecureRandom.hex(16))
        paid_lesson = PaidLesson.create(check: check, lesson: lesson, user: current_user)
        respond_to do |format|
            format.html { redirect_to category_course_lesson_path(lesson.course.category_id, lesson.course_id, lesson), notice: "Lesson was successfully bought." }
          end
      else
        redirect_to category_course_lesson_path(lesson.course.category_id, lesson.course_id, lesson), status: :found, alert: "You already bought this lesson"
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
      params.require(:lesson).permit(:course_id, :free, :name, :text, :price, :currency, :active, :video, files: [])
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
