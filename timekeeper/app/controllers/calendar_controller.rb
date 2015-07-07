class CalendarController < ApplicationController
  def show
  	# @date = params[:date] ? Date.parse(params[:date]) : Date.today
  	@today = Date.today
  	if params[:date]
  		@date = Date.parse(params[:date])
  	else
  		if Date.today.day >= 16
  			@date = Date.new(@today.year, @today.month, 16)
  		else
  			@date = Date.new(@today.year, @today.month, 1)
  		end
  	end
  end
end
