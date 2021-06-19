class PaidLessonsController < ApplicationController
	before_action :authenticate_user!

	def index
		@paid_lessons = PaidLesson.where(user: current_user)
	end
end
