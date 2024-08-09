# frozen_string_literal: true

class Event < ApplicationRecord
  # TODO: implement validations and kind of events
  validates :employee_id, presence: true
  validates :timestamp, presence: true

  enum kind: { in: 0, out: 1 }


  def format_time(time)
    return nil unless time.present?

    DateTime.strptime(time, '%s')

  rescue Date::Error
    nil
  end
end
