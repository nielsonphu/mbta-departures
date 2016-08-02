class Trip < ActiveRecord::Base
	STATUSES = ["On Time", "Cancelled", "Arriving", "End", "Now Boarding",
							"Info to follow", "Arrived", "All Aboard", "TBD", "Departed", "Delayed", "Late", "Hold"]

	validates :origin, presence: true
	validates :trip, presence: true
	validates :destination, presence: true
	validates :scheduled_time, presence: true
	validates :lateness, presence: true
	validates :track, presence: true
	validates :status, presence: true, inclusion: { in:  STATUSES }
end
