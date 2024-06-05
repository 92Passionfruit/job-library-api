require 'rails_helper'

RSpec.describe Job, type: :model do
    it "is valid with valid attributes" do
        job = build(:job)
        expect(job).to be_valid
    end

    it "is not valid without a title" do
        job = build(:job, title: nil)
        expect(job).to_not be_valid
    end

    it "is not valid without a job_family" do
        job = build(:job, job_family: nil)
        expect(job).to_not be_valid
    end

    it "is not valid without a job_level" do
        job = build(:job, job_level: nil)
        expect(job).to_not be_valid
    end

end
