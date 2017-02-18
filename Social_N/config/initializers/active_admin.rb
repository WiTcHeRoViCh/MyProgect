ActiveAdmin.setup do |config|
  config.authentication_method = :authenticate_admin_user!
  config.site_title = "Social N"
  config.logout_link_path = :destroy_user_session_path
  config.batch_actions = true
  config.localize_format = :long
end
