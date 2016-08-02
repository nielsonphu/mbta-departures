FactoryGirl.define do
	factory :trip do
		origin "North Station"
		trip 123
		destination "Salem"
		scheduled_time Time.now
		lateness "00:00:00"
		track status "On Time"
	end
end