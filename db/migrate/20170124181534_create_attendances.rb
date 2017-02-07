class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :day
      t.date :date
      t.string :status

      t.belongs_to :student, index: true
      t.belongs_to :section, index: true

      t.timestamps null: false
      
    end
  end
end
