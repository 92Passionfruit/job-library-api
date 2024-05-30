# frozen_string_literal: true

module Mutations
  class JobUpdate < BaseMutation
    description "Updates a job by id"

    field :job, Types::JobType, null: false

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :scope, String, required: true
    argument :ownership, String, required: true
    argument :key_knowledge_and_skills, String, required: true
    argument :job_family_id, ID, required: true
    argument :job_level_id, ID, required: true

    def resolve(id:, title:, scope:, ownership:, key_knowledge_and_skills:, job_family_id:, job_level_id:)
      job = ::Job.find(id)

      if job.update(
        title: title,
        scope: scope,
        ownership: ownership,
        key_knowledge_and_skills: key_knowledge_and_skills,
        job_family_id: job_family_id,
        job_level_id: job_level_id
      )
        { job: job }
      else
        raise GraphQL::ExecutionError.new("Error updating job", extensions: job.errors.to_hash)
      end
    end
  end
end
