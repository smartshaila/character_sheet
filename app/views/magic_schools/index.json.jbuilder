json.array!(@magic_schools) do |magic_school|
  json.extract! magic_school, :id, :name, :description
  json.url magic_school_url(magic_school, format: :json)
end
