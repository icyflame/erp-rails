class AllotmentController < ApplicationController
  def allot
    ids_to_allot = (5..22).to_a

    alum_to_allot = Alumni.where(:year => '1966')
    # alum_to_allot = (0..619).to_a

    num_to_allot_each = alum_to_allot.count / ids_to_allot.count
    num_to_allot_each = 35

    iterator = 0

    alum_to_allot.each do |alumnus|
      temp = TieAlumniWithStudentMember.where(:alumni_id => alumus.id).first
      # temp.alumni_id        = alumnus.id.to_i
      studentmember_index = (iterator / num_to_allot_each)
      if studentmember_index >= ids_to_allot.count
        puts 'Overflow!'
      else
        temp.studentmember_id = ids_to_allot[studentmember_index]
        puts temp.alumni_id.to_s + ' alumnus allotted to student member ' + temp.studentmember_id.to_s
        # temp.save!
      end
      iterator += 1
    end
  end
end
