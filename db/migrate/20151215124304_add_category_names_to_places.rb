class AddCategoryNamesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :category_names, :string
  end
end
