TrainingSession::Participant.destroy_all
TrainingSession::Facilitator.destroy_all
TrainingSession::Editor.destroy_all
User.destroy_all
TrainingSession.destroy_all
TrainingSession::Category.destroy_all
Fresk.destroy_all
Language.destroy_all
Country.destroy_all

`rake import:languages`
`rake import:countries`

participant_user = User.create!(email: "participant@test.com", uuid: SecureRandom.uuid, country: Country.first)
facilitator_editor_user = User.create!(email: "facilitator_editor@test.com", uuid: SecureRandom.uuid,
                                       country: Country.first)
fdc = Fresk.create!(name: "Fresque du climat", identifier: "fdc")
category = TrainingSession::Category.create(fresk: fdc, identifier: "workshop", format: "online")
ts = TrainingSession.create!(training_session_category: category, start_at: Time.now, end_at: Time.now + 1.hour,
                             max_participants: 10, uuid: SecureRandom.uuid, language: Language.first, country: Country.first)
participant = TrainingSession::Participant.create!(training_session: ts, user: participant_user, status: "registered")
facilitator = TrainingSession::Facilitator.create!(training_session: ts, user: facilitator_editor_user,
                                                   status: "registered")
TrainingSession::Editor.create!(training_session: ts, user: facilitator_editor_user)
TrainingSession::Attendance.create!(facilitator:, participant:)
