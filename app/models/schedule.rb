# == Schema Information
#
# Table name: schedules
#
#  id                  :integer          not null, primary key
#  monday_opens_at     :datetime
#  monday_closes_at    :datetime
#  tuesday_opens_at    :datetime
#  tuesday_closes_at   :datetime
#  wednesday_opens_at  :datetime
#  wednesday_closes_at :datetime
#  thursday_opens_at   :datetime
#  thursday_closes_at  :datetime
#  friday_opens_at     :datetime
#  friday_closes_at    :datetime
#  saturday_opens_at   :datetime
#  saturday_closes_at  :datetime
#  sunday_opens_at     :datetime
#  sunday_closes_at    :datetime
#  restaurant_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Schedule < ApplicationRecord
  attribute :uuid, MySQLBinUUID::Type.new

  before_create :generate_uuid

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
