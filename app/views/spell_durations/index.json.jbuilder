json.array!(@spell_durations) do |spell_duration|
  json.extract! spell_duration, :id, :spell_id, :time_increment_id, :value
  json.url spell_duration_url(spell_duration, format: :json)
end
