# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | integer             | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column                | Type       | Options                        |
|-----------------------|------------|--------------------------------|
| user_id               | string     | null: false, foreign_key: true |
| item_name             | string     | null: false                    |
| explanation           | text       | null: false                    |
| category              | string     | null: false,                   |
| condition             | string     | null: false                    |
| shipping_charge       | string     | null: false                    |
| shipping_area         | string     | null: false                    |
| shipping_day          | integer    | null: false,                   |
| price                 | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :orders

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address

## addresses table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| order_id         | references | null: false foreign_key:true   |
| postal_code      | integer    | null: false                    |
| prefecture       | text       | null: false                    |
| city             | text       | null: false                    |
| house_number     | text       | null: false                    |
| building         | text       |                                |
| telephone_number | integer    | null: false                    |

### Association

- belongs_to :order