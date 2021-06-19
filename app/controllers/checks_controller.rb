class ChecksController < ApplicationController
  def index
    @checks = []
    paid_lessons = PaidLesson.where(user: current_user)
    paid_lessons.each { |paid_lesson| @checks.push(paid_lesson.check) }
    @checks.uniq!
  end
end
