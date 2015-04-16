class CreateAdventuringClasses < ActiveRecord::Migration
  def change
    create_table :adventuring_classes do |t|
      t.string :name
      t.integer :hit_die

      t.timestamps
    end
  end
end
