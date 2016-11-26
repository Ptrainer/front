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
# Index: user_id

# app/models/coach.rb
class Coach < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id
  validates_uniqueness_of :user_id
  validate :no_client

  def no_client
    return errors.add(:base, 'error message') if user.client.present?
  end
end
