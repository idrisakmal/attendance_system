class CreateSectionStudents < ActiveRecord::Migration
  def change
    create_table :section_students, :id=>false do |t|

      t.belongs_to :section, index: true
      t.belongs_to :student, index: true
      
      t.timestamps null: false
    end
  end
end
