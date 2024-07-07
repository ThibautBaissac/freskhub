class User::Info < ApplicationRecord
  belongs_to :user
  belongs_to :fresk
  has_many :user_roles, class_name: "User::Role", foreign_key: "user_info_id", dependent: :destroy

  validates :user_id, uniqueness: {scope: :fresk_id}
end
