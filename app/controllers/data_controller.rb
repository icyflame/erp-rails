class DataController < ApplicationController
	'''
	CSV Arrangement
	Name Dept Year Hall
	'''

	def addmore
		if not ((student_member_signed_in? and current_student_member.id == 0) or (coordinator_signed_in? and current_coordinator.id == 0))
			render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
			return
		end

		allRows = Array.new

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

	def backup

		if not student_member_signed_in? and not coordinator_signed_in?
			render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
			return
		end

		Alumni.all.to_comma(:filename => "backup.csv")

		fin = File.open "public/mail-templates/backup.html"
		html_text = fin.read
		fin.close

		mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
		mb_obj = Mailgun::MessageBuilder.new

		mb_obj.set_from_address("no-reply@erp.alumnicell.com", {"first"=>"SAC", "last" => "Internal ERP"});

		if student_member_signed_in?
			puts current_student_member.email.to_s
			mb_obj.add_recipient(:to, current_student_member.email.to_s);
		end
		
		if coordinator_signed_in?
			mb_obj.add_recipient(:to, current_coordinator.email.to_s);
		end

		mb_obj.set_subject("Backup of all the data in the SAC ERP System");
		mb_obj.set_text_body("We have attached the required CSV file.");
		mb_obj.set_html_body(html_text);
		mb_obj.add_attachment("backup.csv", "Alumni-all-data.csv");

		mg_client.send_message(ENV['MAILGUN_SENDING_DOMAIN'], mb_obj)

		File.delete('backup.csv')

		render plain: "Mail sent! :D"
	end
end
