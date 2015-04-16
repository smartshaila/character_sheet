json.array!(@skills) do |skill|
  json.extract! skill, :id, :name, :ability_id
  json.url skill_url(skill, format: :json)
end
