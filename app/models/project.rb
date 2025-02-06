class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
end
