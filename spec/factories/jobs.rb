FactoryBot.define do
    factory :job do
        title { "Software Engineer" }
        scope { "Responsible for developing and maintaining software applications." }
        ownership { "To complete tasks assigned by tech lead and escalate issues when necessary." }
        key_knowledge_and_skills { "Ruby, Rails, React, Typescript, writing tests" }
        association :job_family
        association :job_level
    end
end
