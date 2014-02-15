json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :update_count
  json.url post_url(post, format: :json)
end
