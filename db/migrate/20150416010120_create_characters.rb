class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :alignment
      t.integer :current_xp
      t.integer :max_hp
      t.integer :current_hp
      t.integer :speed
      t.text :notes
      t.boolean :has_inspiration
      t.references :adventuring_class, index: true

      t.timestamps
    end
  end
end
