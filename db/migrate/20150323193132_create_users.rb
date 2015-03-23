class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :location
      t.string :twitter_handle
      t.boolean :female
      t.string :student_coach
      t.boolean :beginner

      t.timestamps null: false
    end
  end
end
