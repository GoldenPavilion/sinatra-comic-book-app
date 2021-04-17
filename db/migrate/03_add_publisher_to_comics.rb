class AddPublisherToComics < ActiveRecord::Migration[5.2]
    def change
        add_column :comics, :publisher, :string
    end
end