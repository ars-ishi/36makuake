class ProjectComment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many   :project_comment_responses, dependent: :destroy
end
