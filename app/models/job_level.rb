class JobLevel < ApplicationRecord
    has_many :jobs

    validates :name, presence: true, uniqueness: true
end
