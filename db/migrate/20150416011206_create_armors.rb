class CreateArmors < ActiveRecord::Migration
  def change
    create_table :armors do |t|
      t.references :item, index: true
      t.integer :base_ac
      t.integer :max_ability

      t.timestamps
    end
  end
end
