class CreateMagicSchools < ActiveRecord::Migration
  def change
    create_table :magic_schools do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
