module User::Scopes
  extend ActiveSupport::Concern

  included do
    scope :geocoded, -> { where.not(longitude: nil, latitude: nil) }
    scope :in_same_fresk_as, lambda { |user|
                               joins(:user_infos)
                                 .where(user_infos: {fresk_id: user.user_infos.select(:fresk_id)})
                                 .distinct
                             }
  end
end
