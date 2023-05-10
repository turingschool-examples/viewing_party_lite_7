module ApplicationHelper
  def get_host_name(id)
    User.where(id: id).pluck(:name).first
  end
end
