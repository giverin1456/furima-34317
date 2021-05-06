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
- has_many :comments
- has_many :order



## items テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| name        | string        | null: false                    |
| text        | text          | null: false                    |
| category_id | integer       | null: false                    |
| status_id   | integer       | null: false                    |
| send_id     | integer       | null: false                    |
| area_id     | integer       | null: false                    |
| day_id      | integer       | null: false                    |
| price       | integer       | null: false                    |
| user        | references    | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :users
- has_many :order




## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
- has_many   :address




## addresses テーブル

| Column               | Type       | Options       |
| -------------------- | ---------- | ------------- |
| postal_code          | string     | null: false,  |
| prefectures          | string     | null: false,  |
| city                 | string     | null: false,  |
| street               | string     | null: false,  |
| building             | string     |               |
| phone_number         | string     | null: false,  |

### Association

- belongs_to :items
- belongs_to :users



##  commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users