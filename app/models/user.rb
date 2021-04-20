class User < ActiveRecord::Base
    has_secure_password
    has_many :comics

    validates :email, presence: true, uniqueness: true
end