class ChangeColumnNamesInRegisteredAlumni < ActiveRecord::Migration
  def self.up
  	rename_column :registered_alumnis, :industry, :org_industry
    rename_column :registered_alumnis, :profession, :org_profession
    rename_column :registered_alumnis, :designation, :org_designation

    rename_column :registered_alumnis, :roll_number, :insti_roll_number
    rename_column :registered_alumnis, :join_year, :insti_join_year
    rename_column :registered_alumnis, :degree, :insti_degree
    rename_column :registered_alumnis, :department, :insti_department
    rename_column :registered_alumnis, :hall, :insti_hall
    rename_column :registered_alumnis, :year_of_graduating, :insti_year_of_graduating
  end
end
