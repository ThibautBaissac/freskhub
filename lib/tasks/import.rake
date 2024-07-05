require "csv"

namespace :import do
  task countries: :environment do
    Country.destroy_all
    csv_text = File.read("resources/countries.csv")
    csv = CSV.parse(csv_text, headers: true, col_sep: ";")
    csv.each do |row|
      puts "importing row : #{row}"
      Country.create!(
        name: row[0],
        alpha2_code: row[1].upcase,
        alpha3_code: row[2].upcase
      )
    end
  end
end
