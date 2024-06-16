ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Users" do
          ul do
            User.order(created_at: :desc).limit(10).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Recent Realtors" do
          ul do
            Realtor.order(created_at: :desc).limit(10).map do |realtor|
              li link_to(realtor.username, admin_realtor_path(realtor))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Recent Properties" do
          ul do
            Property.order(created_at: :desc).limit(10).map do |property|
              li link_to(property.property_type, admin_property_path(property))
            end
          end
        end
      end

      column do
        panel "Recent Contracts" do
          ul do
            Contract.order(created_at: :desc).limit(10).map do |contract|
              li link_to(contract.details, admin_contract_path(contract))
            end
          end
        end
      end
    end

  
  end # content
end
