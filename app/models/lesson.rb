class Lesson < ApplicationRecord
  belongs_to :course
  has_one_attached :video
  has_many_attached :files
  
  enum currency: [:KGS, :RUB, :USD, :EUR]
end
