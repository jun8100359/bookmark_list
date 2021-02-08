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

