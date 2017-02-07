class Attendance < ActiveRecord::Base
	
	STATUS_TYPES = ["Present", "Absent"]

	belongs_to :student
	belongs_to :section
end
