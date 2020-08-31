class Goal < ApplicationRecord
  belongs_to :idea
  belongs_to :category
end
