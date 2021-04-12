class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :issue
      t.string :arc
      t.string :writer
      t.string :artist
      t.integer :rating
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
