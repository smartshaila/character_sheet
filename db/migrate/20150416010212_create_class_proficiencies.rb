class CreateClassProficiencies < ActiveRecord::Migration
  def change
    create_table :class_proficiencies do |t|
      t.references :adventuring_class, index: true
      t.references :ability, index: true

      t.timestamps
    end
  end
end
