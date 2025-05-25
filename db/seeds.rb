# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

menus_data = [
  { name: 'カツカレー', price: 350, is_available_today: true, image_url: 'katsu_curry.jpg',
    description: 'サクサク揚げたてロースカツと特製カレーが絶妙にマッチ！ボリューム満点の一品です。' },
  { name: 'からあげ', price: 150, is_available_today: true, image_url: 'karaage.jpg',
    description: 'ジューシーな鶏もも肉をカリッと揚げた、みんな大好き定番のからあげです。' },
  { name: 'チーズ乗せ牛丼（並）', price: 350, is_available_today: true, image_url: 'chigyu.jpg',
    description: 'とろーりチーズと甘辛い牛肉の組み合わせがたまらない！ご飯が進む一杯です。' },
  { name: 'メロンパン', price: 150, is_available_today: true, image_url: 'meron_pan.jpg',
    description: '外はサクサク、中はふんわりとした甘いメロンパン。小腹が空いた時にぴったりです。' },
  { name: 'トーストセット', price: 250, is_available_today: true, image_url: 'to_suto.jpg',
    description: '焼きたてトーストとサラダ、ドリンクがセットになった軽食メニューです。朝食にもどうぞ。' },
  { name: 'カツカレー定食', price: 400, is_available_today: false, image_url: 'kathu_curry_teisyoku.jpg',
    description: 'ロースカツとカレーに、さらに味噌汁と小鉢が付いた大満足の定食です。' },
  { name: 'イクラ丼', price: 350, is_available_today: true, image_url: 'ikura.jpg',
    description: 'プチプチとした食感が楽しいイクラをたっぷり乗せた、見た目も華やかな丼ぶりです。' },
  { name: 'もやしラーメン', price: 300, is_available_today: false, image_url: 'moyashi.jpg',
    description: 'シャキシャキもやしがたっぷり入った、あっさり醤油ベースのラーメンです。' },
  { name: 'お好み焼き', price: 300, is_available_today: true, image_url: 'okonomiyaki.jpg',
    description: 'ふわふわ生地にキャベツと豚肉がたっぷり！特製ソースとマヨネーズでどうぞ。' },
  { name: '小ラーメン', price: 250, is_available_today: true, image_url: 'ramen.jpg',
    description: '手軽に食べられる、ちょうどいいサイズのあっさり醤油ラーメン。もう一品欲しい時に。' },
  { name: '汁なし担々麺', price: 350, is_available_today: false, image_url: 'tan.jpg',
    description: 'ラー油と花椒の痺れる辛さが食欲をそそる、本格的な汁なし担々麺です。' },
  { name: '白米', price: 100, is_available_today: true, image_url: 'kamameshi.jpg',
    description: 'ふっくら炊き上げた、つやつやの美味しい白米です。どんなおかずにも合います。' },
]

# 各メニューデータに対して、nameが同じ場合は更新（find_or_initialize_by）、ない場合は新規作成（create）
menus_data.each do |data|
  menu = Menu.find_or_initialize_by(name: data[:name])
  menu.assign_attributes(data) # 他の属性（price, image_url, descriptionなど）を更新
  menu.save! # 保存（バリデーション失敗時は例外を発生）
end

# 古いデータを削除したい場合は以下のコメントを外してください
# Menu.where.not(name: menus_data.map { |d| d[:name] }).destroy_all

puts "メニューデータが更新されました。"