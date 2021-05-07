# README


# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------  | ------ | ------------------------ |
| nickname            | string | null: false              |
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| first_kana          | string | null: false              |
| last_kana           | string | null: false              |
| email               | string | null: false ,unique: true|
| encrypted_password  | string | null: false              |
| birthday            | date   | null: false              |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| name           | string        | null: false                    |
| text           | text          | null: false                    |
| category_id    | integer       | null: false                    |
| status_id      | integer       | null: false                    |
| send_id        | integer       | null: false                    |
| prefectures_id | integer       | null: false                    |
| day_id         | integer       | null: false                    |
| price          | integer       | null: false                    |
| user           | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order




## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address




## addresses テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| postal_code          | string     | null: false,                  |
| prefectures_id       | integer    | null: false,                  |
| city                 | string     | null: false,                  |
| street               | string     | null: false,                  |
| building             | string     |                               |
| phone_number         | string     | null: false,                  |
| order                | references | null: false,foreign_key:true  |

### Association

- belongs_to :order
| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| name      | string | null: false |
| kana      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| birthday  | date   | null: false |



### Association

- has_many :items
- has_many :comments
- belongs_to :order

## items テーブル

| Column   | Type    | Options     |
| -------  | ------- | ----------- |
| name     | string  | null: false |
| image    | string  | null: false |
| text     | text    | null: false |
| category | string  | null: false |
| status   | string  | null: false |
| send     | string  | null: false |
| area     | string  | null: false |
| day      | string  | null: false |
| price    | integer | null: false |


### Association

- has_many :comments
- belongs_to :users
- belongs_to :order


## orders テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| credit_number | string     | null: false, foreign_key: true |
| deadline      | integer    | null: false, foreign_key: true |
| security_code | integer    | null: false, foreign_key: true |
| postal_code   | integer    | null: false, foreign_key: true |
| prefectures   | string     | null: false, foreign_key: true |
| city          | string     | null: false, foreign_key: true |
| street        | string     | null: false, foreign_key: true |
| building      | string     | null: false, foreign_key: true |
| phone_number  | string     | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
- 


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false, foreign_key: true |
| user    | string     | null: false, foreign_key: true |
| item    | string     | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users