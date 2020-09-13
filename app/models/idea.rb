class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :category
    
  has_many :supports, :dependent => :destroy
  has_many :supported_resources, through: :supports, source: :resource

  has_many :resources, :dependent => :destroy   # To enable:  resource.idea


  accepts_nested_attributes_for :category
  

  validates :title, :inspiration, :plan, :budgeted_dollars, :spent_dollars, presence: true
  
  scope :alpha, -> { order(:title) }
end
