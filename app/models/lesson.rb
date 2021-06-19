class Lesson < ApplicationRecord
  belongs_to :course
  
  enum currency: [:KGS, :RUB, :USD, :EUR]
end
