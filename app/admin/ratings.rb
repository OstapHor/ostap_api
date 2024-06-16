ActiveAdmin.register Rating do
  permit_params :user_id, :realtor_id, :property_id, :final_rating, :security_rating, :infrastructure_rating, :location_to_city_center_rating, :maintenance_rating, :neighborhood_rating
    
end
