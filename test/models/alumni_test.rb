require 'test_helper'

class AlumniTest < ActiveSupport::TestCase

	test "number_of_records_being_created" do
		a = Alumni.count
		assert_equal a, 10, "The ten alumni were not created"
	end

	test "records_being_created" do
		a = Alumni.find(5)
		assert_equal a.id, 5, "The ID is not equal"
	end

	# test "validations_of_columns" do
	# 	alumni = Alumni.new
	# 	alumni.name = "Something"
	# 	assert_not alumni.save, "The alumni was saved even though there was no hall or department given."
	# end
  # test "the truth" do
  #   assert true
  # end
end
