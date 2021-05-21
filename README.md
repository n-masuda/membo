# membo
##バンドメンバーを募集するためのアプリケーション
<img width="1080" alt="スクリーンショット 2021-05-22 0 49 51" src="https://user-images.githubusercontent.com/77085246/119164758-b259f500-ba97-11eb-8b81-c63b9f283f96.png">
<img width="1088" alt="スクリーンショット 2021-05-22 0 28 27" src="https://user-images.githubusercontent.com/77085246/119163968-e54fb900-ba96-11eb-9690-a80ee0ce40bf.png">
# 概要
スタジオで顔合わせをする前に動画でお互いの技術レベルを確認できる。
既存バンドがバンドメンバーを募集する事ができる。
バンドが、不足しているパートの奏者をスカウトできる。
奏者が、募集しているバンドへエントリーする。

# 制作背景
コンタクトを取った段階ではお互いの技術の水準がわかりにくい。  
事前に技術水準を把握できるよう、数小節分の「必殺技」を動画ないしは音声で登録する。

# 実装予定内容
youtube動画の埋め込み

# テーブル設計

## usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| encrypted_password  | string  | null: false               |
| email               | string  | null: false, unique: true |
| prefecture_id       | string  | null: false               |
| area                | string  | null: false               |
| age                 | integer | null: false               |
| part                | string  | null: false               |
| my_hero             | string  | null: false               |

### Association

- has_many :wants
- has_many :entries

## Wantsテーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| name              | string    | null: false                    |
| text              | text      | null: false                    |
| user              | reference | null: false, foreign_key: true |

### Association
- belongs_to :user

## Entriesテーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| user        | reference | null: false, foreign_key: true |
| text        | text      | null: false, foreign_key: true |

### Association
- belongs_to :user

