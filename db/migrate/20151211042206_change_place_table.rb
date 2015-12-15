class ChangePlaceTable < ActiveRecord::Migration
  def change
    change_table :places do |t|
      t.string :continent
      t.text :avg_temps, array: true, defaults: []
      t.text :avg_precips, array: true, defaults: []
    end
  end
end
