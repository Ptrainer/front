# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  email                :string           not null
#  password             :string           not null
#  identification_token :string
#  validation_date      :datetime
#  language_id          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Index: email, identification_token

# app/models/user.rb
class User < ApplicationRecord
  has_one :client
  has_one :coach  

  validates_presence_of :email, :password
  validates_uniqueness_of :identification_token, allow_nil: true
  validates_uniqueness_of :email
  validate :unique_users_type

  def unique_users_type
    return errors.add(:base, 'error message') if client.present? && coach.present?
  end
end
