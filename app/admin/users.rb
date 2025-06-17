ActiveAdmin.register User do
  permit_params :email, :password_digest, :rating
    
end
