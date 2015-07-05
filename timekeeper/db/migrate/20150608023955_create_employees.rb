class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
    	t.string :last_name
    	t.string :first_name
    	t.string :middle_initial
    	t.string :email
    	t.string :password_hash
    	t.string :status

    	t.timestamps
    end
  end
end
