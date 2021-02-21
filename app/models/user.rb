class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create
    has_secure_password
end
