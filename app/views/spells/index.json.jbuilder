json.array!(@spells) do |spell|
  json.extract! spell, :id, :name, :description, :magic_school_id, :is_verbal, :is_somatic, :is_concentration, :is_ritual
  json.url spell_url(spell, format: :json)
end
