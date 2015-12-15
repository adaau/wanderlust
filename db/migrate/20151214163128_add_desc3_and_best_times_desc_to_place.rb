class AddDesc3AndBestTimesDescToPlace < ActiveRecord::Migration
  def change
    change_table :places do |t|
      t.text :desc3
      t.text :best_times
    end
  end
end
