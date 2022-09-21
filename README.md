# **Motto**

## アプリケーション概要
### アプリケーション名
Motto
### コンセプト
「自分の持ち物を整理する」
### 開発経緯
ペルソナはコレクションが趣味の方に設定しました。  
買い物をする際に、「これ持っていたかな？」とわからなくなった経験はありませんか？
特にコレクションが増えてくると把握するのが難しくなってきます。  
また、すぐに確認できる状況であれば問題ありませんが、外出時だと困りますよね？  
そんな問題を解決したく、持ち物を画像付きで管理できるアプリケーションの開発に至りました。
### 名前の由来
「`Motto`」実はこのアプリ名は英語でもイタリア語でもないんです。  
私の地元福岡では「持っている」を方言で「もっとぉ」と言います。
そう由来は`博多弁`なんです。
「これ`持っとー`かな？」と思った時に「`持っとー`よ」と返してもらえるようにという思いで命名しました。

## URL
https://motto-38380.herokuapp.com/

### Basic認証
- ID：tc131tsb
- Pass： 38380

### テスト用アカウント
現在準備中です。。。

## 機能一覧
- ユーザー管理機能
	- 新規登録機能
	- ログイン機能
	- マイページ
- 投稿機能
  - タグ付け機能（複数可）
  - 投稿の公開範囲設定機能
  - 詳細表示機能
  - 編集・削除機能
  - コメント機能
  - お気に入り機能（他ユーザーの投稿）

## 利用方法

## 要件定義
https://docs.google.com/spreadsheets/d/16LiXE-mEF6-J9wt-PE7YuuDJBTi-owIQ3sx1BWgZ4IQ/edit#gid=982722306
## 実装予定の機能
- フォロー機能
- 検索機能

## データベース設計
- ER図

- 画面遷移図

## 開発環境
- HTML,CSS
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 14.14
- JavaScript
- heroku
- RSpec
## ローカルでの動作方法
## 工夫したポイント

# テーブル
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :favorites

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| content    | text       | null: false                    |
| privacy_id | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :tags, through: :item_tags
- has_many :item_tags
- belongs_to_active_hash :privacy
- has_many :favorites

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| text       | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## tags テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tag_name   | string     | null: false                    |

### Association

- has_many :items, through: :item_tags
- has_many :item_tags

## item_tags テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| tag        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :tag

## favorites テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item