class CreatePreparedSpells < ActiveRecord::Migration
  def change
    create_table :prepared_spells do |t|
      t.references :character, index: true
      t.references :spell, index: true
      t.boolean :is_cast

      t.timestamps
    end
  end
end
