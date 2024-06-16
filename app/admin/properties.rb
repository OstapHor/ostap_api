ActiveAdmin.register Property do

  permit_params do
    permitted = [:property_type, :location, :price]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
