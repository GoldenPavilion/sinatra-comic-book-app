class Comic < ActiveRecord::Base
    belongs_to :user
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
end
