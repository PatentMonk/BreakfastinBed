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

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
