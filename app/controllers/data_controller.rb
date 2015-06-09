class DataController < ApplicationController
	def addmore
		
		if not ((student_member_signed_in? and current_student_member.id == 0) or
			 (coordinator_signed_in? and current_coordinator.id == 0))
			render plain: "You don't have access to this page."
			return
		end

		allRows = Array.new

		# CSV Arrangement
		# Name Dept Year Hall

		counter = 0

		require('open-uri')

		open('file.csv', 'wb') do |file|
			file << open(ENV['GIST_DATA_URL']).read
		end

		CSV.foreach('file.csv') do |row|
			
			row[2] = row[2].delete(' ') # remove space from year

			a = Alumni.new
			a.name = row[0]
			a.year = row[2]
			if row[3]
				a.hall = row[3]
			end

			a.department = row[1]


			counter	+= 1

			# if counter < 20
			# 	next
			# end

			if not a.save!
				allRows.push(row)
			end

			# if counter > 30
			# 	break
			# end
		end

		puts counter

		allRows.push(counter)

		File.delete('file.csv')

		render plain: allRows.inspect()

	end
end
