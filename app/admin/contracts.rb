ActiveAdmin.register Contract do
  permit_params :user_id, :property_id, :realtor_id, :details
  
end
