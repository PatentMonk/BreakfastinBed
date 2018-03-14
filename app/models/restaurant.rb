# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address_id :integer
#  food_type  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
  has_many :food_items

  has_one :address
  has_one :schedule
  has_one :description
end
