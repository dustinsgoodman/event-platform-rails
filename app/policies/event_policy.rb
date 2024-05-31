# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  private

  def record_org_id
    record.platform_organization_id
  end
end
