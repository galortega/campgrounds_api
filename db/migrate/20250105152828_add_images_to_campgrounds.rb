class AddImagesToCampgrounds < ActiveRecord::Migration[8.0]
  def change
    add_column :campgrounds, :image, :string
  end
end
