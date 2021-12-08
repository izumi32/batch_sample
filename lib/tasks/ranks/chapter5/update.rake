require 'objspace'

namespace :ranks do
  namespace :chapter5 do
    desc 'chapter5 ゲーム内のランキング情報を更新'
    task update: :environment do
      # スタート時点のメモリ消費量を記録
      Development::UsedMemoryReport.instance.write('start batch')

      # 実行時間を測定
      Benchmark.bm 10 do |r|
        r.report 'RanksUpdater' do
          Chapter5::RanksUpdater.new.update_all
        end
      end

      # 終了時点のメモリ消費量を記録
      Development::UsedMemoryReport.instance.write('end batch')
      # メモリ消費量を出力
      Development::UsedMemoryReport.instance.puts_all
    end
  end
end
