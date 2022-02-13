require_relative '../models/customer'
require_relative 'base_repository'
require 'csv'
require 'pry-byebug'

class CustomerRepository < BaseRepository
  private

  def save_to_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["id", "name", "address"]
      @elements.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << Customer.new(id: row[:id], name: row[:name], address: row[:address])
    end
  end
end
