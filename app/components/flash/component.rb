# frozen_string_literal: true

class Flash::Component < ApplicationViewComponent
  option :body, default: -> { "" }
  option :type, default: -> { "notice" }
  option :message, default: -> { "" }
  option :options, default: -> { {} }

  def icon
    {
      alert: "exclamation.svg",
      notice: "info.svg",
      error: "cross.svg",
      success: "check.svg"
    }[type.to_sym]
  end

  def alert_classes_by_type
    {
      alert: {
        message_color: "text-yellow-800",
        body_color: "text-yellow-700",
        background: "bg-yellow-50",
        icon: {color: "text-yellow-400", options: "bg-yellow-50 text-yellow-500 hover:bg-yellow-100 focus:ring-yellow-600 focus:ring-offset-yellow-50"}
      },
      notice: {
        message_color: "text-blue-800",
        body_color: "text-blue-700",
        background: "bg-blue-50",
        icon: {color: "text-blue-400", options: "bg-blue-50 text-blue-500 hover:bg-blue-100 focus:ring-blue-600 focus:ring-offset-blue-50"}
      },
      error: {
        message_color: "text-red-800",
        body_color: "text-red-700",
        background: "bg-red-50",
        icon: {color: "text-red-400", options: "bg-red-50 text-red-500 hover:bg-red-100 focus:ring-red-600 focus:ring-offset-red-50"}
      },
      success: {
        message_color: "text-green-800",
        body_color: "text-green-700",
        background: "bg-green-50",
        icon: {color: "text-green-400", options: "bg-green-50 text-green-500 hover:bg-green-100 focus:ring-green-600 focus:ring-offset-green-50"}
      }
    }[type.to_sym]
  end

  def options
    {data: {
      controller: "flashes",
      "flashes-target": "flashContainer"
    }, class: "flex justify-between rounded-md p-4 item-animate-up #{alert_classes_by_type&.dig(:background)}"}
  end
end
