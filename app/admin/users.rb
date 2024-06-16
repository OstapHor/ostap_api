ActiveAdmin.register User do

  permit_params do
    permitted = [:email, :password, :rating]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
