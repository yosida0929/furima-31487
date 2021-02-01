# DB 設計
## buyers table
| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| user_id                 | integer             | null: false, foreign_key: true      |
| item_id                 | integer             | null: false, foreign_key: true      |

## users table
| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| nickname                | string              | null: false             |
| email                   | string              | unique: true            |
| last name               | string              | null: false            |
| name                    | string              | null: false            |
| last name kana          | string              | null: false            |
| name kana               | string              | null: false            |
| encrypted_password暗号化 | string              | null: false             |
| birth_day               | date                | null: false             |

## street address table

| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| user_id          | integer     | null: false, foreign_key: true      |
| post_code        | string      | null: false                         |
| prefecture_id    | integer     | null: false, foreign_key: true      |
| city             | string      | null: false                         |
| address          | string      | null: false                         | 
| building_name    | string      |                                     |
| phone_number     | string      | null: false                         |

### Association
* has_many :user

## items table

| Column                   | Type                | Options                 |
|------------------------  |---------------------|-------------------------|
| name             商品名   | string              | null: false                    |
| price            値段     | string              | null: false                    |
| description      説明     | string              | null: false                    |
| status           詳細     | string              | null: false                    |
| shipping_cost_id 配送料   | integer             | null: false                    |
| shipping_days_id 日数     | integer             | null: false                    |
| prefecture_id    県       | integer             | null: false                    |
| judgment_id      判定     | integer             | null: false                    |
| category_id      カテゴリー| integer             |null: false, foreign_key: true  |
| shipping_id      運送     | integer             |null: false, foreign_key: true  |
| user_id                   | integer             |null: false, foreign_key: true  |

### Association
* has_many :user
* has_many :buyer
* belongs_to_active_hash :prefecture