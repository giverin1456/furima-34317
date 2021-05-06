# README


# テーブル設計

## users テーブル

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

| Column   | Type          | Options                        |
| -------  | ------------- | ------------------------------ |
| name     | string        | null: false                    |
| image    | ActiveStorage | null: false                    |
| text     | text          | null: false                    |
| category | string        | null: false                    |
| status   | string        | null: false                    |
| send     | string        | null: false                    |
| area     | string        | null: false                    |
| day      | string        | null: false                    |
| price    | integer       | null: false                    |
| user     | references    | null: false, foreign_key: true |



### Association

- has_many :comments
- belongs_to :users
- belongs_to :order


## orders テーブル

| Column        | Type       | Options       |
| ------------  | ---------- | ------------- |
| credit_number | string     | null: false,  |
| deadline      | integer    | null: false,  |
| security_code | integer    | null: false,  |
| postal_code   | integer    | null: false,  |
| prefectures   | string     | null: false,  |
| city          | string     | null: false,  |
| street        | string     | null: false,  |
| building      | string     | null: false,  |
| phone_number  | string     | null: false,  |

### Association

- belongs_to :items
- belongs_to :users
- 


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users