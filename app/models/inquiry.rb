class Inquiry < ApplicationRecord
  enum :status, {
    pending: 0,
    contacted: 1,
    closed: 2
  }

  validates :name, presence: true

  validates :email,
            presence: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: "is not a valid email address"
            }

  validates :message, presence: true
end
