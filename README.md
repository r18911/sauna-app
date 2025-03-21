# テーブル設計

## users テーブル（ユーザー情報）
| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| role               | integer| null: false, default: 0        |

**role**: `0 = 一般ユーザー`, `1 = 管理者`

### Association
- has_many :reservations
- has_many :notifications
- has_many :saunas, through: :reservations


## rooms テーブル（サウナ情報）
| Column       | Type   | Options                        |
|--------------|--------|--------------------------------|
| name         | string | null: false                    |
| description  | text   | null: false                    |
| size         | integer| null: false                    |
| bed_type     | string | null: false                    |
| facilities   | text   | null: false                    |
| capacity     | integer| null: false, default: 1        |
| price        | integer| null: false                    |

### Association
- has_many :reservations
- has_many :users, through: :reservations


## reservations テーブル（予約情報）
| Column           | Type      | Options                        |
|------------------|-----------|--------------------------------|
| user             | references| null: false, foreign_key: true |
| sauna            | references| null: false, foreign_key: true |
| start_time       | datetime  | null: false                    |
| end_time         | datetime  | null: false                    |
| number_of_people | integer   | null: false, default: 1        |
| status           | integer   | null: false, default: 0        |

**status**: `0 = 未確定`, `1 = 確定`, `2 = キャンセル済み`

### Association
- belongs_to :user
- belongs_to :sauna
- has_one :payment


## payments テーブル（支払い情報）
| Column         | Type      | Options                        |
|----------------|-----------|--------------------------------|
| reservation    | references| null: false, foreign_key: true |
| amount         | integer   | null: false                    |
| payment_status | integer   | null: false, default: 0        |

**payment_status**: `0 = 未払い`, `1 = 支払い済み`, `2 = 返金済み`

### Association
- belongs_to :reservation


## notifications テーブル（通知情報）
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| message     | text       | null: false                    |
| read_status | boolean    | null: false, default: false    |

### Association
- belongs_to :user



# アプリケーション名
Saunaapp

## アプリケーション概要
Saunaappは、ユーザーがサウナを予約できる会員制の予約管理アプリケーションです。
<br>ユーザーは、サウナの情報を閲覧し、希望の時間帯で予約を行うことができます。
<br>また、支払い機能を備え、スムーズな予約管理が可能です。
<br>管理者は、ユーザーが予約した情報の管理、ホテル部屋の追加、編集、削除が可能です。

## URL


## テスト用アカウント
テスト用
<br>ユーザー Email：aaa@aaa
<br>管理者 Email：admin@admin
<br>ユーザー Password：aaa111
<br>管理者 Password：saunaapp
<br>※ログイン機能等を実装した場合は、ログインに必要な情報を記載。
<br>※またBasic認証等を設けている場合は、そのID/Passも記載すること。

## 利用方法
	1.	URLにアクセスし、以下のいずれかの方法でログイン画面に移動します。
	  •	ヘッダー右上の「宿泊予約」ボタンから部屋一覧ページへ進み、ログイン
	  •	MENU内の「宿泊予約」からログイン
	  •	サイト下部の「宿泊予約」からログイン
	2.	テスト用アカウントを使用しログインします。
	3.	部屋一覧画面から利用可能な部屋を選択します。
	4.	予約フォームに必要な情報を入力し、予約を確定します。
	5.	支払いを行い、トップページに遷移します。
	6.	マイページから予約履歴を確認・変更・キャンセルできます。

## アプリケーションを作成した背景
Saunaappは、サウナをもっと身近に、もっと手軽に楽しんでもらうことを目的に開発されました。
<br>煩雑になりがちな電話予約や現地確認をなくし、オンラインで簡単に予約できる仕組みを提供することで、
誰でもスムーズにサウナ体験を始められるようにしています。
<br>また、写真や設備の紹介を通じて施設の魅力を事前に知ることができるようになっており、
サウナ初心者から愛好者まで幅広いユーザーに安心して使っていただける設計を意識しています。

## 実装した機能についての画像やGIFおよびその説明
|ページ|説明|
|---|------------------|
|![トップページのGIF](URL_TO_GIF)|トップページ　　　　　　　　　　　　　　　　　　　　　　|
|![ユーザー機能のGIF](URL_TO_GIF)|ユーザー機能<br>・新規登録<br>・ログイン/ログアウト<br>・マイページ|
|![予約機能のGIF](URL_TO_GIF)|予約機能<br>・予約登録<br>・予約一覧表示<br>・予約詳細表示<br>・予約の編集・キャンセル|
|![支払い機能のGIF](URL_TO_GIF)|支払い機能|

## 実装予定の機能
- リアルタイム空き状況の表示
- ユーザーレビュー機能
- 予約リマインダー機能
- キャンセル待ち機能

## データベース設計
ER図を添付。
<br>AIで作る場合は、Googleアカウントがあれば使用できる「Vercel v0」がオススメです。
<img width="307" alt="Image" src="https://github.com/user-attachments/assets/f780ed7f-e22c-495f-ad7d-5add7f75e45f" />


## 画面遷移図
画面遷移図を添付。
<br>AIで作る場合は、Googleアカウントがあれば使用できる「Vercel v0」がオススメです。
<img width="509" alt="Image" src="https://github.com/user-attachments/assets/086ceb82-5286-4340-b4ff-014d621e4d26" />


## 開発環境
| 項目               | バージョン・サービス |
|------------------|-----------------|
| **言語**        | Ruby 3.2.0 |
| **フレームワーク** | Ruby on Rails 7.1.5.1 |
| **データベース**  | PostgreSQL 14.15（本番） / MySQL 8.0（開発） |
| **フロントエンド** | HTML / CSS / JavaScript / Bootstrap / AOS.js |
| **認証機能**    | Devise |
| **デプロイ環境** | Render |
| **バージョン管理** | GitHub |

## ローカルでの動作方法

1. リポジトリをクローンします。
```bash
  git clone https://github.com/GitHubのユーザー名/SaunaReserve.git
```

2. 必要なGemをインストールします。
```bash
  bundle install
```

3. データベースを設定します。
```bash
  rails db:create
  rails db:migrate
```

4. アプリケーションを起動します。
```bash
  rails s
```

5. ブラウザで http://localhost:3000 にアクセスします。


## 工夫したポイント
Saunaappは、ユーザーが直感的に操作できるようなデザインにこだわりました。
- **シンプルで分かりやすい予約フロー**: 初めての利用者でもスムーズに予約できます。
- **洗練されたデザイン**:　シンプルかつ高級感のあるデザインを採用し、視認性を向上させています。
- **スムーズなナビゲーション**:　ヘッダー・フッター・メニューを整理し、どのページからでも迷わず目的の操作ができるようにしました。
- **動きのあるインターフェース**:　スクロール時のアニメーションやボタンのホバーエフェクトを取り入れ、視覚的にも楽しめるUIにしました。

## 今後の課題
現在のアプリは基本的な機能を提供していますが、以下の追加機能を検討しています。
- **口コミ・評価機能**: ユーザーが利用後にレビューを投稿できる機能。
- **お気に入り機能**: よく利用するサウナを登録できる機能。

## 制作時間
250時間

