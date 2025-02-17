class HelpTask < ApplicationRecord
  belongs_to :user
  has_many :help_tasks_applications, dependent: :destroy

  enum status: { "未着手": 0, "着手中": 1, "完了": 2 }
end
