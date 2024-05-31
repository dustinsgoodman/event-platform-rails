# frozen_string_literal: true

class EventSessionPolicy < ApplicationPolicy
  private

  def record_org_id
    record.event.platform_organization_id
  end
end
