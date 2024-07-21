# frozen_string_literal: true

class Administration::ComponentPolicy < ApplicationPolicy
  def index?
    user.superadmin || user.admin?
  end
end
