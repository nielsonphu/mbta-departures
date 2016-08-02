require 'rails_helper'

RSpec.describe Importer, type: :model do
	describe '#import' do
		let(:sample_row) do
			{
	  		"TimeStamp" => 1470078520,
	  		"Origin" => "North Station",
	  		"Trip" => "211",
	  		"Destination" => "Haverhill",
	  		"ScheduledTime" => 1470078900,
	  		"Lateness" => 0,
	  		"Track" => "4",
	  		"Status" => "On Time"
	  	}
		end

		let(:importer) { Importer.new }

	  it 'creates Trip records from csv rows' do
	  	allow(importer).to receive(:dir).and_return("datafiles")
	  	expect(CSV).to receive(:foreach).with("datafiles/target.csv", headers: true).and_yield(sample_row)
	  	expect(Trip).to receive(:create!).with({
        origin: "North Station",
        trip: 211,
        destination: "Haverhill",
        scheduled_time: Time.at(1470078900).to_datetime,
        lateness: "0 seconds",
        track: 4,
        status: "On Time"
	  	})
	  	importer.import("target.csv")
	  end

	  it 'does not save any records if an error is raised' do
	  	sample_row_2 = sample_row.clone
	  	# Cause an exception to be raised when creating a record from sample_row_2
	  	sample_row_2["Origin"] = nil
	  	allow(CSV).to receive(:foreach).and_yield(sample_row).and_yield(sample_row_2)
	  	begin
	  		importer.import("target.csv")
	  	rescue => e
	  		expect(Trip.count).to eq(0)
	  	end
	  end
	end
end
