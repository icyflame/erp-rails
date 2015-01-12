class TieAlumniWithStudentMember < ActiveRecord::Base
  belongs_to :Alumni
  belongs_to :StudentMember
end
