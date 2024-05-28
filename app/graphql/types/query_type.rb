module Types
  class QueryType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :scope, String
    field :ownership, String
    field :key_knowledge_and_skills, String
    field :job_family_name, String
    field :job_level_name, String
    field :testField, String, null: false,
      description: "A test field for demonstration purposes."

    # Resolver method for the job_family_name field
    def job_family_name
      object.job_family.name
    end

    # Resolver method for the job_level_name field
    def job_level_name
      object.job_level.name
    end

    # Resolver method for the testField
    def testField
      "Hello, world!"
    end

    # Resolver method for the jobs field
    def jobs
      Job.all
    end
  end
end
