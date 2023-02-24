class AvailabilityValidator < ActiveModel::EachValidator
  include ApplicationHelper

  def validate_each(record, attribute, value)
    return if value.blank?

    pry
    record.available_times

    if value.saturday? || value.sunday?
      record.errors.add(attribute, "can't be on a weekend")
    end

    if all_requests_scheduled.include?(value)
      record.errors.add(attribute, "is already scheduled")
    end
  end

  private

  def all_requests_scheduled
    Request.all.map do |request|
      request.date
    end
  end
end
