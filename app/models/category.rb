class Category < ApplicationRecord
    has_many :goals
	has_many :ideas, through: :goals	

end
