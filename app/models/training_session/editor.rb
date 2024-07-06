class TrainingSession::Editor < ApplicationRecord
  belongs_to :user
  belongs_to :training_session
end
