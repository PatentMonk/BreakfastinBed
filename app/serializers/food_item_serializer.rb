class FoodItemSerializer < BaseSerializer
  attributes :name,
             :price,
             :image_url

  has_one :description
end
