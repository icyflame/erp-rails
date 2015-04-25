class Alumni < ActiveRecord::Base
	has_one :AlumniStatus
	has_one :AlumniData
	after_create :build_other_records

	private
	def build_other_records
		AlumniStatus.create({ :Alumni_id => self.id })
		AlumniData.create({ :Alumni_id => self.id })
		TieAlumniWithStudentMember.create({ :Alumni_id => self.id, :StudentMember_id => 0})
		true
	end
end
