# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| birthday           | date                | null: false               |

### Association

- has_many :products
- has_many :purchase_records

## products table

| Column                        | Type                | Options                        |
|-------------------------------|---------------------|--------------------------------|
| product_name                  | string              | null: false                    |
| description                   | text                | null: false                    |
| category_id                   | integer             | null: false                    |
| state_id                      | integer             | null: false                    |
| delivery_charge_burden_id     | integer             | null: false                    |
| regional_original_delivery_id | integer             | null: false                    |
| days_up_to_delivery_id        | integer             | null: false                    |
| price                         | integer             | null: false                    |
| user                          | references          | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## delivery_destination table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| postal_code        | string              | null: false                   |
| prefecture_id      | integer             | null: false                   |
| city               | string              | null: false                   |
| block              | string              | null: false                   |
| buildings_name     | string              |                               |
| phone_number       | string              | null: false                   |
| purchase_record    | references          | null: false, foreign_key: true|

### Association

- belongs_to :purchase_record

## purchase_record table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| user               | references          | null: false, foreign_key: true|
| product            | references          | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product
- has_one :delivery_destination
