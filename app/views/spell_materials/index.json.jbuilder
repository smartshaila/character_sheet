json.array!(@spell_materials) do |spell_material|
  json.extract! spell_material, :id, :spell_id, :description, :value, :is_consumed
  json.url spell_material_url(spell_material, format: :json)
end
