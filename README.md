# Ego yourself
日々の振り返るをすることで人間関係に関わる悩みを改善するアプリ

URL:https://ego-yourself.com/

## 概要
- 自身を見直すこと人間関係の対処法や向き合い方を知り、ストレスへの回避法や耐性を高める
  - 人間関係で悩んでいることについて、改善したいことを目標をたて、それに向けて行動したことを日々の振り返りをする
  - 心理テストを定期的に行い、改善されているかチェック

## 詳細
### エゴグラム性格診断の目的
- 定期的に診断を行うことで、自身の性格の変化を客観的に把握こと
  - 自身の性格傾向を客観的に把握し、直したい部分を決める
  - 診断結果を踏まえ、人間関係の悩みなどに対し解決したい目標を立てる

###日記を書く目的
- 「自分という人間」を知り、人との関わり方を見直すことで人間関係の問題を解決すること
  - 自身の目標に対して日々の生活の中でできたことや感じたことを書く
  - 継続することで、 自分の感情や考え方が少しずつ変化することに気づく

## 作成背景
- 人間関係でいじめ(する/される)や心を病む人をTVで見ていた時、他人事ではないと思ったのがきっかけ
- 私の場合、人間関係の悩みを人に話すことが少なく、苦しい思いをしていたため、自分の性格をよく理解することで悩みを解決をしたかった
- 自分と向き合い人間関係の問題を改善する一つの選択肢になればと思い、作成

## 使用イメージ
### Topページ
![image](https://user-images.githubusercontent.com/29491720/177363164-cf72aac8-323c-4638-be44-02d5884f9663.png)

### エゴグラム診断
![image](https://user-images.githubusercontent.com/29491720/177363367-e10d813b-ecb0-45ab-b971-2112c892cf22.png)

### エゴグラム診断の結果
![image](https://user-images.githubusercontent.com/29491720/177363518-0be61adc-1966-49c1-bb8d-9d47fccd8b93.png)

### 投稿ページ
![image](https://user-images.githubusercontent.com/29491720/177365214-78eb9c60-d818-4f84-9df6-797f7f07fdb3.png)

### マイページ(1/2)
![image](https://user-images.githubusercontent.com/29491720/177368602-5931853c-cffc-4f71-9cde-545311a5b1b6.png)

### マイページ(2/2)
![image](https://user-images.githubusercontent.com/29491720/177368672-829f38d5-782a-4b0c-982a-7e164ab5052d.png)




## 環境
- **フロントエンド**
  - **HTML**
  - **Sass**
- **バックエンド**
  - **ruby 2.7.5**
  - **rails 7.0.3**
- **インフラ**
  - **AWS**
    - **CloudWatch / CloudTrail / ELB / EC2 / IAM / RDS / Route53 / ACM / S3 / VPC**
  - **Apache**
  - **nginx 1.20.0**
  - **mysql2 0.5.3**
- **ライブラリ**
  - **bootstrapp-will_paginate  1.0.0**
  - **carrierwave 2.2.2**
  - **capistrano 3.17.0**
  - **chartkick 4.1.3**
  - **devise 4.8.1**
  - **font-awesome-rails 4.7.0.8**
  - **font-awesome-sass 6.1.1**
  - **kaminari 1.2.2**
  - **smple calendar 2.4.0**
  - **unicorn 5.4.1**
  - **will_paginate 3.3.1**
- その他
  - Git / GitHub
  - Visual Studio Code
  - draw.io
  - Adobe XD

## 機能紹介
- **日記のCRUD機能と一覧表示**
- **キーワード検索**
  - 日記、目標の内容検索
- **カレンダー機能**
- **エゴグラム診断**
  - 50の質問を「はい(2点)」「いいえ(0点)」「どちらでもない(1点)」をラジオボタンで解答し、合計得点によって性格診断の表示と結果の保存がされる
- **グラフ機能**
  - エゴグラム診断の解答結果を5つの要素(CP,NP,A,FC,AC)の得点をグラフに表示
- **プロフィール画像登録・削除機能**（AWS S3バケット）
- **ページネーション機能**
- **自動デプロイ**
- **User認証**
  - 新規登録
  - ログイン 
- **ゲストログイン機能**

# DB設計

## ER図
![ER図2022:07:05](https://user-images.githubusercontent.com/29491720/177353973-1114f54f-4691-4dfe-90d4-0f4241ac834a.png)


### 各テーブルについて
|テーブル名|説明|
|---|---|
|users|登録ユーザー情報|
|ego_scores|エゴグラム診断の解答結果を5つの要素(CP,NP,A,FC,AC)に分けた情報|
|raise_types|エゴグラムの5つの要素(CP,NP,A,FC,AC)の中で強めたいタイプが保存|
|test_results|エゴグラム診断の解答結果の情報|
|diaries|日記の情報|
|weeks|週の振り返りの情報|
|goals|目標の情報|


## AWS構成図
![インフラ構成図2022_06_11 drawio](https://user-images.githubusercontent.com/29491720/174911551-6cf40021-5ba8-4c9c-8608-6e8efbdbe220.jpg)
