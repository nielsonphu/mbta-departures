require 'csv'

# parses MBTA departure csv data and imports them as Trip records
# invoked by import.rake
class Importer

	def dir
		@dir ||= Rails.root.join('datafiles')
	end

  def import(file_name)
    ActiveRecord::Base.transaction do
      CSV.foreach("#{dir}/#{file_name}", headers: true) do |row|
        Trip.create!(
          origin: row["Origin"],
          trip: row["Trip"].to_i,
          destination: row["Destination"],
          scheduled_time: Time.at(row["ScheduledTime"].to_i).to_datetime,
          lateness: "#{row["Lateness"]} seconds",
          track: row["Track"].to_i,
          status: row["Status"]
        )
      end
    end
  end
end