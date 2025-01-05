class AddIndexesToCampgrounds < ActiveRecord::Migration[8.0]
  def change
    add_index :campgrounds, :name
    add_index :campgrounds, :location
    add_index :campgrounds, :description
  end
end
