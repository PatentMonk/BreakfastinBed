json.extract! credit_card, :id, :number, :month, :year, :address_id, :purchaser_id, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
