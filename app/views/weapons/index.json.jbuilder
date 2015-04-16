json.array!(@weapons) do |weapon|
  json.extract! weapon, :id, :name, :damage_die, :die_count, :range, :damage_type_id, :item_id, :ability_id
  json.url weapon_url(weapon, format: :json)
end
