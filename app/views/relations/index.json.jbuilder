json.array!(@relations) do |relation|
  json.extract! relation, :id, :projection_id, :person_id
  json.url relation_url(relation, format: :json)
end
