namespace :ranks do
  namespace :chapter2 do
    desc 'chapter2 ゲーム内のユーザーランキング情報を変更'
    task update: :environment do
      # 現在のランキング情報をリセット
      Rank.delete_all
      # ユーザー毎にスコアの合計を計算する
      user_total_score = User.all.map do |user|
        {
          user_id: user.id,
          total_score: user.user_scores.sum(&:score)
        }
      end
      # スコア合計の降順に並べ替え、そこからランキング情報を再作成する
      sorted_total_score_groups = user_total_score
                      .group_by { |score| score[:total_score] }
                      .sort_by { |score, _| score * -1 }
                      .to_h
                      .values

      sorted_total_score_group.each_with_index(1) do |user_total_scores, i|
        user_total_scores.each do |user_total_score|
          Rank.create(
            user_id: user_total_score[:user_id],
            rank: i,
            score: user_total_score[:total_score]
            )
        end
      end
    end
  end
end
