class Contact < ApplicationRecord
  belongs_to :user
  PHONE_REGEX = /\A\(\+\d{2}\)\s\d{3}(\s|-)\d{3}(\s|-)\d{2}(\s|-)\d{2}\z/.freeze

  validates :name, :date_of_birth, :phone, :address, :credit_card_number, :credit_card_network, :email, presence: true
  validates :name, format: { with: /\A[^!@#\$%\^&*()+_=]+\z/ }
  validates :email, uniqueness: { scope: :user_id }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: PHONE_REGEX, message: 'Invalid phone format' }

  encrypts :credit_card_number


  before_validation :normalize_date_of_birth

  private

  def key_provider
    ActiveSupport::KeyProvider.new(
      key: Rails.application.credentials.secret_key_base[0, 32],
      salt: Rails.application.credentials.secret_key_base[32, 32]
    )
  end

  def normalize_date_of_birth
    # TODO: Normalize the date_of_birth to the required format
  end
end
