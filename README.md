# アプリケーション名
## Catch22
# アプリケーション概要
## 心霊・オカルト・都市伝説情報の共有サイト
# URL
# テスト用アカウント
# 利用方法
## ユーザーが体験した心霊・オカルト・都市伝説現象を写真と説明文と共に投稿する。投稿や他ユーザーの写真にコメントするためにはユーザー登録が必要となる。ニックネーム・メールアドレス・パスワードを登録することでユーザー登録ができる。体験していなくても共有したい情報があれば投稿できる。気になった投稿にコメントができる。
# 目指した課題解決
## オカルトマニアやオカルト体験をした人達のオカルト専門の情報共有の場がない。ユーザーが体験した出来事や発信したい情報を共有できるプラットフォームを提供することで「発信したい・新しい情報を知りたい」というユーザーの願望を実現する。
# 洗い出した要件
## 新規登録ログインページ
### ユーザー管理機能によって遷移できるページを制限する。特定のユーザーの投稿を表示する。
## トップページ
### 投稿された写真を一覧表示する。
## 写真の投稿ページ
### 新規の写真を投稿する。
## 写真の詳細ページ
### 写真についての説明文やコメントを表示する。コメントが入力できる。
## 投稿の編集ページ
### 投稿した内容を編集する。
## マイページ
### 特定ユーザーの投稿のみ一覧表示する。
# 実装した機能についてのGIFと説明
# 実装予定の機能
## 新規登録ログインページ
## トップページ
## 写真の投稿ページ
## 写真の詳細ページ
## 投稿の編集ページ
## マイページ
# データベース設計
# ローカルでの動作方法

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