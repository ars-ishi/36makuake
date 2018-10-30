module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def supporter_array(project)
    Order.where(project_id: project.id).map { |item| item[:user_id] }
  end

  def success_check(project)
    if project.total_sales >= project.target_sales
      'success'
    else
      'not_success'
    end
  end
end
