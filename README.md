# README

# DB設計
## usersテーブル
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


## sns_credential table
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| provider | string     | null: false                    |
| uid      | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## Cardsテーブル
| Column      | Type       | Options                        |
| ----------- |----------- | ------------------------------ |
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
