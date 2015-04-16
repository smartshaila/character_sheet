json.array!(@range_types) do |range_type|
  json.extract! range_type, :id, :name, :description
  json.url range_type_url(range_type, format: :json)
end
