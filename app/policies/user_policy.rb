# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    user == record || same_fresk_and_admin? || user.superadmin
  end

  alias edit? show?
  alias update? show?

  private

  def same_fresk_and_admin?
    record.user_infos.any? { |user_info| user.admin_for_fresk?(user_info.fresk) }
  end
end
