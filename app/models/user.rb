class User < ApplicationRecord
    has_many :ideas

    has_secure_password  # access to authenticate & validations

    validates :username, :email, presence: true
end
