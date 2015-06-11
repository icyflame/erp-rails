class Alumni < ActiveRecord::Base
	has_one :AlumniStatus
	has_one :AlumniData
	has_one :TieAlumniWithStudentMember
	after_create :build_other_records
	before_destroy { |record| AlumniStatus.destroy_all "alumni_id = #{record.id}"   }
	before_destroy { |record| AlumniData.destroy_all "alumni_id = #{record.id}"   }
	before_destroy { |record| TieAlumniWithStudentMember.destroy_all "alumni_id = #{record.id}"   }

	private
	def build_other_records
		AlumniStatus.create({ :alumni_id => self.id })
		AlumniData.create({ :alumni_id => self.id })
		TieAlumniWithStudentMember.create({ :alumni_id => self.id, :studentmember_id => 0})
		true
	end
end
