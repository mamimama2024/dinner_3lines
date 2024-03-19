# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |

### Association

- has_many :recipes
- has_many :memos


## recipes テーブル

| Column                 | Type        | Options     |
| ---------------------- | ----------- | ----------- |
| url                    | string      |             |
| title                  | string      | null: false |
| item                   | string      | null: false |
| step                   | text        |             |
| note                   | text        |             |
| user | references | null: false, foreign_key: true |
| memo | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :memo


## memos テーブル

| Column       | Type       | Options                   |
| ------------ | ---------- | ------------------------- |
| memo_text    | text       | null: false               |
| user    | references | null: false, foreign_key: true |
| recipe  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :recipe