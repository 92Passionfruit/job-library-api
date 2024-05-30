# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :job_delete, mutation: Mutations::JobDelete
    field :job_update, mutation: Mutations::JobUpdate
    field :job_create, mutation: Mutations::JobCreate
  end
end
