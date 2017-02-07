class Section < ActiveRecord::Base
	
	belongs_to :lecturer

	has_many :section_students
	has_many :students, :through=>:section_students

	has_many :attendances
end

