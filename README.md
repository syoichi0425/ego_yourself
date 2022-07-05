
![ER図20220530](https://user-images.githubusercontent.com/29491720/174910523-6e997aaa-a63f-4049-a705-ff080b38a4e7.jpg)
![インフラ構成図2022_06_11 drawio](https://user-images.githubusercontent.com/29491720/174911551-6cf40021-5ba8-4c9c-8608-6e8efbdbe220.jpg)

アプリ概要
- 日々の振り返るをすることで人間関係に関わる悩みを改善するアプリ

作成背景
- 自身を含め、何か悩みや問題があっても身近に相談できない/したくない人も一定数いるはずと思うことがあった
- TVなどでいじめの問題やメンタルを病む人を見ていた時、他人事ではないと思った
- スマホ/PCのような身近にあるものを利用して、悩みや問題を解決する一つの選択肢になればと思った

アプリ内容
- 自身を見直すこと人間関係の対処法や向き合い方を知り、ストレスへの回避法や耐性を高める
　　- 人間関係で悩んでいることについて、改善したいことを目標をたて、それに向けて行動したことを日々の振り返りをする
 - 心理テストを定期的に行い、改善されているかチェック


URL
- https://ego-yourself.com/


## 環境
- 言語：ruby 2.7.5
- フレームワーク:rails 7.0.3
- WEBサーバー:Apache
- データベース:mysql2 0.5.3
- AWS
  - CloudWatch / CloudTrail / ELB / EC2 / IAM / RDS / Route53 / ACM / S3 / VPC
- ライブラリ
  - bootstrapp-will_paginate  1.0.0
  - carrierwave 2.2.2
  - capistrano 3.17.0
  - chartkick 4.1.3
  - devise 4.8.1
  - font-awesome-rails 4.7.0.8
  - font-awesome-sass 6.1.1
  - kaminari 1.2.2
  - nginx 1.20.0
  - smple calendar 2.4.0
  - unicorn 5.4.1
  - will_paginate 3.3.1
- その他:Git / GitHub

## 機能紹介
- 日記のCRUD機能と一覧表示
- キーワード検索
- カレンダー機能
- エゴグラムテスト
  - グラフ機能
- プロフィール画像登録・削除機能
- ページネーション機能
- 自動デプロイ
- User認証
  - 新規登録
  - ログイン 
