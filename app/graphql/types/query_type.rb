module Types
  class QueryType < Types::BaseObject
    # Defining jobs
    field :jobs, [Types::JobType], null: true, description: "Fetches all jobs" do
      argument :job_level, String, required: false
      argument :job_family, String, required: false
      argument :title, String, required: false
    end

    # Jobs resolver
    def jobs(job_level: nil, job_family: nil, title: nil)
      jobs = Job.includes(:job_level, :job_family)

      # Case-insensitive using ILIKE
      jobs = jobs.joins(:job_level).where('job_levels.name ILIKE ?', "%#{job_level}%") if job_level
      jobs = jobs.joins(:job_family).where('job_families.name ILIKE ?', "%#{job_family}%") if job_family
      jobs = jobs.where('title ILIKE ?', "%#{title}%") if title


      jobs
    end

    field :job, Types::JobType, null: false, description: "Fetch a single job by id" do
      argument :id, ID, required: true
    end

    def job(id:)
      Job.find(id)
    end
  end
end
