# frozen_string_literal: true

module Mutations
  class JobDelete < BaseMutation
    description "Deletes a job by ID"

    field :message, String, null: false

    argument :id, ID, required: true

    def resolve(id:)
      job = ::Job.find(id)
      raise GraphQL::ExecutionError.new "Error deleting job", extensions: job.errors.to_hash unless job.destroy!

      { message: 'Job deleted successfully' }
    end
  end
end
