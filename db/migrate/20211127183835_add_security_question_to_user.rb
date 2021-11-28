class AddSecurityQuestionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :security_question, :text
    add_column :users, :encrypted_security_answer, :text
    add_column :users, :encrypted_security_answer_iv, :text
  end
end
