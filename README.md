![logo](https://user-images.githubusercontent.com/111602501/192486146-9412097a-1854-483e-9f6b-3d3d27329409.png)
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
  - テスト１
    - メールアドレス名：test@mail
    - パスワード：test11
  - テスト2
    - メールアドレス：test2@mail
    - パスワード：test22

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
**■ 権限** <br>
- 共通
  - 投稿一覧、投稿の詳細・コメント、ユーザーベージの閲覧

- ログアウトユーザー
  - ログイン/新規登録

- ログインユーザー
  - ログアウト/新規投稿
  - ユーザー情報の編集、退会
  - 投稿へのコメント
  - 自身の投稿の編集・削除
  - 他者の投稿をお気に入りへ登録・解除

**■ 新規登録** <br>
- ヘッダーのボタンから新規登録ページへ遷移します。  
- フォームの項目を埋め`新規登録`ボタンを押すことで登録できます。  

**■ ログイン** <br>
- ヘッダーのボタンからログインページへ遷移します。
- 登録したemailとpasswordを入力してログインできます。

**■ ログアウト** <br>
- ヘッダーのボタンからログアウトできます。

**■ 新規投稿** <br>
- ヘッダーのボタンから新規投稿ページへ遷移します。  
- フォームの項目を埋め`投稿する`ボタンを押すことで投稿できます。  
- 画像とタグは任意ですので空欄でも登録できます。
- タグを複数付ける際はカンマ(,)で区切ってください。
- 非公開を選択すると自身以外には表示されません。

**■ 投稿詳細** <br>
- 投稿の画像もしくはタイトルを押すことで詳細ページへ遷移できます。

**■ 投稿編集** <br>
- 詳細ページに表示されている`編集する`ボタンから編集ページへ遷移できます。
- 変更したい内容を入力し、`投稿する`ボタンを押すことで更新されます。

**■ 投稿削除** <br>
- 詳細ページに表示されている`削除する`ボタンを押します。
- 確認のポップアップが表示されるので`OK`を押すと削除できます。

**■ コメント** <br>
- 詳細ページのコメントフォームからコメントを投稿できます。

**■ お気に入り** <br>
- 詳細ページの`いいね！`ボタンでお気に入りの登録・解除ができます。

**■ ユーザーページ** <br>
- 各所にあるユーザー名は全てユーザーページへのリンクとなっています。
- そのユーザーの情報と投稿一覧・お気に入り一覧が表示されます。
- 投稿一覧とお気に入り一覧はタブで切り替えることができます。

**■ ユーザー編集** <br>
- ユーザーページに表示されている`編集する`ボタンから編集ページへ遷移できます。
- 変更したい内容を入力し、`更新`ボタンを押すことで更新されます。

**■ 退会** <br>
- ユーザーページに表示されている`退会する`ボタンを押します。
- 確認のポップアップが表示されるので`OK`を押すと退会できます。

## 要件定義
https://docs.google.com/spreadsheets/d/16LiXE-mEF6-J9wt-PE7YuuDJBTi-owIQ3sx1BWgZ4IQ/edit#gid=982722306
## 実装予定の機能
- フォロー機能
- 検索機能

## データベース設計
- ER図
![image](https://user-images.githubusercontent.com/111602501/192487541-9207ecd0-72fb-4a0d-9ab8-42242d1288d9.png)

## 開発環境
- HTML,CSS
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 14.14
- JavaScript
- heroku
- RSpec

## 工夫したポイント
**■ 他ユーザーとの繋がり** <br>
自分のコレクションを投稿するので同じ趣味の人を見つけやすいのでは？と考えました。  
そのためユーザー同士コミュニケーションが取れるように`コメント`機能、`お気に入り`機能を実装致しました。  

**■ プライバシー** <br>
上記とは反対に自身の持ち物管理としてのみに利用したい場合を考え、投稿に`公開範囲の設定`ができるようにしました。  

**■ 管理のしやすさ** <br>
「コレクションを整理したい」という課題の解決のために`タグ付け`機能を実装しました。
また複数のタグを付けることが出来るようにした点もポイントです。


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
