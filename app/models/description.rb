# == Schema Information
#
# Table name: descriptions
#
#  id              :integer          not null, primary key
#  content         :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Description < ApplicationRecord
  belongs_to :descriptionable, polymorphic: true, optional: true
  attribute :uuid, MySQLBinUUID::Type.new

  before_create :generate_uuid

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
