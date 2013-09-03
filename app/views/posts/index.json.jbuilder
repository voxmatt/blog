json.array!(@posts) do |post|
  json.extract! post, :title, :body, :publish_time, :link, :header_img
  json.url post_url(post, format: :json)
end
