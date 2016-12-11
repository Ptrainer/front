# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  gender                 :string
#  language_id            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#

# app/models/user.rb
class User < ApplicationRecord
  GENDERS = %w(MR MRS OTHER).freeze
  attr_accessor :user_type

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  has_one :client
  has_one :coach

  # validates_presence_of :email
  # validates_uniqueness_of :email
  validate :unique_users_type
  validates :gender, inclusion: { in: GENDERS + [nil] }

  # before_save :user_type

  def unique_users_type
    return errors.add(:base, 'error message') if client.present? && coach.present?
  end

  # def user_type
  #   Client.new(user_id: id) if user_type == 'client'
  #   Coach.new(user_id: id) if user_type == 'coach'
  # end
end
