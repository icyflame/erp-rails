class DownCaseAlumniIdColumnNameInRegisteredAlumni < ActiveRecord::Migration
	def self.up
		remove_index "registered_alumnis", :name => "index_registered_alumnis_on_Alumni_id"
		rename_column :registered_alumnis, :Alumni_id, :alumni_id
		add_index "registered_alumnis", ["alumni_id"], name: "index_registered_alumnis_on_alumni_id"
	end
end
