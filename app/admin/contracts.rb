ActiveAdmin.register Contract do

  permit_params do
    permitted = [:user_id, :property_id, :realtor_id, :details]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
