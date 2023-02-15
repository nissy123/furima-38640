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
| birthday           | integer             | null: false               |

### Association

- belongs_to :delivery_destination
- belongs_to :card
- has_many :products

## products table

| Column                     | Type                | Options                        |
|----------------------------|---------------------|--------------------------------|
| product_name               | string              | null: false                    |
| products_description       | text                | null: false                    |
| category                   | string              | null: false                    |
| products_state             | string              | null: false                    |
| delivery_charge_burden     | string              | null: false                    |
| regional_original_delivery | string              | null: false                    |
| days_up_to_delivery        | string              | null: false                    |
| price                      | integer             | null: false                    |
| sales_fee                  | integer             | null: false                    |
| sales_income               | integer             | null: false                    |
| user                       | references          | null: false, foreign_key: true |
| image                      | references          | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase_record
- has_many :images

## delivery_destination table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| postal_code        | integer             | null: false                   |
| prefecture         | string              | null: false                   |
| city               | string              | null: false                   |
| block              | string              | null: false                   |
| buildings_name     | string              | null: false                   |
| phone_number       | integer             | null: false                   |
| user               | references          | null: false, foreign_key: true|

### Association

- belongs_to :user

## cards table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| customer_token     | string              | null: false                   |
| user               | references          | null: false, foreign_key: true|

### Association

- belongs_to :user

## images table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| image_url          | string              | null: false                   |
| product            | references          | null: false, foreign_key: true|

### Association

- belongs_to :product

## purchase_record table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| product            | references          | null: false, foreign_key: true|

### Association

- belongs_to :product
