class Translation < ApplicationRecord
  belongs_to :translatable, polymorphic: true

  validates :language, :content, :field, presence: true
end
