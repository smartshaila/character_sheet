class AddColumnDisadvantageRangeToWeapon < ActiveRecord::Migration
  def change
    add_column :weapons, :disadvantage_range, :integer
  end
end
