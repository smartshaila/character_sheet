class CreateKnownSpells < ActiveRecord::Migration
  def change
    create_table :known_spells do |t|
      t.references :character, index: true
      t.references :spell, index: true

      t.timestamps
    end
  end
end
