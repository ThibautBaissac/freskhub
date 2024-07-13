class User::Info < ApplicationRecord
  belongs_to :user
  belongs_to :fresk

  validates :user_id, uniqueness: {scope: :fresk_id}
  validates :facilitator, inclusion: {in: [true, false]}

  string_enum role: %i[user admin].freeze
end
