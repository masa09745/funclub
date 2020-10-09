# README

# DB設計
## users table
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


## Stocks table
| Column      | Type       | Options                        |
| ----------- |----------- | ------------------------------ |
| grade       | string     | null: false                    |
| price       | int        | null: false                    |
| remain      | int        | null: false,                   |
| schedule_id | references | null: false, foreign_key: true |

### Association
- belongs_to :schedule