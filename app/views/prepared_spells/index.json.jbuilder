json.array!(@prepared_spells) do |prepared_spell|
  json.extract! prepared_spell, :id, :character_id, :spell_id, :is_cast
  json.url prepared_spell_url(prepared_spell, format: :json)
end
