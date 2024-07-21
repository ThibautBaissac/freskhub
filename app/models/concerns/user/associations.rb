module User::Associations
  extend ActiveSupport::Concern

  included do
    belongs_to :country
    has_many :user_languages
    has_many :languages, through: :user_languages

    has_many :session_roles, class_name: "TrainingSession::Role", foreign_key: "user_id"
    has_many :editor_roles, class_name: "TrainingSession::Editor", foreign_key: "user_id"
    has_many :facilitator_roles, class_name: "TrainingSession::Facilitator", foreign_key: "user_id"
    has_many :participant_roles, class_name: "TrainingSession::Participant", foreign_key: "user_id"
    has_many :edited_sessions, through: :editor_roles, source: :training_session
    has_many :facilitated_sessions, through: :facilitator_roles, source: :training_session
    has_many :participated_sessions, through: :participant_roles, source: :training_session

    has_many :user_infos, class_name: "User::Info"
    has_many :fresks, through: :user_infos
  end
end
