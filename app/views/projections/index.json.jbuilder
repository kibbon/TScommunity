json.array!(@projections) do |projection|
  json.extract! projection, :id, :title, :info, :user_num
  json.url projection_url(projection, format: :json)
end
