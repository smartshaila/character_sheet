class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.text :descriptin

      t.timestamps
    end
  end
end
