class Check < ApplicationRecord
	enum currency: [:KGS, :RUB, :USD, :EUR]
end
