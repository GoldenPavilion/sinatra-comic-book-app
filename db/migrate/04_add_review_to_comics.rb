class AddReviewToComics < ActiveRecord::Migration[5.2]
    def change
        add_column :comics, :review, :string
    end
end