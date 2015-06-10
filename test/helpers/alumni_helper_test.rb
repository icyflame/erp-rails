require 'test_helper'

class AlumniHelperTest < ActionView::TestCase
	test "should create alumniStatus record" do
		a = Alumni.new
		if a.save
			assert_equal AlumniStatus.where({Alumni_id: a.id}).length, 1
		end
	end
	test "should create TieAlumniWithStudentMember record" do
		a = Alumni.new
		if a.save
			assert_equal TieAlumniWithStudentMember.where({Alumni_id: a.id}).length, 1
		end
	end
	test "should create AlumniData record" do
		a = Alumni.new
		if a.save
			assert_equal AlumniData.where({Alumni_id: a.id}).length, 1
		end
	end	
end
