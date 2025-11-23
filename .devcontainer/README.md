# Dev Container 設定

このプロジェクトは、VSCode Dev Containers を使用した開発環境を提供します。

## 前提条件

- Docker Desktop がインストールされていること
- Visual Studio Code がインストールされていること
- VSCode 拡張機能「Dev Containers」がインストールされていること

## 使用方法

1. VSCode でプロジェクトを開く
2. コマンドパレット（Ctrl+Shift+P / Cmd+Shift+P）を開く
3. `Dev Containers: Reopen in Container` を実行
4. コンテナのビルドと起動を待つ

### Nginx でウェブサイトを起動

コンテナ起動後、ターミナルで以下のコマンドを実行：

```bash
.devcontainer/start-nginx.sh
```

これにより、Nginx が起動し、ポート 80 でウェブサイトにアクセスできるようになります。
ブラウザで `http://localhost` を開いてください。

## 含まれるツール

- Node.js 20.x
- http-server, serve (グローバルインストール)
- Git, GitHub CLI
- Zsh + Oh My Zsh
- 各種開発用 VSCode 拡張機能

## インストール済み VSCode 拡張機能

- **Web 開発**: ESLint, Prettier, Live Server
- **Docker**: Docker 拡張機能
- **Git**: GitLens
- **その他**: EditorConfig

## ポート

- 80: Nginx ウェブサーバー
- 8080: Live Server / 開発サーバー
- 3000: カスタム開発サーバー

## エディタ設定

- 保存時に自動フォーマット有効
- デフォルトフォーマッター: Prettier
- 行末: LF (`\n`)
- Live Server ポート: 8080

## トラブルシューティング

### コンテナの再ビルド

コマンドパレットから `Dev Containers: Rebuild Container` を実行

### npm install が失敗する場合

コンテナ内のターミナルで手動実行：

```bash
npm install
```
