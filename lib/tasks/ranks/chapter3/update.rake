namespace :ranks do
  namespace :chapter3 do
    desc 'chapter3 ゲーム内のランキング情報を更新'
    task update: :environment do
      RanksUpdater.new.update_all
    end
  end
end
