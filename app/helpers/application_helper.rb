# frozen_string_literal: true

module ApplicationHelper
  def pretty_date(datetime, timezone)
    datetime.in_time_zone(timezone).to_fs(:abbrev_rfc822)
  end
end
