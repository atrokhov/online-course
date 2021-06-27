class Course < ApplicationRecord
  belongs_to :category
  has_many :lessons, dependent: :delete_all
  
  validates :name, presence: true, length: { maximum: 100 }
	validates :description, length: { maximum: 500 }
end
