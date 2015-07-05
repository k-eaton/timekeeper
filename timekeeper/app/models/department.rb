class Department < ActiveRecord::Base

	has_many :work_segments
	has_many :time_sheet_segments
	
end