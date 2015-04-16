class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.references :magic_school, index: true
      t.boolean :is_verbal
      t.boolean :is_somatic
      t.boolean :is_concentration
      t.boolean :is_ritual

      t.timestamps
    end
  end
end
