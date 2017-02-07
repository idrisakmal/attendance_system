class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
      t.string :contact_no

      t.timestamps null: false
    end
  end
end
