# frozen_string_literal: true

class TrainingSessionPolicy < ApplicationPolicy
  def show?
    return true if record.published

    user.superadmin? || record.editor?(user) || record.facilitator?(user)
  end

  def new?
    user.superadmin? || user.admin? || user.facilitator?
  end

  def create?
    new?
  end

  def edit?
    user.superadmin? || user.admin_for_fresk?(record.fresk) || user.facilitator_for_fresk?(record.fresk)
  end

  def update?
    edit?
  end

  def manage_editors?
    user.superadmin? || record.editor?(user)
  end

  def manage_roles?
    user.superadmin? || record.editor?(user) || record.facilitator?(user)
  end
end
