class Resource < ApplicationRecord
    has_many :supports
    has_many :ideas, through: :supports

end
