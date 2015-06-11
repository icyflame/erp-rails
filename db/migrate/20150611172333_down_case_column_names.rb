class DownCaseColumnNames < ActiveRecord::Migration
	def self.up

		remove_index "alumni_data", :name => "index_alumni_data_on_Alumni_id"
		remove_index "alumni_statuses", :name => "index_alumni_statuses_on_Alumni_id"
	  remove_index "tie_alumni_with_student_members", :name => "index_tie_alumni_with_student_members_on_Alumni_id"
	  remove_index "tie_alumni_with_student_members", :name => "index_tie_alumni_with_student_members_on_StudentMember_id"

		rename_column :alumni_data, :Alumni_id, :alumni_id
  	rename_column :alumni_statuses, :Alumni_id, :alumni_id
  	rename_column :tie_alumni_with_student_members, :Alumni_id, :alumni_id
  	rename_column :tie_alumni_with_student_members, :StudentMember_id, :studentmember_id

		add_index "alumni_data", ["alumni_id"], name: "index_alumni_data_on_alumni_id"
		add_index "alumni_statuses", ["alumni_id"], name: "index_alumni_statuses_on_alumni_id"
	  add_index "tie_alumni_with_student_members", ["alumni_id"], name: "index_tie_alumni_with_student_members_on_alumni_id"
	  add_index "tie_alumni_with_student_members", ["studentmember_id"], name: "index_tie_alumni_with_student_members_on_studentMember_id"

	end

	def self.down

		remove_index "alumni_data", :name => "index_alumni_data_on_alumni_id"
		remove_index "alumni_statuses", name: "index_alumni_statuses_on_alumni_id"
	  remove_index "tie_alumni_with_student_members", :name => "index_tie_alumni_with_student_members_on_alumni_id"
	  remove_index "tie_alumni_with_student_members", :name => "index_tie_alumni_with_student_members_on_studentMember_id"

		rename_column :alumni_data, :alumni_id, :Alumni_id
  	rename_column :alumni_statuses, :alumni_id, :Alumni_id
  	rename_column :tie_alumni_with_student_members, :alumni_id, :Alumni_id
  	rename_column :tie_alumni_with_student_members, :studentmember_id, :StudentMember_id

		add_index "alumni_data", ["Alumni_id"], name: "index_alumni_data_on_alumni_id"
		add_index "alumni_statuses", ["Alumni_id"], name: "index_alumni_statuses_on_alumni_id"
	  add_index "tie_alumni_with_student_members", ["Alumni_id"], name: "index_tie_alumni_with_student_members_on_alumni_id"
	  add_index "tie_alumni_with_student_members", ["StudentMember_id"], name: "index_tie_alumni_with_student_members_on_studentMember_id"

	end
end
