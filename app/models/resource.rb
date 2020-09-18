class Resource < ApplicationRecord
    has_many :supports
    has_many :ideas, through: :supports

    belongs_to :idea     # To enable:     resource.idea

    validates :source, presence: true # ERROR  message: "Enter a resource, please."


    # def idea_attributes=(attr)
    #     self.idea = Idea.find_or_create_by(attr) if !attr[:title].blank?
    # end
    

end
