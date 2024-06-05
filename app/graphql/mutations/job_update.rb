module Mutations
  class JobUpdate < BaseMutation
    description "Updates a job by id"

    field :job, Types::JobType, null: false

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :scope, String, required: false
    argument :ownership, String, required: false
    argument :key_knowledge_and_skills, String, required: false
    argument :job_family, String, required: false
    argument :job_level, String, required: false

    def resolve(id:, title: nil, scope: nil, ownership: nil, key_knowledge_and_skills: nil, job_family: nil, job_level: nil)
      job = ::Job.find(id)

      updated_fields = {
        title: title,
        scope: scope,
        ownership: ownership,
        key_knowledge_and_skills: key_knowledge_and_skills,
        job_family: job_family ? JobFamily.find_by(name: job_family) : nil,
        job_level: job_level ? JobLevel.find_by(name: job_level) : nil
      }.reject { |_, v| v.nil? } # Remove nil values (fields keep original content)

      if job.update(updated_fields)
        { job: job }
      else
        raise GraphQL::ExecutionError.new("Error updating job", extensions: job.errors.to_hash)
      end
    end
  end
end
