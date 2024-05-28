class CreateJobLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :job_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
