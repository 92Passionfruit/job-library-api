class Job < ApplicationRecord
  belongs_to :job_family
  belongs_to :job_level
end
