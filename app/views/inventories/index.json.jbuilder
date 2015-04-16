json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :character_id, :item_id, :quantity, :is_private, :location, :is_equipped, :weapon_id, :magic_id, :magic_bonus, :name, :description, :weight, :value
  json.url inventory_url(inventory, format: :json)
end
