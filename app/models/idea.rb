class Idea < ApplicationRecord
  belongs_to :user
  has_many :goals						
  has_many :categories, through: :goals			
  has_many :supports
  has_many :resources, through: :supports

end
