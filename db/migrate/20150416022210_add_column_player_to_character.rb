class AddColumnPlayerToCharacter < ActiveRecord::Migration
  def change
    add_reference :characters, :player, index: true
  end
end
