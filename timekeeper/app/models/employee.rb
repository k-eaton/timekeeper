require 'bcrypt'

class Employee < ActiveRecord::Base

	include BCrypt

	has_many :work_segments
	has_many :time_sheets
	has_many :time_sheet_segments

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end



end