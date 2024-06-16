ActiveAdmin.register Rating do

  permit_params do
    permitted = [:user_id, :realtor_id, :property_id, :final_rating, :security_rating, :infrastructure_rating, :location_to_city_center_rating, :maintenance_rating, :neighborhood_rating]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
