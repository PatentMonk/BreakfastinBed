# == Schema Information
#
# Table name: food_items
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  price          :decimal(10, )
#  description_id :integer
#  image_url      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class FoodItem < ApplicationRecord
  
end
