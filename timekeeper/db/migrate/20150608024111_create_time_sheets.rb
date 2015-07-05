class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
    	t.belongs_to :employee
    	t.belongs_to :payroll_cycle
    	t.text :notes
    end
  end
end
