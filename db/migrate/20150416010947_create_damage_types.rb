class CreateDamageTypes < ActiveRecord::Migration
  def change
    create_table :damage_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
