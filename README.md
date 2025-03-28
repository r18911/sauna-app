# アプリケーション名
Saunaapp

## アプリケーション概要
Saunaappは、お客さんがサウナ付きのホテルを予約できるアプリです。
<br>スマホから気軽に部屋の情報を見て、泊まりたい日を選んで予約・支払いまで完結できます。
<br>管理者は、予約の一覧を見たり、新しい部屋を追加したり、内容を編集・削除することができます。
<br>お客さんと管理側、どちらにとっても使いやすい仕組みを目指しました。

## URL
https://sauna-app-cp7t.onrender.com

## テスト用アカウント
Basic認証アカウント：admin
<br>Basic認証パスワード：2222
<br>利用者 Email：aaa@aaa.com
<br>利用者 Password：aaa111
<br>管理者 Email：admin@admin.com
<br>管理者 Password：saunaapp

## 利用方法
#### 利用者の場合<br>
	1.	URLにアクセスし、以下のいずれかの方法でログイン画面に移動します。
	  •	ヘッダー右上の「マイページ」か「宿泊予約」ボタンから部屋一覧ページへ進み、ログイン
	  •	MENU内の「宿泊予約」からログイン
	  •	サイト下部の「宿泊予約」からログイン
	2.	テスト用の利用者アカウントを使用しログインします。
	3.	部屋一覧画面から利用可能な部屋を選択します。
	4.	予約フォームに必要な情報を入力し、予約を確定します。
	5.	支払いを行い、マイページに遷移します。
	6.	マイページから予約履歴を確認・変更・キャンセルできます。

#### 管理者の場合<br>
	1.	URLにアクセスし、以下のいずれかの方法でログイン画面に移動します。
	  •	ヘッダー右上の「マイページ」か「宿泊予約」ボタンから部屋一覧ページへ進み、ログイン
	  •	MENU内の「宿泊予約」からログイン
	  •	サイト下部の「宿泊予約」からログイン
	2.	テスト用の管理者アカウントを使用しログインします。
	3.	部屋一覧画面から「部屋を追加する」を選択します。
	4.	追加フォームに必要な情報を入力し、登録を確定します。
	5.	部屋情報の右上のボタンで編集、削除ができます。
	6.	マイページから利用者全体の予約履歴を確認・変更・キャンセルができます。

## アプリケーションを作成した背景
Saunaappは、「もっと気軽にサウナを楽しめたらいいのに」という思いから作りました。
<br>予約って電話しなきゃいけなかったり、空き状況がわからなかったりして、ちょっと面倒ですので、
お客さんがスマホからサクッと予約できるようにしました。
<br>また、どんな部屋か、どんな設備があるのか、写真で事前にわかるようにして、
サウナ初心者の方でも安心して予約できるように工夫しました。
サウナ好きの人も、これから始めてみたい人にも、使ってもらえるアプリを目指しています。

## 実装した機能についての画像やGIFおよびその説明
|ページ|説明|
|---|------------------|
|![Image from Gyazo](https://github.com/r18911/sauna-app/blob/main/c_TDEj9rxnWh-be538f7efc875c56cdf236ebba65e530.gif?raw=true)|トップページ　　　　　　　　　　　　　　　　　　　　　　|
|![Image from Gyazo](https://github.com/r18911/sauna-app/blob/main/d71485f4c6c8a51ccb7f69e3d8a5b572.gif?raw=true)|館内施設紹介|
|![Image from Gyazo](https://github.com/r18911/sauna-app/blob/main/89f2005eee53cb27cd074d104b034ac1.gif?raw=true)|日帰り入浴料金案内|
|[![Image from Gyazo](https://i.gyazo.com/761760ca14f347abedd4877ffeea1c9a.gif)](https://gyazo.com/761760ca14f347abedd4877ffeea1c9a)[![Image from Gyazo](https://i.gyazo.com/3cb7814063e51dda644d8f4d0518479a.gif)](https://gyazo.com/3cb7814063e51dda644d8f4d0518479a)|ユーザー機能<br>・新規登録<br>・ログイン/ログアウト|
|[![Image from Gyazo](https://i.gyazo.com/2ff85349656ff8592dd73f045a0e1950.gif)](https://gyazo.com/2ff85349656ff8592dd73f045a0e1950)[![Image from Gyazo](https://i.gyazo.com/5be501aed9ab859666d6afb216772344.gif)](https://gyazo.com/5be501aed9ab859666d6afb216772344)|予約機能<br>・予約登録<br>・予約一覧表示<br>・予約の編集・キャンセル|
|[![Image from Gyazo](https://i.gyazo.com/d260100244d228aae79b4586894e14d4.gif)](https://gyazo.com/d260100244d228aae79b4586894e14d4)|支払い機能|

## 実装予定の機能
- リアルタイム空き状況の表示
- ユーザーレビュー機能
- 予約リマインダー機能

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/31e282ea3873331f3cfb120bb8009910.png)](https://gyazo.com/31e282ea3873331f3cfb120bb8009910)


## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/01b243a14aae5172e991ca4c19e7f632.png)](https://gyazo.com/01b243a14aae5172e991ca4c19e7f632)


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
  git clone https://github.com/r18911/sauna-app.git
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
ユーザーが直感的に操作できるようなデザインにこだわりました。
- **シンプルで分かりやすい予約フロー**: 初めての利用者でもスムーズに予約できます。
- **ナビゲーション周りも整理して、** 「次どこ押せばいいんだっけ？」がないようにしています。
- **動きのあるデザイン**: スクロール時のアニメーションやカーソルをボタンに合わせると色が変化するなど、視覚的にも楽しめるUIにしました。

## 今後の課題
- **リアルタイム空き状況の表示**: 現在の空室状況をリアルタイムで確認できる機能を実装予定。
- **ユーザーレビュー機能**: 利用後にサウナの評価や口コミを投稿し、他のユーザーと情報を共有できる機能。
- **予約リマインダー機能**: 予約時間が近づくと通知を送るリマインダー機能を追加し、予約忘れを防ぐ。
- **キャンセル待ち機能**: 満室時にキャンセルが発生した際、空き状況を教えてくれる通知機能を搭載。

## 制作時間
250時間

