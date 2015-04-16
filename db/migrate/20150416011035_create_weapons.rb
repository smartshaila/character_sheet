class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :damage_die
      t.integer :die_count
      t.integer :range
      t.references :damage_type, index: true
      t.references :item, index: true
      t.references :ability, index: true

      t.timestamps
    end
  end
end
