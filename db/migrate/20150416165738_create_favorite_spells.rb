class CreateFavoriteSpells < ActiveRecord::Migration
  def change
    create_table :favorite_spells do |t|
      t.references :player, index: true
      t.references :spell, index: true

      t.timestamps
    end
  end
end
