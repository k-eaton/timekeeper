require 'date'

class Calendar < Struct.new(:view, :date, :callback)
	HEADER = %w[Date Prog1 Prog2 Prog3 Prog4 Subtotal]
	START_DAY = :sunday

	delegate :content_tag, to: :view

	def table
		content_tag :table, class: "calendar table table-bordered" do
				header + week_rows
		end
	end

	def header
		content_tag :tr do
			HEADER.map { |day| content_tag :th, day, :colspan => 2 }.join.html_safe
		end
	end

	def week_rows
		weeks.map do |week|
			content_tag :tr do
				week.map { |day| day_cell(day) }.join.html_safe
			end
		end.join.html_safe
	end

  def day_cell(day)
    content_tag :td, view.capture(day, &callback), class: day_classes(day)
  end

  def day_classes(day)
  	# current_day = Date.parse(day)
    classes = []
    classes << "grey" if day.strftime('%a') == "Sun"
    classes << "grey" if day.strftime('%a') == "Sat"
    classes.empty? ? nil : classes.join(" ")
  end

	def weeks
		# first = date.beginning_of_month.beginning_of_week(START_DAY)

		first = Date.new(date.year, date.month, 1)		
		last = Date.new(date.year, date.month, -1)
    # last = date.end_of_month.end_of_week(START_DAY)
		(first..last).to_a.in_groups_of(1)
	end
end
			

