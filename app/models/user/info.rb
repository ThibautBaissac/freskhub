class User::Info < ApplicationRecord
  belongs_to :user
  belongs_to :fresk

  validates :user_id, uniqueness: {scope: :fresk_id}
end
