class Idea < ApplicationRecord
  belongs_to :user
  has_many :goals						
  has_many :categories, through: :goals			
  has_many :supports
  has_many :supported_resources, through: :supports, source: :resource

  has_many :resources   # To enable:  resource.idea

  validates :title, :inspiration, :plan, :budgeted_dollars, :spent_dollars, presence: true
  scope :alpha, -> { order(:title) }
end
