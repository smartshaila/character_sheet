json.array!(@subclasses) do |subclass|
  json.extract! subclass, :id, :adventuring_class_id, :name, :description, :min_level
  json.url subclass_url(subclass, format: :json)
end
