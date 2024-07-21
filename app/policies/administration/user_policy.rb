# frozen_string_literal: true

class Administration::UserPolicy < ApplicationPolicy
  def index?
    user.superadmin || user.admin?
  end
end
