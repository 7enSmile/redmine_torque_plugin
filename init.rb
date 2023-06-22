Redmine::Plugin.register :redmine_torque_plugin do
  name 'Redmine Torque Plugin plugin'
  author 'Semen Pankratov'
  description 'This plugin is for integrating torque and redmine'
  version '0.0.1'
  url 'https://github.com/7enSmile/redmine_torque_plugin'
  author_url 'https://github.com/7enSmile'
  settings :partial => 'settings/torque_settings'
end
