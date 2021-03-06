# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchase_records
- has_many :comments


## itemsテーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| item_name           | string      | null: false                    |
| item_text           | text        | null: false                    |
| item_category_id    | integer     | null: false                    |
| item_status_id      | integer     | null: false                    |
| item_price          | integer     | null: false                    |
| shipping_charges_id | integer     | null: false                    |
| shipping_area_id    | integer     | null: false                    |
| day_to_ship_id      | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_one    :purchase_record
- belongs_to :user




## shipping_informationsテーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| postal_code      | string     | null: false                  |
| shipping_area_id | integer    | null: false                  |
| municipality     | string     | null: false                  |
| address          | string     | null: false                  |
| building_name    | string     |                              |
| phone_number     | string     | null: false                  |
| purchase_record  | references | null: false, foreign_key:true|

### Association

- belongs_to :purchase_record


## purchase_recordsテーブル
| Column                  | Type       |Options                       |
| ----------------------- | ---------- |------------------------------|
| user                    | references | null: false, foreign_key:true|
| item                    | references | null: false, foreign_key:true|

### Association

belongs_to :user
belongs_to :item
has_one    :shipping_information


## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item