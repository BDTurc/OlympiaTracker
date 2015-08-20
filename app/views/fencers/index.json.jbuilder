json.array!(@fencers) do |fencer|
  json.extract! fencer, :id
  json.url fencer_url(fencer, format: :json)
end
