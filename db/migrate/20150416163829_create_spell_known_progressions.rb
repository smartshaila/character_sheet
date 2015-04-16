class CreateSpellKnownProgressions < ActiveRecord::Migration
  def change
    create_table :spell_known_progressions do |t|
      t.references :adventuring_class, index: true
      t.references :subclass, index: true
      t.references :level_progression, index: true
      t.integer :value

      t.timestamps
    end
  end
end
