json.array!(@known_spells) do |known_spell|
  json.extract! known_spell, :id, :character_id, :spell_id
  json.url known_spell_url(known_spell, format: :json)
end
