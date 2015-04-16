class CreateTimeIncrements < ActiveRecord::Migration
  def change
    create_table :time_increments do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
