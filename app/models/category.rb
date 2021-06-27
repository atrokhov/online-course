class Category < ApplicationRecord
	has_many :courses, dependent: :delete_all
	validates :name, presence: true, length: { maximum: 100 }
	validates :description, length: { maximum: 500 }
end
