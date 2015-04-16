class CreateRangeTypes < ActiveRecord::Migration
  def change
    create_table :range_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
