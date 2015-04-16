class CreateClassSpells < ActiveRecord::Migration
  def change
    create_table :class_spells do |t|
      t.references :adventuring_class, index: true
      t.references :subclass, index: true
      t.references :spell, index: true

      t.timestamps
    end
  end
end
