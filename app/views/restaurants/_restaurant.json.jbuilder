json.extract! restaurant, :id, :name, :address_id, :food_type, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
