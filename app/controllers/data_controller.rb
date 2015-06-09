class DataController < ApplicationController
	def addmore
		allRows = Array.new

		# CSV Arrangement
		# Name Dept Year Hall

		counter = 0

		CSV.foreach("public/list-assets/list-66.csv") do |row|
			row[2] = row[2].delete(' ') # remove space from year
			allRows.push(row)

			a = Alumni.new
			a.name = row[0]
			a.year = row[2]
			if row[3]
				a.hall = row[3]
			end

			a.department = row[1]

			a.save!
			allRows.push(row)

			counter += 1
		end

		puts counter

		render plain: allRows.inspect()

	end
end
