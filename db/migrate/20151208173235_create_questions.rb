class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :cadence
      t.text :question_text
      t.integer :goal_id

      t.timestamps

    end
  end
end
