crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", users_path
end

crumb :logout do
  link "ログアウト", root_path
  parent :mypage
end

crumb :notice do
  link "お知らせ", root_path
  parent :mypage
end

crumb :todo do
  link "やることリスト", root_path
  parent :mypage
end

crumb :cash do
  link "支払い方法", root_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", root_path
  parent :mypage
end