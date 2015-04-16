json.array!(@spell_tags) do |spell_tag|
  json.extract! spell_tag, :id, :spell_id, :tag_id
  json.url spell_tag_url(spell_tag, format: :json)
end
