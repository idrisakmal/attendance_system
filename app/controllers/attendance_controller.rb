class AttendanceController < ApplicationController
  
  layout "lectureradmin"
 

  def lecturer_sections
  	@lecturer = Lecturer.find(session[:user_id])
  	@sections = @lecturer.sections
  end

  def section_attendances
  	@student = Student.new
  	@section = Section.find(params[:id])
  	@students = @section.students
  end

  def student_attendances
  end

  def create_attendance

  	params[:attendance].each do |attendance_params|
   		Attendance.create(:day=>attendance_params[:day], :date=>attendance_params[:date], :status=>attendance_params[:status], :section_id=>attendance_params[:section_id], :student_id=>attendance_params[:student_id])
 	end
  	
  	redirect_to :action=>'lecturer_sections'
  end

  def attendance_sheets
  	@section = Section.new
  	@lecturer = Lecturer.find(session[:user_id])
  end

  def search_attendance_sheets
    redirect_to action: 'show_attendance_sheets', id: params[:section][:id]
  end

  def show_attendance_sheets
    
    @section = Section.find(params[:id])
    @attendances = @section.attendances

  end


  def attendance_sheets_by_date
    @dates = []
    
    @attendance = Attendance.new

    @attendances = Attendance.all
    
    @attendances.each do |a|
      @dates << a.date
    end
  end

  def search_attendance_sheets_by_date
    redirect_to action: 'show_attendance_sheets_by_date', id: params[:attendance][:day]
  end

  def show_attendance_sheets_by_date
    @date = params[:id]
    @attendances = Attendance.where({date: @date})

  end

 
  private
  def attendance_params2
  	params.require(:attendance).permit([attendances][], :day,:date,:status,:student_id,:section_id)
  end

end
