class Order < ApplicationRecord
  has_many :order_food_items, as: :food_itemable, dependent: :destroy

  belongs_to :restaurant, optional: true
  belongs_to :purchaser, optional: true
  has_one :payment, dependent: :destroy

  attribute :uuid, MySQLBinUUID::Type.new

  before_create :generate_uuid

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
