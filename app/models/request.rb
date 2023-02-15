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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :message, presence: true
  validates :message, length: {minimum: 10, maximum: 500}
  validates :subject, presence: true, inclusion: {in: SUBJECTS}
end
