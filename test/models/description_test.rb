# == Schema Information
#
# Table name: descriptions
#
#  id              :integer          not null, primary key
#  words           :text(65535)
#  connection_id   :integer
#  connection_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class DescriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
