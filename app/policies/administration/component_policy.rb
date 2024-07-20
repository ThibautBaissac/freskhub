# frozen_string_literal: true

class Administration::ComponentPolicy < ApplicationPolicy
  def index?
    user.present?
  end
end
