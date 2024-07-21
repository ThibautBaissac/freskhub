# frozen_string_literal: true

class Administration::UserPolicy < ApplicationPolicy
  def index?
    user.present? # TODO: Change this to user.admin? or superadmin?
  end
end
