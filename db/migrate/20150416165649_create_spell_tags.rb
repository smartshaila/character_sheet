class CreateSpellTags < ActiveRecord::Migration
  def change
    create_table :spell_tags do |t|
      t.references :spell, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
