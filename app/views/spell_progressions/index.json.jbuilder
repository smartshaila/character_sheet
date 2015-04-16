json.array!(@spell_progressions) do |spell_progression|
  json.extract! spell_progression, :id, :adventuring_class_id, :subclass_id, :level_progression_id, :spell_level, :slots
  json.url spell_progression_url(spell_progression, format: :json)
end
