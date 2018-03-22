# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  food_type  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
  has_many :restaurant_food_items, as: :food_itemable, dependent: :destroy
  has_many :orders

  has_one :address, as: :addressable, dependent: :destroy
  has_one :schedule, dependent: :destroy
  has_one :description, as: :descriptionable, dependent: :destroy

  accepts_nested_attributes_for :address, :schedule, :description, allow_destroy: true

  attribute :uuid, MySQLBinUUID::Type.new

  before_create :generate_uuid

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
