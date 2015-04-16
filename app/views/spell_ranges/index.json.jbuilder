json.array!(@spell_ranges) do |spell_range|
  json.extract! spell_range, :id, :spell_id, :range_type_id, :value
  json.url spell_range_url(spell_range, format: :json)
end
