# アプリケーション名
Saunaapp

## アプリケーション概要
Saunaappは、お客さんがサウナ付きのホテルを予約できるアプリです。
<br>スマホから気軽に部屋の情報を見て、泊まりたい日を選んで予約・支払いまで完結できます。
<br>管理者は、予約の一覧を見たり、新しい部屋を追加したり、内容を編集・削除することができます。
<br>お客さんと管理側、どちらにとっても使いやすい仕組みを目指しました。

## URL


## テスト用アカウント
テスト用
<br>ユーザー Email：aaa@aaa.com
<br>ユーザー Password：aaa111
<br>管理者 Email：admin@admin.com
<br>管理者 Password：saunaapp

## 利用方法
	1.	URLにアクセスし、以下のいずれかの方法でログイン画面に移動します。
	  •	ヘッダー右上の「マイページ」か「宿泊予約」ボタンから部屋一覧ページへ進み、ログイン
	  •	MENU内の「宿泊予約」からログイン
	  •	サイト下部の「宿泊予約」からログイン
	2.	テスト用アカウントを使用しログインします。
	3.	部屋一覧画面から利用可能な部屋を選択します。
	4.	予約フォームに必要な情報を入力し、予約を確定します。
	5.	支払いを行い、トップページに遷移します。
	6.	マイページから予約履歴を確認・変更・キャンセルできます。

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
|![トップページのGIF](URL_TO_GIF)|トップページ　　　　　　　　　　　　　　　　　　　　　　|
|![ユーザー機能のGIF](URL_TO_GIF)|ユーザー機能<br>・新規登録<br>・ログイン/ログアウト|
|![予約機能のGIF](URL_TO_GIF)|予約機能<br>・予約登録<br>・予約一覧表示<br>・予約の編集・キャンセル|
|![支払い機能のGIF](URL_TO_GIF)|支払い機能|

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
- **シンプルに予約できるように**意識しました。初めて使う人でも迷わず進めるような流れにしています。
- **デザインはちょっと高級感ある雰囲気に。** サウナの癒しっぽさも出したくて、落ち着いた色味や余白も大事にしました。
- **ナビゲーション周りも整理して、** 「次どこ押せばいいんだっけ？」がないようにしています。
- **動きにもこだわっていて、** スクロールしたときのアニメーションやボタンのエフェクトで、ちょっと楽しくなるようにしました。

## 今後の課題
- **カレンダーで予約済みの日は選べないようにしたいです。**「空いてる日が分からない問題」をちゃんと解決したいなと。
- **利用後にレビューが書ける機能**も付けて、他の人の声が見えるようにしたいです。
- **リマインダー通知も入れたい。** 予約したのをうっかり忘れないように。
- **レスポンスブデザインです。** スマホだと表示が崩れてしまわないように。

## 制作時間
250時間

