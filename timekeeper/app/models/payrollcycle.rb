class PayrollCycle < ActiveRecord::Base

has_many :time_sheet_segments
has_many :time_sheets
has_many :work_segments

end