class Chat < ApplicationRecord
  belongs_to :first_interlocutor
  belongs_to :second_interlocutor
end
