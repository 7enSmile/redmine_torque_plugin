class WebhooksTorqueController < ApplicationController
  skip_before_action :verify_authenticity_token
  def init
    data = JSON.parse(request.body.read)
    issue = Issue.new
    issue.project = Project.find_by_id(Setting.plugin_redmine_torque_plugin[:torque_project])
    issue.assigned_to = User.find_by_id(Setting.plugin_redmine_torque_plugin[:torque_user_assignee])
    issue.subject = data["job_id"]
    issue.description = "job info\n
                         job_id: #{data["job_id"]} \n
                         job_name: #{data["job_name"]} \n
                         job_owner: #{data["job_owner"]} \n
                         queue: #{data["queue"]}\n
                         "
    issue.status = IssueStatus.find_by_name("New")
    issue.priority = IssuePriority.find_by_name("Normal")
    issue.author = User.find_by_id(1)
    issue.tracker = Tracker.find_by_name("Support")
    issue.save
  


  end
end
