class CreditCard < ApplicationRecord
  attribute :uuid, MySQLBinUUID::Type.new
  belongs_to :purchaser
  has_one :address, as: :addressable, dependent: :destroy

  before_create :generate_uuid

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
