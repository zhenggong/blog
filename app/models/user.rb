class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    has_many :categorys
    has_secure_password
    has_secure_token
end
