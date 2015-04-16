class CreateSpellRanges < ActiveRecord::Migration
  def change
    create_table :spell_ranges do |t|
      t.references :spell, index: true
      t.references :range_type, index: true
      t.integer :value

      t.timestamps
    end
  end
end
