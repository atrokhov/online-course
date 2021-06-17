class Order < ApplicationRecord
  belongs_to :lesson
  belongs_to :basket
end
