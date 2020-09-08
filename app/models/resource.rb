class Resource < ApplicationRecord
    has_many :supports
    has_many :ideas, through: :supports

    belongs_to :idea     # To enable:     resource.idea

    validates :source, presence: true
end
