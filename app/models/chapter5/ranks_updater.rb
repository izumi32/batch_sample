module Chapter5
  class RanksUpdater

    def update_all
      Rank.transaction do
        # ランキングをリセット
        Rank.delete_all
        Development::UsedMemoryReport.instance.write('after Rank.delete_all')
        # ユーザー毎のスコアの合計を降順に並べ替え、ランキングを作成する
        create_ranks
      end
    end

    private

    def create_ranks
      ranks = []
      RankOrderMaker.new.each_ranked_user do |user, rank|
        ranks << {
          user_id: user.id,
          rank: rank,
          score: user.total_score
        }
      end
      Development::UsedMemoryReport.instance.write('after RankOrderMaker.new.each_ranked_user')

      # ranksをranksテーブルにINSERT
      Rank.import ranks

      Development::UsedMemoryReport.instance.write('after Rank.import')
    end

  end
end
