# frozen_string_literal: true

class FreskPolicy < ApplicationPolicy
  def index?
    true
  end

  def show
    true
  end
end
