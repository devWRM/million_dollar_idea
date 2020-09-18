class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :category
    
  has_many :supports, :dependent => :destroy
  has_many :supported_resources, through: :supports, source: :resource

  has_many :resources, :dependent => :destroy   # To enable:  resource.idea


  # accepts_nested_attributes_for :category
  

  validates :title, :inspiration, :plan, :budgeted_dollars, :spent_dollars, presence: true
  
  scope :alpha, -> { order(:title) }


  def budgeted_dollars_remaining
    budgeted_dollars - spent_dollars
  end

  def within_budget
    if budgeted_dollars_remaining >= 0
      "Yes, this idea is within budget"
    else
      "No, this idea is over budget"
    end
  end

  # def resource_attributes=(attr)
  #   self.resource = Resource.find_or_create_by(attr) if !attr[:source].blank?
  # end

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:label].blank?
  end

end
