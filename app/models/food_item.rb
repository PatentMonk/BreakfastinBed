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
  belongs_to :food_itemable, polymorphic: true, optional: true
  has_one :description, as: :descriptionable, dependent: :destroy
  accepts_nested_attributes_for :description, allow_destroy: true

  attribute :uuid, MySQLBinUUID::Type.new

  before_create :generate_uuid

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
