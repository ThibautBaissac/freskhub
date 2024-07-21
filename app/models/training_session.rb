class TrainingSession < ApplicationRecord
  include Decorable
  include TrainingSession::Associations
  include TrainingSession::Scopes
  include TrainingSession::Validations

  def to_param
    uuid
  end
end
