json.array!(@character_features) do |character_feature|
  json.extract! character_feature, :id, :character_id, :feature_id
  json.url character_feature_url(character_feature, format: :json)
end
