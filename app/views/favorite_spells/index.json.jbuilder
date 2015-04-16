json.array!(@favorite_spells) do |favorite_spell|
  json.extract! favorite_spell, :id, :player_id, :spell_id
  json.url favorite_spell_url(favorite_spell, format: :json)
end
