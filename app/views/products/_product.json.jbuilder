json.extract! product, :id, :title, :description, :pricing, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
