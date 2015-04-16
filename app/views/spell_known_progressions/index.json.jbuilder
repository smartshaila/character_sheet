json.array!(@spell_known_progressions) do |spell_known_progression|
  json.extract! spell_known_progression, :id, :adventuring_class_id, :subclass_id, :level_progression_id, :value
  json.url spell_known_progression_url(spell_known_progression, format: :json)
end
