class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :weight
      t.decimal :value
      t.references :item_type, index: true

      t.timestamps
    end
  end
end
