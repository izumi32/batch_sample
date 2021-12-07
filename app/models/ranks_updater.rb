class RanksUpdater

  def update_all
    Rank.transaction do
      # ランキングをリセット
      Rank.delete_all
      # ユーザー毎のスコアの合計を降順に並べ替え、ランキングを作成する
      create_ranks
    end
  end

  private

  def create_ranks
    RankOrderMaker.new.each_ranked_user do |user, rank|
      Rank.create(
        user_id: user.id,
        rank: rank,
        score: user.total_score
      )
    end
  end

end
