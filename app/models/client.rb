# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  address     :string
#  city        :string
#  postal_code :string
#  phone       :string
#  birthdate   :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Index: user_id

# app/models/client.rb
class Client < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id
  validates_uniqueness_of :user_id
  validate :no_coach

  def no_coach
    return errors.add(:base, 'error message') if user.coach.present?
  end
end
