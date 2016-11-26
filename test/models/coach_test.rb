# == Schema Information
#
# Table name: coaches
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  gender          :string
#  description     :text
#  validation_date :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class CoachTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
