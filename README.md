# テーブル設計

## users テーブル（ユーザー情報）
| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| role               | integer| null: false, default: 0        |

**role**: `0 = 一般ユーザー`, `1 = 管理者`

### Association
- has_many :reservations
- has_many :notifications
- has_many :saunas, through: :reservations


## saunas テーブル（サウナ情報）
| Column       | Type   | Options                        |
|--------------|--------|--------------------------------|
| name         | string | null: false                    |
| description  | text   | null: false                    |
| price        | integer| null: false                    |
| location     | string | null: false                    |
| capacity     | integer| null: false, default: 1        |

### Association
- has_many :reservations
- has_many :users, through: :reservations


## reservations テーブル（予約情報）
| Column           | Type      | Options                        |
|------------------|-----------|--------------------------------|
| user             | references| null: false, foreign_key: true |
| sauna            | references| null: false, foreign_key: true |
| start_time       | datetime  | null: false                    |
| end_time         | datetime  | null: false                    |
| number_of_people | integer   | null: false, default: 1        |
| status           | integer   | null: false, default: 0        |

**status**: `0 = 未確定`, `1 = 確定`, `2 = キャンセル済み`

### Association
- belongs_to :user
- belongs_to :sauna
- has_one :payment


## payments テーブル（支払い情報）
| Column         | Type      | Options                        |
|----------------|-----------|--------------------------------|
| reservation    | references| null: false, foreign_key: true |
| amount         | integer   | null: false                    |
| payment_status | integer   | null: false, default: 0        |

**payment_status**: `0 = 未払い`, `1 = 支払い済み`, `2 = 返金済み`

### Association
- belongs_to :reservation


## notifications テーブル（通知情報）
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| message     | text       | null: false                    |
| read_status | boolean    | null: false, default: false    |

### Association
- belongs_to :user