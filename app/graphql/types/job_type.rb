module Types
  class JobType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :scope, String
    field :ownership, String
    field :key_knowledge_and_skills, String
    field :job_family, String, null: true
    field :job_level, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def job_family
      object.job_family.name
    end

    def job_level
      object.job_level.name
    end
  end
end
