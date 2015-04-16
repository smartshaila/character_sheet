json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :weight, :value, :item_type_id
  json.url item_url(item, format: :json)
end
