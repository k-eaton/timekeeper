class WorkSegment < ActiveRecord::Base

	has_one :project
	has_one :employee
	has_one :payroll_cycle

end