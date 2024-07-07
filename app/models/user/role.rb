class User::Role < ApplicationRecord
  belongs_to :user_info, class_name: "User::Info"

  validates :name, presence: true
  validates :name, uniqueness: {scope: :user_info_id}
end
