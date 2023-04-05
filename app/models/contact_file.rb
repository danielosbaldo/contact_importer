class ContactFile < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  enum status: [ :on_hold, :processing, :failed, :finished ]
  validates :file_name, presence: true
  validates :file, presence: true
  validates :status, presence: true

  serialize :error_messages, Array

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :on_hold
  end
end
