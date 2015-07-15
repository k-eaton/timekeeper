

class Calendar < Struct.new(:view, :date, :callback)
	HEADER = %w[Date Prog1 Prog2 Prog3 Prog4 Subtotal]

	delegate :content_tag, to: :view

	def table
		content_tag :table, class: "calendar table table-bordered" do
				if date.strftime('%d').to_i >= 16
					header + pay_period2
				else
					header + pay_period1
				end
		end
	end

	def header
		content_tag :tr do
			HEADER.map { |column| content_tag :th, column, :colspan => 2 }.join.html_safe
		end
	end

	def pay_period1
		# if date.strftime('%a') == "Sun" || date.strftime('%a') == "Sat"
			days1.map do |day|
				content_tag :tr do
					day.map { |day| day_cell(day) }.join.html_safe
				end
			end.join.html_safe
		# else
			# days1.map do |day|
			# 	content_tag :tr do
			# 		day.map { |day| day_cell(day) }.join.html_safe
			# 	end
			# end.join.html_safe
		# end
	end

	def pay_period2
		# if date.strftime('%a') == "Sun" || date.strftime('%a') == "Sat"
			days2.map do |day|
				content_tag :tr do
					day.map { |day| day_cell(day)}.join.html_safe
				end
			end.join.html_safe
		# else
			# days2.map do |day|
			# 	content_tag :tr do
			# 		day.map { |day| day_cell(day)}.join.html_safe
			# 	end
			# end.join.html_safe
		# end
	end

	def day_name(day)
		content_tag :td, view.capture(day.strftime('%a'), &callback), class: day_classes(day)
	end

  def day_cell(day)
    content_tag :td, view.capture(day, &callback), class: day_classes(day)
  end

  def day_classes(day)
    classes = []
    classes << "grey" if day.strftime('%a') == "Sun"
    classes << "grey" if day.strftime('%a') == "Sat"
    classes.empty? ? nil : classes.join(" ")
  end

	def days1
		# if date.day <= 15
			first = Date.new(date.year, date.month, 1)		
			fifteen = Date.new(date.year, date.month, 15)
		# end
		(first..fifteen).to_a.in_groups_of(1)
	end

	def days2
		sixteen = Date.new(date.year, date.month, 16)
		last = Date.new(date.year, date.month, -1)
		(sixteen..last).to_a.in_groups_of(1)
	end

end
			

