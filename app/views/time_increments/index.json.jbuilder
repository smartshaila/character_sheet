json.array!(@time_increments) do |time_increment|
  json.extract! time_increment, :id, :name, :description
  json.url time_increment_url(time_increment, format: :json)
end
