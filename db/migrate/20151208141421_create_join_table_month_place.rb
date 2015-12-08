class CreateJoinTableMonthPlace < ActiveRecord::Migration
  def change
    create_join_table :months, :places do |t|
      t.index :month_id
      t.index :place_id
    end
  end
end
