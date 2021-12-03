class CreateUserScores < ActiveRecord::Migration[6.0]
  def change
    create_table :user_scores, comment: 'ユーザーが獲得した得点' do |t|
      t.references :user, null: false, index: true, foreign_key: { on_delete: :cascade, on_update: :cascade }, comment: 'ユーザー'
      t.integer :score, null: false, default: 0, comment: '得点'
      t.datetime :received_at, null: false, index: true, comment: '得点を獲得した日時'

      t.timestamps
    end
  end
end
