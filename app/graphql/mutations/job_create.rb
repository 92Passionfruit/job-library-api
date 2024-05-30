# frozen_string_literal: true

module Mutations
  class JobCreate < BaseMutation
    description "Creates a new job"

    field :job, Types::JobType, null: false

    argument :title, String, required: true
    argument :scope, String, required: true
    argument :ownership, String, required: true
    argument :key_knowledge_and_skills, String, required: true
    argument :job_family_id, ID, required: true
    argument :job_level_id, ID, required: true

    def resolve(title:, scope:, ownership:, key_knowledge_and_skills:, job_family_id:, job_level_id:)
      job = Job.new(
        title: title,
        scope: scope,
        ownership: ownership,
        key_knowledge_and_skills: key_knowledge_and_skills,
        job_family_id: job_family_id,
        job_level_id: job_level_id
      )
      if job.save
        { job: job }
      else
        raise GraphQL::ExecutionError.new("Error creating job", extensions: job.errors.to_hash)
      end
    end
  end
end
