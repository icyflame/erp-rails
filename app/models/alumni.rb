class Alumni < ActiveRecord::Base
	has_one :AlumniStatus
	has_one :AlumniData
	has_one :TieAlumniWithStudentMember
	after_create :build_other_records
	before_destroy { |record| AlumniStatus.destroy_all "Alumni_id = #{record.id}"   }
	before_destroy { |record| AlumniData.destroy_all "Alumni_id = #{record.id}"   }
	before_destroy { |record| TieAlumniWithStudentMember.destroy_all "Alumni_id = #{record.id}"   }

	private
	def build_other_records
		AlumniStatus.create({ :Alumni_id => self.id })
		AlumniData.create({ :Alumni_id => self.id })
		TieAlumniWithStudentMember.create({ :Alumni_id => self.id, :StudentMember_id => 0})
		true
	end
end
