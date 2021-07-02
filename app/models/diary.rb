class Diary < ApplicationRecord
  enum kind: [:public, :private], _suffix: true

  validates :title, :kind, presence: true
  validates :expiration, absence: true, if: :public_kind?
end
