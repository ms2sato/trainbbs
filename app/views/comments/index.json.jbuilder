json.array!(@comments) do |comment|
  json.extract! comment, :id, :title, :body, :status
  json.url comment_url(comment, format: :json)
end
