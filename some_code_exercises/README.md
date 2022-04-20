# Algorithms and Data Structures 🥇

## Basic Rules
✅ **"When writing algorithms, time complexity and memory (space) are in balance"** <br>
✅ **"We use asymptotic notation to exclude less important cases, and ust focuses on running time"**

<p align="center">
  <img src="assets/complexity.png" />
</p>

## Running Time Rules (fastest(1) to slower(6)) (VARIES DEPENDING ON THE INPUT) ⏩
1. Constant functions `37`
   - For example when you find in first itaration, we say O(1)

3. Logarithmic functions `log n`
   - When an algorithm decreases the magnitude of its input size each time.
   - Time increases lineary, while input(n) exponentially. (10 = 1s) (100 - 2s) (10000 - 4s)
   - At each iteration array is halved

4. Linear functions `37n`
   - When the leght of the input increases linearly with the size of the input

6. Linearithmic functions `n log n`
   - Divide and put back together

7. Polynomial functions `n^2`
   - Used in nested loops (When an iteration over array is done x times, in this case 2)

9. Exponential functions `2^n` (AVOID USING THIS ONE)
   - Doubles the magnitude with each increment in the data set. ( n = 3 // 8 operations, n = 10 // 1024 operations 😥)

<p align="center">
  <img src="assets/graph.jpeg" />
</p>

## Searching 🔎
> **Binary Search:**
> - **_Complexity: (Running Time/Asymptotic Notation)_**
>   - O(log n)
>   - Ω(1)
> - **_Space Complexty:_**
>   - O(1)
> - **_Explanation:_**
>   - `Partions array into halves each iteration`
> - **_Example:_**

```javascript
// BINARY SEARCH EXAMPLE:
let array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,,16,17]
let targetValue = 15
let min;
let max;

for ( let i = o; i < array.length, i++) {
  guess = Math.floor((min + max) / 2)
  if (array[guess] === targetValue) {
    return guess;
  } else if (array[guess] > targetValue) {
    max = guess - 1;
  } else {
    min = guess +  1;
  }
  return -1;
}
```

## Sorting 🔀 [ Θ(nlogn) is probably the best time we can achieve]
<p align="center">
  <img src="assets/sorting_table.jpeg" />
</p>

> **Binary Sort:**
> - **_Complexity:_**
>   - Θ(nlogn)
>   - O(nlogn)
>   - Ω(n)
> - **_Space Complexty:_**
>   - O(n) No other varieble than themporary is required

> **Selection Sort:**
> - **_Complexity:_**
>   - Θ(n^2) All cases regardless of the input (Nested Loops)
> - **_Space Complexty:_**
>   - O(1)
> - **_Explanation:_**
>   - `This algorithm is called selection sort because it repeatedly selects the next-smallest element and swaps it into place.`

> **Insertion Sort:**
> - **_Complexity:_**
>   - Θ(n^2)
>   - O(n^2)
>   - Ω(n) (array may be sorted)
> - **_Space Complexty:_**
>   - (edit here)
> - **_Explanation:_**
>   - `Having a key and compare it with i'ts left element, if element > than key, slide element to right, insert key when element < key `

> **Quicksort:**
> - **_Complexity:_**
>   - Θ(nlogn)
>   - O(nlogn)
>   - Ω(n)
> - **_Space Complexty:_**
>   - (edit here)

> **Merge Sort:**
> - **_Complexity:_**
>   - (edit here)
> - **_Space Complexty:_**
>   - (edit here)
> - **_Explanation:_**
>   - `Partions array into halves and merges two halves in linear time.`

# Writing Clean code 🥇

## Basic Rules
✅ **"Code describes itself"**
✅ **"Less than 100 lines class"**
✅ **"Methods with 5 lines or less"**
✅ **"Methdos with 4 arguments or less"**
✅ **"A controllers instantiates only one object"**

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
