Billing::Order.destroy_all
TrainingSession::Attendance.destroy_all
TrainingSession::Editor.destroy_all
TrainingSession::Facilitator.destroy_all
TrainingSession::Participant.destroy_all
Billing::SessionProduct.destroy_all
Billing::Product.destroy_all
Billing::Coupon.destroy_all
TrainingSession.destroy_all
TrainingSession::Category.destroy_all
User::Info.destroy_all
Fresk.destroy_all
User.destroy_all
Language.destroy_all
Country.destroy_all

`rake import:languages`
`rake import:countries`

participant_user = User.create!(email: "participant@test.com", uuid: SecureRandom.uuid, country: Country.first,
                                password: "password")
facilitator_editor_user = User.create!(email: "facilitator_editor@test.com", uuid: SecureRandom.uuid,
                                       country: Country.first, password: "password")
fdc = Fresk.create!(name: "Fresque du climat", identifier: "fdc", url: "https://fresqueduclimat.org/")
fdc.translations.create!(language: "en", field: "short_description",
                         content: "La Fresque du Climat permet à chacun·e de comprendre le fonctionnement, l’ampleur et la complexité des enjeux liés aux dérèglements climatiques.")
fdc.translations.create!(language: "en", field: "long_description",
                         content: "<div class='grid grid-cols-1 sm:grid-cols-3 gap-4 mb-10'>    <div class='space-y-3'>      <h3>Scientifique</h3>      <h4 class='text-indigo-900'>Le jeu La Fresque du Climat est un outil neutre et objectif.</h4>      <p>Il est fondé sur les données issues des rapports scientifiques du GIEC (Groupe d’experts intergouvernemental sur l’évolution du climat) dont les recommandations orientent les décisions politiques et économiques à l’échelle mondiale.</p>    </div>    <div class='space-y-3'>      <h3>Accessible</h3>      <h4 class='text-indigo-900'>Son approche ludique et pédagogique permet à tous les publics de s’approprier le sujet des changements climatiques.</h4>      <p>Cette approche vise à éviter une descente verticale du savoir. Durant l’atelier, les participant·es relient les liens de cause à effets et intègrent les enjeux climatiques dans leur globalité.</p>      </div>    <div class='space-y-3'>      <h3>Impactant</h3>      <h4 class='text-indigo-900'>Sans culpabiliser et par une compréhension partagée des mécanismes à l’oeuvre, La Fresque engage les individus dans un échange constructif.</h4>      <p>À l’issue de l’atelier, les participant·es sont motivé·es et outillé·es pour agir à leur échelle.</p>    </div>  </div>")

facilitator_editor_user.user_infos.create!(fresk: fdc)
facilitator_editor_user.user_infos.first.user_roles.create!(name: "facilitator")
facilitator_editor_user.user_infos.first.user_roles.create!(name: "admin")

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
