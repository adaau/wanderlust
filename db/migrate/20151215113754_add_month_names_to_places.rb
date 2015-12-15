class AddMonthNamesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :month_names, :string
  end
end
