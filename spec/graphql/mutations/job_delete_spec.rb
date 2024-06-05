require 'rails_helper'

RSpec.describe 'JobDelete', type: :request do
    describe '.resolve' do
      let!(:job) { create(:job) }
      let(:job_delete_mutation) do
        <<~GQL
          mutation DeleteJob($id: ID!) {
            jobDelete(input: { id: $id }) {
              message
            }
          }
        GQL
      end

      it 'deletes a job' do
        expect {
          post '/graphql',
               params: { query: job_delete_mutation, variables: { id: job.id } }.to_json,
               headers: { 'Content-Type' => 'application/json' }

          puts "Request: #{JSON.pretty_generate({ query: job_delete_mutation, variables: { id: job.id } })}"
          puts "Response: #{response.body}"
        }.to change { Job.count }.by(-1)

        expect(response.body).to include('Job deleted successfully')
      end
    end
  end
