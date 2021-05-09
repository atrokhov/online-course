class Category < ApplicationRecord
	validates :name, presence: true, length: { maximum: 100 }
	validates :description, length: { maximum: 500 }
end
