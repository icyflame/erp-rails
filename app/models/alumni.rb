class Alumni < ActiveRecord::Base
	has_one :AlumniStatus
	has_one :AlumniData
	has_one :TieAlumniWithStudentMember
	after_create :build_other_records
	before_destroy { |record| AlumniStatus.destroy_all "alumni_id = #{record.id}"   }
	before_destroy { |record| AlumniData.destroy_all "alumni_id = #{record.id}"   }
	before_destroy { |record| TieAlumniWithStudentMember.destroy_all "alumni_id = #{record.id}"   }

	comma do
		id "ID"
		name
		year "Graduation year"
		department
		hall "Hall"

    AlumniData :company
    AlumniData :designation
    AlumniData :home_address => "Home Address"
    AlumniData :office_address
    AlumniData :home_phone
    AlumniData :office_phone
    AlumniData :mobile_phone
    AlumniData :email1 => "Primary Email"
    AlumniData :email2 => "Secondary Email"
    AlumniData :payment_details
    AlumniData :call_next_at

    AlumniStatus  :search
    AlumniStatus  :response

    TieAlumniWithStudentMember :studentmember_id
	end

	private
	def build_other_records
		AlumniStatus.create({ :alumni_id => self.id })
		AlumniData.create({ :alumni_id => self.id })
		TieAlumniWithStudentMember.create({ :alumni_id => self.id, :studentmember_id => 0})
		true
	end
end
