# テーブル設計

## users テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ | #文字列型
| email        | string     | null: false                    |
| password     | string     | null: false                    |
| name         | string     | null: false                    |
| profile      | text       | null: false                    | #長文字列
| occupation   | text       | null: false                    |
| position     | text       | null: false                    |

## prototypes テーブル

| Column       | Type           | Options                        |
| ------------ | ---------------| ------------------------------ |
| title        | string         | null: false                    |
| catch_copy   | text           | null: false                    |
| user         | references     | null: false, foreign_key: true |
| concept      | text           | null: false                    |

## comments テーブル
| Column       | Type           | Options                        |
| ------------ | -------------- | ------------------------------ |
| text         | text           | null: false                    |
| prototype    | references     |                                |
| user         | references     |                                |

