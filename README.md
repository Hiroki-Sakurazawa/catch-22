# アプリケーション名
## Catch22
# アプリケーション概要
# URL
# テスト用アカウント
# 利用方法
# 目指した課題解決
# 洗い出した要件
# 実装した機能についてのGIFと説明
# 実装予定の機能
# データベース設計
# ローカルでの動作方法
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| surname1    | string | null: false |
| first_name1 | string | null: false |
| surname2    | string | null: false |
| first_name2 | string | null: false |
| dob         | date   | null: false |

### Association

- has_many :items
- has_one :order

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| status_id   | integer | null: false |
| fee_id      | integer | null: false |
| area_id     | integer | null: false |
| day_id     | integer | null: false |
| price       | integer | null: false |
| user        | references | foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| zip_code | string | null: false |
| prefecture_id | integer | null: false |
| city          | string | null: false |
| house_num     | string | null: false |
| building      | string |
| phone         | string | null: false |
| order | references | foreign_key: true |

### Association

- belongs_to :order