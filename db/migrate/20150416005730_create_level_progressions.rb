class CreateLevelProgressions < ActiveRecord::Migration
  def change
    create_table :level_progressions do |t|
      t.integer :level
      t.integer :proficiency
      t.integer :min_xp

      t.timestamps
    end
  end
end
