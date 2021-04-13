class User < ActiveRecord::Base
    has_secure_password
    has_many :comics
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
end