class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :character, index: true
      t.references :item, index: true
      t.integer :quantity
      t.boolean :is_private
      t.string :location
      t.boolean :is_equipped
      t.references :weapon, index: true
      t.references :magic, index: true
      t.integer :magic_bonus
      t.string :name
      t.text :description
      t.decimal :weight
      t.decimal :value

      t.timestamps
    end
  end
end
