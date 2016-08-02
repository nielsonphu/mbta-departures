require 'rails_helper'

RSpec.describe Trip, type: :model do
	STATUSES = ["On Time", "Cancelled", "Arriving", "End", "Now Boarding",
							"Info to follow", "Arrived", "All Aboard", "TBD", "Departed", "Delayed", "Late", "Hold"]

	describe 'validations' do
	  it { should validate_presence_of(:origin) }
	  it { should validate_presence_of(:trip) }
	  it { should validate_presence_of(:destination) }
	  it { should validate_presence_of(:scheduled_time) }
	  it { should validate_presence_of(:lateness) }
	  it { should validate_presence_of(:track) }
	  it { should validate_presence_of(:status) }
	  it { should allow_value("On Time").for(:status) }
	  it { should_not allow_value("other").for(:status) }
	end
end
