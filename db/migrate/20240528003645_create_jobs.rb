class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :scope
      t.text :ownership
      t.text :key_knowledge_and_skills
      t.references :job_family, null: false, foreign_key: true
      t.references :job_level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
