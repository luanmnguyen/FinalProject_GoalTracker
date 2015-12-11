class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :answer_text
      t.date :questioned_on
      t.integer :question_id
      t.integer :goal_id

      t.timestamps

    end
  end
end
