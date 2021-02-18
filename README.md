# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name(kana)    | string | null: false |
| first_name(kana)   | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items
- has_many :purchase_records
- has_many :comments


## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item_name           | string     | null: false |
| iteme_text          | text       | null: false |
| item_category_id    | integer    | null: false |
| item_status_id      | integer    | null: false |
| item_price          | integer    | null: false |
| shipping_charges_id | integer    | null: false |
| shipping_area_id    | integer    | null: false |
| day_to_ship_id      | integer    | null: false |
| user                | reference  | null: false |

### Association

- has_many   :comments
- has_one    :shipping_informations
- has_one    :purchase_records
- belongs_to :users




## shipping_informationsテーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| postal_code   | integer   | null: false |
| prefectures   | string    | null: false |
| municipality  | string    | null: false |
| town_name     | string    | null: false |
| address       | integer   | null: false |
| building_name | string    |             |
| phone_number  | integer   | null: false |
| item          | reference | null: false |

### Association

- belongs_to :items


## purchase_recordsテーブル
| Column | Type      | Options     |
| ------ | --------- | ----------- |
| user   | reference | null: false |
| item   | reference | null: false |

### Association

belongs_to :users
belongs_to :items


## commentsテーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| text   | text      | null: false |
| user   | reference | null: false |
| item   | reference | null: false |

### Association

belongs_to :users
belongs_to :items