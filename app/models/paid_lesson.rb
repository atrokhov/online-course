class PaidLesson < ApplicationRecord
  belongs_to :check
  belongs_to :client
  belongs_to :lesson
end
