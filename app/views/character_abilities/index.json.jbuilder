json.array!(@character_abilities) do |character_ability|
  json.extract! character_ability, :id, :character_id, :ability_id, :value
  json.url character_ability_url(character_ability, format: :json)
end
