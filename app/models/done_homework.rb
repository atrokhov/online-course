class DoneHomework < ApplicationRecord
  belongs_to :teacher
  belongs_to :homework
  belongs_to :client
end
