module TrainingSession::Scopes
  extend ActiveSupport::Concern

  included do
    scope :upcoming, -> { where("end_at > ?", Time.current) }
    scope :past, -> { where("end_at <= ?", Time.current) }
    scope :by_language, ->(language) { where(language:) }
    scope :by_country, ->(country) { where(country:) }
    scope :by_category, ->(category) { where(category:) }
    scope :by_user_as_editor, lambda { |user|
                                joins(:editors).where("training_session_editors.user_id = ?", user.id)
                              }
    scope :by_user_as_facilitator, ->(user) { by_user_and_role(user, :facilitator) }
    scope :by_user_as_participant, ->(user) { by_user_and_role(user, :participant) }
    scope :by_user_and_role, lambda { |user, role|
                               joins(role.to_s.pluralize.to_s.to_sym).where("training_session_roles.user_id = ? AND type = ?", user.id, "TrainingSession::#{role.to_s.capitalize}")
                             }
  end
end
