json.array!(@magics) do |magic|
  json.extract! magic, :id, :name, :description, :item_id
  json.url magic_url(magic, format: :json)
end
