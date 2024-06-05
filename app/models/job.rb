class Job < ApplicationRecord
  validates :title, presence: true
  belongs_to :job_family
  belongs_to :job_level
end
