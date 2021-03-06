class Diary < ApplicationRecord
  enum kind: [:public, :private], _suffix: true

  validates :title, :kind, presence: true
  validates :expiration, absence: true, if: :public_kind?

  has_many :notes, dependent: :destroy
  scope :expired, -> { where('expiration < ?', Time.now) }
end
