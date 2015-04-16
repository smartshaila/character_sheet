class CreateSpellMaterials < ActiveRecord::Migration
  def change
    create_table :spell_materials do |t|
      t.references :spell, index: true
      t.text :description
      t.integer :value
      t.boolean :is_consumed

      t.timestamps
    end
  end
end
