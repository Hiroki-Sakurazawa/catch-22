# アプリケーション名
## catch-22
# アプリケーション概要
## オカルト情報の記事投稿サイト
# URL
## https://catch-22.herokuapp.com/
# テスト用アカウント
## メールアドレス:sakura@sakura　　パスワード:sakura
# 利用方法
## ユーザーのオカルト体験や発信したい情報を写真と説明文で投稿する。気になった他ユーザーの投稿にコメントすることができる。投稿やコメントをするためにはユーザー登録が必要となる。ニックネーム・メールアドレス・パスワードを登録することでユーザー登録ができる。
# 目指した課題解決
## オカルトマニアやオカルト体験をした人達のオカルト専門の情報共有の場がない。ユーザーが体験した出来事や発信したい情報を共有できるプラットフォームを提供することで「発信したい・共有したい・新しい情報を知りたい」というユーザーの願望を実現する。投稿式の雑誌形式で利用してもらう。
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
## https://gyazo.com/2321850678615892475d695b403eb715
# ローカルでの動作方法
# テーブル設計
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :pictures
- has_many :comments

## pictures テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| text   | text   | null: false |
| user   | references | foreign_key: true |
| genre_id   | integer   | null: false |

### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| text    | text   | null: false |
| user    | references | foreign_key: true |
| picture | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :picture