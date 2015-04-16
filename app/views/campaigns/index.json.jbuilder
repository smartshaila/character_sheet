json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :description
  json.url campaign_url(campaign, format: :json)
end
