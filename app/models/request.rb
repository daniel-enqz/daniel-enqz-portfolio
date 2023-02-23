class Request < ApplicationRecord
  SUBJECTS = ["",
    "Project Review",
    "General Programming Questions",
    "Ruby on Rails application review",
    "Programming Fundamentals",
    "Ruby on Rails Fundamentals",
    "Data Structures and Algorithms",
    "Interview Prep",
    "Other"].freeze

  AVAILABLE_TIMES = ["3:00pm",
    "3:30pm",
    "4:00pm",
    "4:30pm",
    "5:00pm",
    "5:30pm",
    "6:00pm",
    "6:30pm",
    "7:00pm",
    "7:30pm",
    "8:00pm"].freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :message, presence: true
  validates :message, length: {minimum: 25, maximum: 500}
  validates :subject, presence: true, inclusion: {in: SUBJECTS}
  validates :date, presence: true, availability: true
  validates :time, presence: true, inclusion: {in: AVAILABLE_TIMES}

  def available_times
    available_times = []
    self.class::AVAILABLE_TIMES.each do |time|
      available_times << time if available_time?(time)
    end
  end

  def available_time?(time)
    !self.class.all.any? do |request|
      request.date == date && request.time == time
    end
  end
end
