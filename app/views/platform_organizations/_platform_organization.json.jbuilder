# frozen_string_literal: true

json.extract! platform_organization, :id, :created_at, :updated_at
json.url platform_organization_url(platform_organization, format: :json)
