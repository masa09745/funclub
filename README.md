## FunClub(仮)

## 概要
- 本アプリは、ポートフォリオの一環として作成しました。
- チケット購入→チェックインまでを本サイト上で行うことができます。

## 背景
- スポーツ観戦において現地観戦は醍醐味の1つです。  
  しかし、現状のチケット購入において、座席番号はランダムに決められてしまいます。  
  そこで、特定の試合においては自分で席を選ぶことができる機能があれば  
  購入者にとってもメリットが生まれます。
- 販売者側にとっても、今現在のコロナウィルスの影響で観客数が制限されている中で、  
  ファンクラブエリアを設け、区画ごとにお一人様観戦エリアや複数人観戦エリアを自分達で設定することが  
  可能となります。  
- その結果、新しい観戦スタイルの構築ができるのではないかと思い作成しました。  

## 開発環境
- Ruby 2.7.1p83
- Rails 6.0.3.3

## DB設計
## Users table
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| name_kana | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
### Association
- has_many :orders
- has_many :tickets
- has_many :sns_credentials, dependent: :destroy
- has_many :cards


## Sns_credential table
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| provider | string     | null: false                    |
| uid      | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## Cards table
| Column      | Type       | Options                        |
| ----------- |----------- | ------------------------------ |
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## Teams table
| Column | Type       | Options     |
| ------ |----------- | ----------- |
| name   | string     | null: false |


## Schedules table
| Column     | Type       | Options     |
| ---------- |----------- | ----------- |
| opponent   | string     | null: false |
| match_date | string     | null: false |

### Association
- has_many :stocks


## Stocks table
| Column      | Type       | Options                        |
| ----------- |----------- | ------------------------------ |
| grade       | string     | null: false                    |
| price       | int        | null: false                    |
| remain      | int        | null: false,                   |
| schedule_id | references | null: false, foreign_key: true |

### Association
- belongs_to :schedule
- has_many   :stock_details
- has_many   :orders


## Stock_details table
| Column      | Type       | Options                        |
| ----------- |----------- | ------------------------------ |
| schedule_id | references | null: false, foreign_key: true |

### Association
- belongs_to :stock


## Orders table
| Column   | Type       | Options                        |
| -------- |----------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| stock_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :stock
- has_many   :tickets


## Tickets table
| Column   | Type       | Options                        |
| -------- |----------- | ------------------------------ |
| row      | string     | null: true                     |
| number   | string     | null: true                     |
| order_id | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |

## Association
- belongs_to :order
- belongs_to :user
