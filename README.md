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
	- フォロー機能
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
![signup](https://user-images.githubusercontent.com/111602501/193008591-159922b2-48ed-4835-8247-ffe29f991773.png)


**■ ログイン** <br>
- ヘッダーのボタンからログインページへ遷移します。
- 登録したemailとpasswordを入力してログインできます。
![login](https://user-images.githubusercontent.com/111602501/193008624-419acbc2-09d7-41c6-bf8e-c482795d7e24.png)


**■ ログアウト** <br>
- ヘッダーのボタンからログアウトできます。
![logout](https://user-images.githubusercontent.com/111602501/193007625-f4282138-7c6d-42f4-bec0-9b865477781a.png)

**■ 新規投稿** <br>
- ヘッダーのボタンから新規投稿ページへ遷移します。  
- フォームの項目を埋め`投稿する`ボタンを押すことで投稿できます。  
- 画像とタグは任意ですので空欄でも登録できます。
- タグを複数付ける際はカンマ(,)で区切ってください。
- 非公開を選択すると自身以外には表示されません。
![newitem](https://user-images.githubusercontent.com/111602501/193012262-fd8702d9-44a6-4a5d-9b89-8e4889e7e10e.gif)

**■ 投稿詳細** <br>
- 投稿の画像もしくはタイトルを押すことで詳細ページへ遷移できます。
![show](https://user-images.githubusercontent.com/111602501/193020027-8ce01473-2aee-4cc9-a930-890face3cbe6.png)

**■ 投稿編集** <br>
- 詳細ページに表示されている`編集する`ボタンから編集ページへ遷移できます。
- 変更したい内容を入力し、`投稿する`ボタンを押すことで更新されます。
![itemedit](https://user-images.githubusercontent.com/111602501/193014513-3c827612-5bc5-4c24-8d33-f86f293fbad5.png)

**■ 投稿削除** <br>
- 詳細ページに表示されている`削除する`ボタンを押します。
- 確認のポップアップが表示されるので`OK`を押すと削除できます。
![itemdelete](https://user-images.githubusercontent.com/111602501/193014500-b17e8c19-0da9-42ce-b558-d2ff8daaaf96.png)  
![itemdeletepopup](https://user-images.githubusercontent.com/111602501/193015582-aa7bb674-5f03-45c1-b02f-101f530b81f0.png)

**■ コメント** <br>
- 詳細ページのコメントフォームからコメントを投稿できます。
![comment1](https://user-images.githubusercontent.com/111602501/193017785-d7d7c44b-7d6a-4c22-b902-7714022686f0.png)
![comment2](https://user-images.githubusercontent.com/111602501/193019650-f7e2ed76-a3a7-4725-be87-052c530ed2f6.png)

**■ お気に入り** <br>
- 詳細ページの`☆`ボタンでお気に入りの登録・解除ができます。
![fav](https://user-images.githubusercontent.com/111602501/193018981-385c7c19-6d49-4b15-ab87-4c0071154238.gif)

**■ ユーザーページ** <br>
- 各所にあるユーザー名は全てユーザーページへのリンクとなっています。
- そのユーザーの情報と投稿一覧・お気に入り一覧が表示されます。
- 投稿一覧とお気に入り一覧はタブで切り替えることができます。
![userpage](https://user-images.githubusercontent.com/111602501/193012106-49d22694-1b9e-4cde-90df-07b90dfdfa27.gif)

**■ ユーザー編集** <br>
- ユーザーページに表示されている`編集する`ボタンから編集ページへ遷移できます。
- 変更したい内容を入力し、`更新`ボタンを押すことで更新されます。  
![useredit](https://user-images.githubusercontent.com/111602501/193016765-08338800-ce48-430c-99b5-c411a6bfc7ca.png)

**■ フォロー機能** <br>
- 他者のユーザーページに表示されている`フォローする`/`フォロー解除`ボタンからフォローの追加/解除が行えます。
![follow](https://user-images.githubusercontent.com/111602501/195545940-11b1be76-b918-47aa-8aa2-3b9414e69588.gif)
- フォロー、フォロワーの人数表示のテキストをクリックすると一覧表示ページへ遷移します。
![follow_list](https://user-images.githubusercontent.com/111602501/195545929-05730332-dce1-4c3d-a05d-3567586f2cc2.gif)

**■ 退会** <br>
- ユーザーページに表示されている`退会する`ボタンを押します。
- 確認のポップアップが表示されるので`OK`を押すと退会できます。  
![userdelete](https://user-images.githubusercontent.com/111602501/193017243-6116eb71-a672-4e55-b21b-2b678b1893f3.png)  
![userdeletepopup](https://user-images.githubusercontent.com/111602501/193015745-5fe23e05-0524-43b6-bcf7-313623bdcdbe.png)

## 要件定義
https://docs.google.com/spreadsheets/d/16LiXE-mEF6-J9wt-PE7YuuDJBTi-owIQ3sx1BWgZ4IQ/edit#gid=982722306
## 実装予定の機能
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
- has_many :follower, class_name: "Follows"
- has_many :followed, class_name: "Follows"


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

## follows テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| follower | references | null: false, foreign_key: true |
| followee | references | null: false, foreign_key: true |

### Association

- belongs_to :follower, class_name: "User"
- belongs_to :followee, class_name: "User"
