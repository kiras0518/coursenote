class CreateCourseEntries < ActiveRecord::Migration
   def change
    create_table :course_entries do |t|
      t.integer :course_id
      t.string :course_code, null: false
      t.integer :timetable, null: false, default: 0
      
      t.timestamps null: false
    end

    add_index :course_entries, :course_id
    add_index :course_entries, :course_code
  end
end