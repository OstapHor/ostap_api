ActiveAdmin.register User do
  permit_params :email, :password, :rating
    
end
