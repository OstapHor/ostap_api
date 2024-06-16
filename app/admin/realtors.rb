ActiveAdmin.register Realtor do

  permit_params do
    permitted = [:username, :email, :rating, :contactinfo]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
