json.extract! order, :id, :purchaser_id, :payment_id, :created_at, :updated_at
json.url order_url(order, format: :json)
