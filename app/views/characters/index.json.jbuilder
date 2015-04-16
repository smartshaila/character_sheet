json.array!(@characters) do |character|
  json.extract! character, :id, :name, :race, :alignment, :current_xp, :max_hp, :current_hp, :speed, :notes, :has_inspiration, :adventuring_class_id
  json.url character_url(character, format: :json)
end
