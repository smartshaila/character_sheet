class CreateCharacterSkills < ActiveRecord::Migration
  def change
    create_table :character_skills do |t|
      t.references :character, index: true
      t.references :skill, index: true

      t.timestamps
    end
  end
end
