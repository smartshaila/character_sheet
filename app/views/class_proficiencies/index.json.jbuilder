json.array!(@class_proficiencies) do |class_proficiency|
  json.extract! class_proficiency, :id, :adventuring_class_id, :ability_id
  json.url class_proficiency_url(class_proficiency, format: :json)
end
