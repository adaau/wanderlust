class DropMonthTable < ActiveRecord::Migration
  def change
    drop_table :months
  end
end
