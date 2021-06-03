class Course < ApplicationRecord
  belongs_to :category
  has_many :lessons
  
  validates :name, presence: true, length: { maximum: 100 }
	validates :description, length: { maximum: 500 }
end
