class CreateSubclasses < ActiveRecord::Migration
  def change
    create_table :subclasses do |t|
      t.references :adventuring_class, index: true
      t.string :name
      t.text :description
      t.integer :min_level

      t.timestamps
    end
  end
end
