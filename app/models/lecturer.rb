class Lecturer < ActiveRecord::Base
	has_many :sections
end
