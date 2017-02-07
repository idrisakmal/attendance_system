class HomeController < ApplicationController
  
  def sign_in
  end

  def sign_in_post

  	if(params[:username] == "admin@admin.com" && params[:password] == "admin")
      redirect_to :controller => 'superadmin', :action => 'dashboard'
    else

      @lecturer = Lecturer.where(:username=>params[:username],:password=>params[:password]).first
      
      if @lecturer.nil?
        respond_to do |format|   
          msg = { :status => 0, :message => "Fail!", :html => "<b>...</b>" }
            format.json  { render :json => msg }
            session[:user] = ""
            session[:user_id] = ""
        end    
      else
        respond_to do |format|   
          msg = { :status => 1, :message => "success!", :html => "<b>...</b>" }
            format.json  { render :json => msg }
            session[:user] = @lecturer.first_name + " " + @lecturer.last_name
            session[:user_id] = @lecturer.id
        end
      end 
    end 
  end

  def edit_profile
  end

  def sections
  end

  def logout
    session[:user] = ""
    session[:user_id] = ""
    redirect_to :controller => 'home', :action => 'sign_in'

  end

end
