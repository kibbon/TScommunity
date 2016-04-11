json.array!(@discussions) do |discussion|
  json.extract! discussion, :content, :projection_id, :person_id
  json.url discussion_url(discussion, format: :json)
end
