json.array!(@armors) do |armor|
  json.extract! armor, :id, :item_id, :base_ac, :max_ability
  json.url armor_url(armor, format: :json)
end
