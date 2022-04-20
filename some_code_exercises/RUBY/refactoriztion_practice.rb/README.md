# Writing Clean code 🥇

## Basic Rules
✅ **"Code describes itself"**

## Intention Reveleaing Method
✅ **"Remember to use methods that describe themselves. Using if Statements."** <br>
```ruby
class ProjectsController
  def index
    if user_is_admitted_at_least_a_week_ago?
      @projects = current_user.active_projects

    else
      if user_is_new?
        show_marketing_flash_message
      end

      @projects = Project.featured
    end
  end

  private

  def user_is_new?
    current_user && current_user.created_at > a_week_ago
  end

  def user_is_admitted_at_least_a_week_ago?
    current_user && current_user.created_at < a_week_ago
  end

  def show_marketing_flash_message
    @flash_msg = 'Sign up for having your own projects, and see promo ones!'
  end

  def a_week_ago
    Time.now - 7*24*3600
  end
end
```

## Spacial Case Objects
```ruby
require_relative 'setup'

class User
  def last_subscription
    subscriptions.last || NoSubscription.new
  end

  def cancel_subscription
    last_subscription.cancel
  end
end

class NoSubscription
  def name
    "none"
  end

  def trial_days
    "-"
  end

  def status
    "-"
  end

  def cancel
  end
end

class StatusReportJob
  def perform
    users = {}
    User.all.map do |user|
      users[user.name] = {
        name: user.last_subscription.name,
        status: user.last_subscription.status,
        trial_days: user.last_subscription.trial_days
      }
    end
    users
  end
end
```

## Big Method
```ruby
require 'csv'

class RowPerDayFormatter
  NO_DATA = -99.9

  def initialize(file_name)
    @file_name = file_name
    @dates = []
    @result = { '1' => {}, '2' => {} }
  end

  def call
    parse_csv_file_and_build_result
    parsed_data
  end

  private

  attr_reader :dates, :file_name, :result

  def parse_csv_file_and_build_result
    file = File.open file_name, 'r:ISO-8859-1'
    CSV.parse(file, col_sep: ';').each do |row|
      next if row.empty?
      next if row[0] =~ /^\/\//
      (13..43).each { |i| parse_and_populate_result(row, i) }
    end
  end

  def parsed_data
    dates.uniq.map do |date|
      parsed_row_for(date).join("\t") + "\n"
    end.join
  end

  def parsed_row_for(date)
    if bruto?(date)
      value = result['1'][date]
      [date, value[0], value[1]]
    elsif consistido?(date)
      value = result['2'][date]
      [date, value[0], value[1]]
    else
      # 'bruto' y 'consistido' (has new and old data)
      old_value = result['1'][date]
      new_value = result['2'][date]
      [date, new_value[0], old_value[1], old_value[0]]
    end
  end

  def bruto?(date)
    !result['1'][date].nil? && result['2'][date].nil?
  end

  def consistido?(date)
    result['1'][date].nil? && !result['2'][date].nil?
  end

  def parse_and_populate_result(row, i)
    date = Date.parse(row[2])
    measurement_date = date + (i-13)

    # If NumDiasDeChuva is empty it means no data
    value  = row[7].nil? ? NO_DATA : row[i]
    status = row[i + 31]

    dates << measurement_date
    nivel_consistencia = row[1]
    result[nivel_consistencia][measurement_date] = [value, status]
  end
end

class Formatter
  # More code, methods, and stuff in this big class

  def row_per_day_format(file_name)
    RowPerDayFormatter.new(file_name).call
  end

  # More code, methods, and stuff in this big class
end
```
