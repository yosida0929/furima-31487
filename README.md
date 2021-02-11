# DB 設計

## users table
| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| nickname                | string              | null: false              |
| email                   | string              | null: false ,unique: true|
| first_name              | string              | null: false              |
| name                    | string              | null: false              |
| first_name_kana         | string              | null: false              |
| name_kana               | string              | null: false              |
| encrypted_password      | string              | null: false              |
| birth_day               | date                | null: false              |

### Association
* has_many :items
* has_many :buyers

## items table

| Column                   | Type                | Options                 |
|------------------------  |---------------------|-------------------------|
| name                     | string            | null: false                    |
| price                    | integer           | null: false                    |
| description              | text              | null: false                    |
| shipping_cost_id         | integer           | null: false                    |
| shipping_days_id         | integer           | null: false                    |
| prefecture_id            | integer           | null: false                    |
| category_id              | integer           | null: false                     |
| shipping_status_id       | integer           | null: false                     |
| user                     | references        | null: false, foreign_key: true  |

### Association
* belongs_to :user
* has_one    :buyer

## buyers table
| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| user                    | references          | null: false, foreign_key: true      |
| item                    | references          | null: false, foreign_key: true      |

### Association
* belongs_to :user
* belongs_to :item
* has_one    :street_address


## street_addresses table

| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| post_code        | string      | null: false                         |
| prefecture_id    | integer     | null: false                         |
| city             | string      | null: false                         |
| address          | string      | null: false                         | 
| building_name    | string      |                                     |
| phone_number     | string      | null: false                         |
| buyer            | references  | null: false, foreign_key: true      |

### Association
* belongs_to :buyer