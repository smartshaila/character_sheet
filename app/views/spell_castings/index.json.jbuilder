json.array!(@spell_castings) do |spell_casting|
  json.extract! spell_casting, :id, :spell_id, :time_increment_id, :value
  json.url spell_casting_url(spell_casting, format: :json)
end
