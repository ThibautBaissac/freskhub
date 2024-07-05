class Language < ApplicationRecord
  validates :name, :set1_code, :set2_code, presence: true
  validates :name, :set1_code, :set2_code, uniqueness: true

  default_scope { order(name: :asc) }
end
