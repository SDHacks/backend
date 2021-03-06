ActiveAdmin.register Hacker do
  # permit_params :id, :email

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :authentication_token
    column "Resume" do |resume|
      result = ""
      if !resume.nil?
        result = "+"
      end
      result
    end
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
  end
end
