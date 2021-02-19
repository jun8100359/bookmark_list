# アプリ名
## BookMarkList

# 概要
URLにタイトルとメモをつけて管理ができ、リストでジャンル等に分けて管理ができます。

# 本番環境


# 制作意図
調べ物を多くする人が、ブックマーク機能で管理したいときにより内容が分かりやすく、管理しやすくしたかったためです。

# 工夫したポイント
よく使うであろうメモをクリックで表示させる機能は非同期通信で実装しました。

# 使用技術
- ruby
- rails
- HTML
- CSS
- JavaScript

# 課題や今後実装したい機能
- リストやブックマークの並び替え
- タイトル検索
- タグを付け、タグ検索機能

# テーブル設計
## usersテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| password |string | null: false |

### Association
- has_many: lists
- has_many: bookmarks

## listsテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| list_name | string | null: false |
| user_id | references | null: false, foreign_key: true |

### Association
- has_many: bookmarks
- belongs_to: user

## bookmarksテーブル
 | Column | Type | Option |
 | ------ | ---- | ------ |
 | title | string | null: false |
 | url | string | |
 | text | text | |
 | user_id | references | null: false, foreign_key: true |
 | list_id | references | null: false, foreign_key: true |

 ### Association
 - belongs_to: user
 - belongs_to: list

