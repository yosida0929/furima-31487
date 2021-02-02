# DB 設計
## buyers table
| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| user                    | references             | null: false, foreign_key: true      |
| item                    | references             | null: false, foreign_key: true      |

### Association
* belongs_to :user
* belongs_to :items
* has_one :street_address

## users table
| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| nickname                | string              | null: false              |
| email                   | string              | null: false ,unique: true|
| first_name               | string              | null: false              |
| name                    | string              | null: false              |
| first_name_kana          | string              | null: false              |
| name_kana               | string              | null: false              |
| encrypted_password      | string              | null: false              |
| birth_day               | date                | null: false              |

### Association
* has_many :items
* has_many :buyers

## street_address table

| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| post_code        | string      | null: false                         |
| prefecture_id    | integer     | null: false, foreign_key: true      |
| city             | string      | null: false                         |
| address          | string      | null: false                         | 
| building_name    | string      |                                     |
| phone_number     | string      | null: false                         |
| buyer_id         | integer     | null: false, foreign_key: true      |

### Association
* belongs_to :items
* belongs_to :street_address

## items table

| Column                   | Type                | Options                 |
|------------------------  |---------------------|-------------------------|
| name                     | string            | null: false                    |
| price                    | integer           | null: false                    |
| description              | text              | null: false                    |
| shipping_cost_id  配送負担       | integer           | null: false                    |
| shipping_days_id  発送日数       | integer           | null: false                    |
| prefecture_id     発送地域       | integer           | null: false                    |
| category_id       カテゴリー     | integer          |null: false                     |
| shipping_status_id 商品状態       | integer          |null: false                     |
| user                     | references        |null: false, foreign_key: true  |

### Association
* belongs_to :user
* has_one :buyer