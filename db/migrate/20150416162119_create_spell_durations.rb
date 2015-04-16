class CreateSpellDurations < ActiveRecord::Migration
  def change
    create_table :spell_durations do |t|
      t.references :spell, index: true
      t.references :time_increment, index: true
      t.integer :value

      t.timestamps
    end
  end
end
