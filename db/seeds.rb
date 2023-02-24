ActiveRecord::Base.transaction do
  ["common", Rails.env].each do |enviorment|
    seed_file = Rails.root.join("db/seeds/#{enviorment}.rb")
    if File.exist?(seed_file)
      require seed_file
    end
  end
end
