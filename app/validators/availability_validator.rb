class AvailabilityValidator < ActiveModel::EachValidator
  include ApplicationHelper

  def validate_each(record, attribute, value)
    return if value.blank?

    pry
    if value < DateTime.current
      record.errors.add(attribute, "can't be in the past")
    end

    if value.saturday? || value.sunday?
      record.errors.add(attribute, "can't be on a weekend")
    end

    pry
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
