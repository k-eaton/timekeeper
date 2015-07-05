class CreatePayrollCycles < ActiveRecord::Migration
  def change
    create_table :payroll_cycles do |t|

    	t.integer :year
    	t.integer :cycle_number
    	t.datetime :start_date
    	t.datetime :end_date

    	t.timestamps

    end
  end
end
