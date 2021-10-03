# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column                | Type       | Options                        |
|-----------------------|------------|--------------------------------|
| user                  | references | null: false, foreign_key: true |
| item_name             | string     | null: false                    |
| explanation           | text       | null: false                    |
| category_id           | integer    | null: false,                   |
| condition_id          | integer    | null: false                    |
| shipping_charge_id    | integer    | null: false                    |
| shipping_area_id      | integer    | null: false                    |
| shipping_day_id       | integer    | null: false,                   |
| price                 | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :orders

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| order            | references | null: false foreign_key:true   |
| postal_code      | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | text       | null: false                    |
| house_number     | text       | null: false                    |
| building         | text       |                                |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :order