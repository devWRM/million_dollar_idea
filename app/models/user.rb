class User < ApplicationRecord
    has_many :ideas

    has_many :categories, through: :ideas
    has_many :resources, through: :ideas




    has_secure_password  # access to authenticate & validations

    validates :username, :email, uniqueness: true, presence: true

    # validates :username, :presence => true, :message => ""
    # validates :username, :uniqueness => true, :message => ""
    # validates :email, :uniqueness => true, message => ""
    # validates :email, :presence => true, message => ""
end
