class RequestDecorator < BaseDecorator
  def formatted_date
    __getobj__.date.strftime("%B %d, %Y at %I:%M %p (%Z)")
  end

  def date_in_specified_timezone
    __getobj__.date.in_time_zone(__getobj__.timezone)
  end

  def formatted_date_in_specified_timezone
    date_in_specified_timezone.strftime("%B %d, %Y at %I:%M %p (%Z)")
  end
end
