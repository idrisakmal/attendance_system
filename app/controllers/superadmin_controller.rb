class SuperadminController < ApplicationController
  
  layout "superadmin"

  def dashboard
  	@lecturer = Lecturer.new
  end

  def lecturers
  	@lecturers = Lecturer.all
  end

  def edit_lecturer
    @lecturer = Lecturer.find(params[:id])
  end

  def update_lecturer
    @lecturer = Lecturer.find(params[:id])

    if @lecturer.update_attributes(lecturer_params)
      redirect_to :action=>'lecturers'
    else
      render('edit_lecturer')
    end
  end

  def delete_lecturer
    @lecturer = Lecturer.find(params[:id])
    @lecturer.destroy

    redirect_to :action=>'lecturers'
  end
  
  def create
  	@lecturer = Lecturer.new(lecturer_params)
  	if @lecturer.save
  		redirect_to :action=>'lecturers'
  	else
  		render('dashboard')
  	end

  end

  private
  def lecturer_params
  	params.require(:lecturer).permit(:first_name, :last_name, :username, :password, :contact_no)
  end

end
