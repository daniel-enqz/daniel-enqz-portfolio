ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE") unless table == "schema_migrations"
end

# Reviews
def create_reveiw(request)
  Review.create!(
    first_name: request.first_name,
    last_name: request.first_name,
    email: request.email,
    rating: rand(1..5),
    message: Faker::Lorem.paragraph
  )
end

# Requests
10.times do |i|
  start_time = Request::AVAILABLE_TIMES[1..].sample
  end_time = Time.zone.parse(start_time) + rand(1..5).hours

  request = Request.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    subject: Request::SUBJECTS[1..].sample,
    message: Faker::Lorem.paragraph,
    date: Date.current + rand(1..5).days,
    start_time: start_time,
    end_time: end_time,
    timezone: "Mexico City"
  )
  create_reveiw(request)
end
