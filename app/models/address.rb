# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  address_one :string(255)
#  address_two :string(255)
#  city        :string(255)
#  state       :string(255)
#  postal      :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :addressable, polymorphic: true, optional: true

  attribute :uuid, MySQLBinUUID::Type.new

  before_create :generate_uuid

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
