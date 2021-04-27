# テーブル設計

## users テーブル

| Column                      | Type   | Options                   |
| --------------------------- | ------ | --------------------------|
| nickname                    | string | null: false               |
| email                       | string | null: false, unique: true |
| encrypted_password          | string | null: false               |
| child_name                  | string | null: false               |
| child_name_kana             | string | null: false               |
| child_birthday              | date   | null: false               |
| parent_name                 | string | null: false               |
| parent_name_kana            | string | null: false               |
| parent_birthday             | date   | null: false               |

### Association

- has_many :lectures
- has_many :studies
- has_one  :address


## lectures テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| category_id   | integer    | null: false                    |
| class_name    | string     | null: false                    |
| class_info    | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one    :study
- belongs_to :user


## studies テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| lecture    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :lecture


## address テーブル

| Column        | Type            | Options                        |
| --------------| --------------- | ------------------------------ |
| postal_code   | string          | null: false                    |
| prefecture_id | integer         | null: false                    |
| city          | string          | null: false                    |
| block         | string          | null: false                    |
| building      | string          |                                |
| phone_number  | string          | null: false                    |
| user          | references      | null: false, foreign_key: true |

### Association

- belongs_to :user

