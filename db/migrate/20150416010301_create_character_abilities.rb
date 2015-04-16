class CreateCharacterAbilities < ActiveRecord::Migration
  def change
    create_table :character_abilities do |t|
      t.references :character, index: true
      t.references :ability, index: true
      t.integer :value

      t.timestamps
    end
  end
end
