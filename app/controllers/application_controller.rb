class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_ability
    @current_ability ||= Ability.new(current_person)
  end
  
  def after_sign_in_path_for(resource)
   if resource.is_a?(Person)
     if resource.usertype == 'teacher'
       resource.add_role 'teacher'
	 else
	   resource.add_role 'student'
     end
     resource
   end
   root_path
 end
end
