class RemoveStudentOrCoach < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.remove :student_coach
  	end
  end
end
