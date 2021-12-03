class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks, comment: 'ランキング情報' do |t|
      t.references :user, null: false, index: { unique: true }, foreign_key: { on_delete: :cascade, on_update: :cascade }, comment: 'ユーザー'
      t.integer :rank, null: false, default: 0, index: true, comment: '順位'
      t.integer :score, null: false, default: 0, comment: 'このランクに至ったスコア'

      t.timestamps
    end
  end
end
