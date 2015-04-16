class CreateMagics < ActiveRecord::Migration
  def change
    create_table :magics do |t|
      t.string :name
      t.text :description
      t.references :item, index: true

      t.timestamps
    end
  end
end
