class PaidLesson < ApplicationRecord
  belongs_to :check
  belongs_to :user
  belongs_to :lesson
end
