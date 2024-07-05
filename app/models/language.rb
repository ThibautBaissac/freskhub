class Language < ApplicationRecord
  has_many :user_languages
  has_many :users, through: :user_languages

  validates :name, :set1_code, :set2_code, presence: true
  validates :name, :set1_code, :set2_code, uniqueness: true

  default_scope { order(name: :asc) }
end
