TrainingSession::Attendance.destroy_all
TrainingSession::Editor.destroy_all
TrainingSession::Facilitator.destroy_all
TrainingSession::Participant.destroy_all
Billing::Order.destroy_all
Billing::SessionProduct.destroy_all
Billing::Product.destroy_all
Billing::Coupon.destroy_all
TrainingSession.destroy_all
TrainingSession::Category.destroy_all
Fresk.destroy_all
User.destroy_all
Language.destroy_all
Country.destroy_all

`rake import:languages`
`rake import:countries`

participant_user = User.create!(email: "participant@test.com", uuid: SecureRandom.uuid, country: Country.first)
facilitator_editor_user = User.create!(email: "facilitator_editor@test.com", uuid: SecureRandom.uuid,
                                       country: Country.first)
fdc = Fresk.create!(name: "Fresque du climat", identifier: "fdc")

category = TrainingSession::Category.create!(fresk: fdc, identifier: "workshop", format: "online")

ts = TrainingSession.create!(category:, start_at: Time.now, end_at: Time.now + 1.hour,
                             max_participants: 10, uuid: SecureRandom.uuid, language: Language.first, country: Country.first)

participant = TrainingSession::Participant.create!(training_session: ts,
                                                   user: participant_user, status: "registered")
facilitator = TrainingSession::Facilitator.create!(training_session: ts, user: facilitator_editor_user,
                                                   status: "registered")
TrainingSession::Editor.create!(training_session: ts, user: facilitator_editor_user)
TrainingSession::Attendance.create!(facilitator:, participant:)

coupon = Billing::Coupon.create!(fresk: fdc, code: "aaa")
participant.update!(coupon:)
product = Billing::Product.create!(name: "produit 1", tax_rate: 20, after_tax_price_cents: 1200, tax_cents: 200,
                                   before_tax_price_cents: 1000, fresk: fdc, country: Country.first, category:)
Billing::SessionProduct.create!(training_session: ts, product:)
Billing::Order.create!(product:, participant:, tax_rate: 20,
                       after_tax_price_cents: 1200, tax_cents: 200, before_tax_price_cents: 1000, currency: "EUR", status: "paid")
