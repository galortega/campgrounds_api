class CreateCampgrounds < ActiveRecord::Migration[8.0]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.string :location
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
