class Users::AccordionPresenter
  def initialize(users:)
    @users = users.includes(:country)
  end

  def call
    items = []
    @users.each do |user|
      items << {title: title(user), content: content(user)}
    end
    items
  end

  private

  def title(user)
    <<~HTML
      <b>#{user.email}</b>
    HTML
  end

  def content(user)
    <<~HTML
      <i>#{user.country&.name}</i>
    HTML
  end
end
