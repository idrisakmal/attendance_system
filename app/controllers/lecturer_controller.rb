class LecturerController < ApplicationController
  
  layout "lectureradmin"
  
  before_action :auth_user

  def auth_user
  	if(session[:user_id] == "")
  		redirect_to :controller=>'home', :action=>'sign_in'
  	end
  end

  def dashboard
  	
  end

  def sections
  	@lecturer = Lecturer.find(session[:user_id])
  	@sections = @lecturer.sections
  end

  def new_section
  	@section = Section.new
  end

  def create_section
  	@section = Section.new(section_params)

  	if @section.save
  		redirect_to :action=>'sections'
  	else
  		render('dashboard')
  	end

  end

  

  def edit_section
  	@section = Section.find(params[:id])
  end

  def update_section
    @section = Section.find(params[:id])
  	if @section.update_attributes(section_params)
      redirect_to :action=>'sections'
    else
      redirect_to :action=>'edit_section'
    end
    
  end

  def destroy_section
  	@section = Section.find(params[:id])
    @section.destroy
    redirect_to :action=>'sections'
  end

  #STUDENT

  def new_student
  	@student = Student.new
  end

  def create_student
  	@student = Student.new(student_params)
  	
  	if @student.save
  		redirect_to(:action=>'dashboard')
  	else
  		render('new_student')
  	end

  end

  def section_students
  	@section = Section.find(params[:id])
  	@students = @section.students
  end

  def edit_student
    @student = Student.find(params[:id])
  end

  def update_student
    @student = Student.find(params[:id])

    if @student.update_attributes(student_params)
      redirect_to :action=>'sections'
    else
      render('edit_student')
    end
  end

  def delete_student
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to :action=>'sections'
  end

  private
  def section_params
  	params.require(:section).permit(:name, :lecturer_id)
  end

  def student_params
  	params.require(:student).permit(:first_name,:last_name,:username,:password,:contact_no,section_ids: [])
  end

  

end
