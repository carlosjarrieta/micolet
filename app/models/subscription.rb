# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_subscriptions_on_email    (email)
#  index_subscriptions_on_user_id  (user_id)
#

include EmailValidate

class Subscription < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :user_id
  validates :email, presence: true, length: { maximum: 60 },
                    uniqueness: { case_sensitive: false, with: URI::MailTo::EMAIL_REGEXP }

  has_many :subscription_categories, dependent: :destroy

  # valida el email
  # https://www.abstractapi.com/email-verification-validation-api
  # sólo para los modelos que tengan el campo email
  validate :validate_email_api
end
