module Slugify

    module InstanceMethods
        def slug
            username = self.username
            slug = username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            found_user = ''
            self.all.each do |user|
                if user.username.parameterize == slug
                    found_user = user
                end
            end
            found_user
        end
    end
end