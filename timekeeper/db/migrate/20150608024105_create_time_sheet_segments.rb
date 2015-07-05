class CreateTimeSheetSegments < ActiveRecord::Migration
  def change
    create_table :time_sheet_segments do |t|
    	t.belongs_to :project
    	t.belongs_to :employee
    	t.belongs_to :payroll_cycle

    end
  end
end
