class TimeSheet < ActiveRecord::Base

	has_one :employee
	has_one :payroll_cycle

end