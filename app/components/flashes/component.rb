# frozen_string_literal: true

class Flashes::Component < ViewComponent::Base
  def initialize(message: nil, body: nil, type: nil)
    @message = message
    @body = body
    @type = type
    @flash_color = flash_color
    @icon = icon
  end

  def flash_color
    case @type
    when "notice" then "green"
    when "alert" then "red"
    end
  end

  def icon
    case @type
    when "notice" then "check.svg"
    when "alert" then "cross.svg"
    end
  end
end
