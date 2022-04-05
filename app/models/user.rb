class User < ApplicationRecord
    has_secure_password
    has_many :places

    validates :username, presence: true, uniqueness: { case_sesitive: false }
    validates :password, presence: true
end
