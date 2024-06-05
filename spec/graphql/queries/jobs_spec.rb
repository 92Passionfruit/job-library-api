require 'rails_helper'

RSpec.describe 'Jobs', type: :request do
    describe '.resolve' do
        it 'returns all jobs' do
            create_list(:job, 3)

            post '/graphql', params: { query: jobs_query }

            puts response.body  # Output the response body for inspection

            json = JSON.parse(response.body)

            data = json['data']['jobs']

            expect(data.size).to eq(3)
        end
    end

    def jobs_query
        <<~GQL
        query {
            jobs{
              id
              title
              scope
              ownership
              keyKnowledgeAndSkills
              jobFamily
              jobLevel
            }
          }
    GQL
    end
end
