class CreateSpellProgressions < ActiveRecord::Migration
  def change
    create_table :spell_progressions do |t|
      t.references :adventuring_class, index: true
      t.references :subclass, index: true
      t.references :level_progression, index: true
      t.integer :spell_level
      t.integer :slots

      t.timestamps
    end
  end
end
