# DB 設計
## buyers table
| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| user_id                 | integer             | null: false, foreign_key: true      |
| item_id                 | integer             | null: false, foreign_key: true      |

## users table
| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| nickname                | string              | null: false              |
| email                   | string              | null: false ,unique: true|
| last name               | string              | null: false              |
| name                    | string              | null: false              |
| last name kana          | string              | null: false              |
| name kana               | string              | null: false              |
| encrypted_password      | string              | null: false              |
| birth_day               | date                | null: false              |

## street_addresses table

| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| post_code        | string      | null: false                         |
| prefecture_id    | integer     | null: false, foreign_key: true      |
| city             | string      | null: false                         |
| address          | string      | null: false                         | 
| building_name    | string      |                                     |
| phone_number     | string      | null: false                         |

### Association
* belongs_to :user

## items table

| Column                   | Type                | Options                 |
|------------------------  |---------------------|-------------------------|
| name                     | text              | null: false                    |
| price                    | text              | null: false                    |
| description              | text              | null: false                    |
| shipping_cost_id         | integer           | null: false                    |
| shipping_days_id         | integer           | null: false                    |
| prefecture_id            | integer           | null: false                    |
| judgment_id              | integer           | null: false                    |
| category_id              | integer           |null: false                     |
| shipping_id              | integer           |null: false                     |
| user_id                  | integer           |null: false, foreign_key: true  |

### Association
* has_many :user
* has_one :buyer
* belongs_to_active_hash :prefecture :judgment :category :shipping :user