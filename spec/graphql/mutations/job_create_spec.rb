require 'rails_helper'

RSpec.describe 'JobCreate', type: :request do
  describe '.resolve' do
    let!(:job_family) { create(:job_family, name: 'Engineering') }
    let!(:job_level) { create(:job_level, name: 'Individual Contributor') }

    it 'creates a job' do
      expect {
        post '/graphql',
             params: {
               query: job_create_mutation,
               variables: variables
             }.to_json,
             headers: { 'Content-Type' => 'application/json' }

        puts "Response: #{response.body}"
      }.to change { Job.count }.by(1)
    end

    it 'returns a job' do
      post '/graphql',
           params: {
             query: job_create_mutation,
             variables: variables
           }.to_json,
           headers: { 'Content-Type' => 'application/json' }

      puts "Response: #{response.body}"

      json = JSON.parse(response.body)
      data = json.dig('data', 'jobCreate', 'job')

      expect(data['title']).to eq('Software Engineer')
      expect(data['jobFamily']).to eq('Engineering')
      expect(data['jobLevel']).to eq('Individual Contributor')
    end
  end

  def job_create_mutation
    <<~GQL
      mutation createJob($title: String!, $scope: String!, $ownership: String!, $keyKnowledgeAndSkills: String!, $jobFamily: String!, $jobLevel: String!) {
        jobCreate(input: {
          title: $title,
          scope: $scope,
          ownership: $ownership,
          keyKnowledgeAndSkills: $keyKnowledgeAndSkills,
          jobFamily: $jobFamily,
          jobLevel: $jobLevel
        }) {
          job {
            title
            scope
            ownership
            keyKnowledgeAndSkills
            jobFamily
            jobLevel
          }
        }
      }
    GQL
  end

  def variables
    {
      title: "Software Engineer",
      scope: "Responsible for developing and maintaining software applications.",
      ownership: "To complete tasks assigned by tech lead and escalate issues when necessary.",
      keyKnowledgeAndSkills: "Ruby, Rails, React, Typescript, writing tests",
      jobFamily: "Engineering",
      jobLevel: "Individual Contributor"
    }
  end
end


# def job_create_mutation
#     <<~GQL
#     mutation createJob {
#         jobCreate(input: {
#             title: "Software Engineer",
#             scope: "Development",
#             ownership: "Full Stack",
#             keyKnowledgeAndSkills: "Ruby, Rails, GraphQL",
#             jobFamily: "Engineering",
#             jobLevel: "Individual Contributor"
#         }) {
#         job {
#             id
#             title
#             scope
#             ownership
#             keyKnowledgeAndSkills
#             jobFamily
#             jobLevel
#             }
#         }
#     }
#     GQL
# end
