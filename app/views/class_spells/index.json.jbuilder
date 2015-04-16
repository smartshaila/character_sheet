json.array!(@class_spells) do |class_spell|
  json.extract! class_spell, :id, :adventuring_class_id, :subclass_id, :spell_id
  json.url class_spell_url(class_spell, format: :json)
end
