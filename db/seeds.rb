require 'faker'

# Clear existing data to avoid duplicates
Job.destroy_all
JobFamily.destroy_all
JobLevel.destroy_all

# Create sample job families
job_families = ["Engineering", "Security", "Human Resources", "Product", "Design", "Data", "Operations"]
job_families.each do |family|
    JobFamily.create!(name: family)
end

# Create sample job levels
job_levels = ["Individual Contributor", "Senior Individual Contributor", "Manager", "Senior Leader", "Executive"]
job_levels.each do |level|
    JobLevel.create!(name: level)
end

# Create sample jobs
20.times do
    Job.create!(
        title: Faker::Job.title,
        scope: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
        ownership: Faker::Lorem.paragraphs(number: 2).join("\n\n"),
        key_knowledge_and_skills: Faker::Lorem.paragraphs(number: 4).join("\n\n"),
        job_family: JobFamily.order('RANDOM()').first,
        job_level: JobLevel.order('RANDOM()').first
    )
end

puts "Seeded #{JobFamily.count} job families, #{JobLevel.count} job levels, and #{Job.count} jobs."
