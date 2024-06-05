require 'rails_helper'

RSpec.describe 'JobUpdate', type: :request do
    describe '.resolve' do
      let!(:job) { create(:job, title: 'Old Title') }

      it 'updates a job' do
        post '/graphql',
             params: {
               query: job_update_mutation,
               variables: variables
             }.to_json,
             headers: { 'Content-Type' => 'application/json' }

        expect(Job.find(job.id).title).to eq('New Title')
      end

      it 'returns an updated job' do
        post '/graphql',
             params: {
               query: job_update_mutation,
               variables: variables
             }.to_json,
             headers: { 'Content-Type' => 'application/json' }

        json = JSON.parse(response.body)
        data = json['data']['jobUpdate']

        expect(data).not_to be_nil
        expect(data['job']).not_to be_nil
        expect(data['job']['title']).to eq('New Title')
      end
    end

    def job_update_mutation
      <<~GQL
        mutation($id: ID!, $title: String!) {
          jobUpdate(input: {
            id: $id,
            title: $title
          }) {
            job {
              id
              title
            }
          }
        }
      GQL
    end

    def variables
      {
        id: job.id,
        title: 'New Title'
      }
    end
  end
