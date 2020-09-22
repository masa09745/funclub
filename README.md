# README

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :orders
- has_many :tickets
- has_many :sns_credentials, dependent: :destroy
