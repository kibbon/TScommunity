class DeviseCustomed::RegistrationsController < Devise::RegistrationsController  
  def new  
    super  
  end  
  
  def create  
    # add custom create logic here  
    super do |resource|  
      resource.name = params[:person][:name]  
	  resource.usertype = params[:person][:usertype]
    end  
  end  
  
  def update  
    super  
  end  
end   