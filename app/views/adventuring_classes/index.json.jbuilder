json.array!(@adventuring_classes) do |adventuring_class|
  json.extract! adventuring_class, :id, :name, :hit_die
  json.url adventuring_class_url(adventuring_class, format: :json)
end
