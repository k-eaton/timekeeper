class CreateWorkSegments < ActiveRecord::Migration
  def change
    create_table :work_segments do |t|
    	t.belongs_to :project
    	t.belongs_to :employee
    	t.belongs_to :payroll_cycle
    	t.datetime :date
    	t.float :hours

    end
  end
end
