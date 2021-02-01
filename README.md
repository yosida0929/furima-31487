# DB 設計

## users table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_day          | date                | null: false             |

### Association

* has_many :products dependent: :destroy
* belongs_to :destination dependent: :destroy

## destination買い手 table

| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| user_id          | integer     | null: false, foreign_key: true      |
| family_name      | string      | null: false                         |
| first_name       | string      | null: false                         |
| family_name_kana | string      | null: false                         |
| first_name_kane  | string      | null: false                         |
| post_code        | string      | null: false                         |
| prefecture       | string      | null: false                         |
| city             | string      | null: false                         |
| address          | string      | null: false                         | 
| building_name    | string      |                                     |
| phone_number     | string      |                                     |

### Association
* belongs_to :user

## product出品 table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name       商品名   | string              | null: false                    |
| price       値段    | string              | null: false                    |
| description 説明    | string              | null: false                    |
| status      詳細    | string              | null: false                    |
| shipping_cost_id   | integer             | null: false                    |
| shipping_days_id   | integer             | null: false                    |
| prefecture_id      | integer             | null: false                    |
| judgment_id        | integer             | null: false                    |
| category_id        | integer             |null: false, foreign_key: true  |
| brand_id           | integer             |null: false, foreign_key: true  |
| shipping_id        | integer             |null: false, foreign_key: true  |
| user_id            | integer             |null: false, foreign_key: true  |

### Association

* belongs_to :user dependent: :destroy
* belongs_to_active_hash :prefecture