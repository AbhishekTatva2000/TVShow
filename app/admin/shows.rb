ActiveAdmin.register Show do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :time, :chanel_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :time, :chanel_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: 'Shows' do |f|
    text_node javascript_include_tag Ckeditor.cdn_url
    inputs 'Details' do
      f.input :chanel
      f.input :name
      f.input :description , as: :ckeditor
      f.input :time
    end
    actions
  end


end
