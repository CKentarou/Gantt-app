# Gantt-app

Gantt-app は、プロジェクト管理をサポートする Ruby on Rails アプリケーションです。
チームでプロジェクトを作成し、タスクを管理しながら、メンバー同士で協力してプロジェクトを進めることができます。

## 主な機能

- **プロジェクト管理**
  - 管理者がプロジェクトを作成し、メンバーを招待可能。
  - 役割（管理者/メンバー）の割り当て。

- **タスク管理**
  - プロジェクト管理者のみが通常タスクを作成可能。
  - タスクの難易度、報酬ポイント、担当者の設定。
  - タスクの進捗を DHTMLX Gantt で可視化。

- **緊急タスク（助っ人募集）**
  - すべてのメンバーが緊急タスクを掲示板に投稿可能。
  - タスクの受注・完了で報酬ポイントを獲得。
  - 緊急タスクの進行状況を Kanban で管理。

- **貢献度管理**
  - タスクの完了状況に応じてポイントを獲得。
  - メンバーの貢献度をリアルタイムでランキング表示。

## 技術スタック

- Ruby on Rails 8.0.1
- PostgreSQL
- DHTMLX Gantt & Kanban
- Tailwind CSS
- Devise（認証機能）

## インストール手順

### 1. リポジトリのクローン
```sh
$ git clone https://github.com/yourusername/springtask.git
$ cd springtask
```

### 2. 必要な gem のインストール
```sh
$ bundle install
```

### 3. データベースのセットアップ
```sh
$ rails db:create
$ rails db:migrate
```

### 4. サーバーの起動
```sh
$ rails server
```
ブラウザで `http://localhost:3000` にアクセスすると、アプリを確認できます。

## コントリビューション

貢献を歓迎します！バグ報告や機能提案は [Issues](https://github.com/yourusername/springtask/issues) にて受け付けています。

## ライセンス

MIT ライセンスのもとで提供されます。詳しくは `LICENSE` ファイルをご確認ください。

---

プロジェクトの詳細なドキュメントは随時更新予定です。

