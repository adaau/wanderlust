class ChangeColNameInPlaceTable < ActiveRecord::Migration
  def change
    rename_column :places, :best_times, :best_time
  end
end
