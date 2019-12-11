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