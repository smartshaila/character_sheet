json.array!(@level_progressions) do |level_progression|
  json.extract! level_progression, :id, :level, :proficiency, :min_xp
  json.url level_progression_url(level_progression, format: :json)
end
