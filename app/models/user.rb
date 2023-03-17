# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :name, presence: true, length: { maximum: 30 }
  validates :birthdate, presence: true, birthdate: true

  before_validation :normalize_email

  def normalize_email
    return unless email

    self.email = email.downcase
  end
end
