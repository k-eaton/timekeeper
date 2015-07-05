class TimeSheetSegment < ActiveRecord::Base

	has_one :employee
	has_one :project
	has_one :payroll_cycle

end