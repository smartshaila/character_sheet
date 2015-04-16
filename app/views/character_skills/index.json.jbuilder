json.array!(@character_skills) do |character_skill|
  json.extract! character_skill, :id, :character_id, :skill_id
  json.url character_skill_url(character_skill, format: :json)
end
