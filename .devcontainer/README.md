# Dev Container 設定

このプロジェクトは、VSCode Dev Containersを使用した開発環境を提供します。

## 前提条件

- Docker Desktop がインストールされていること
- Visual Studio Code がインストールされていること
- VSCode拡張機能「Dev Containers」がインストールされていること

## 使用方法

1. VSCodeでプロジェクトを開く
2. コマンドパレット（Ctrl+Shift+P / Cmd+Shift+P）を開く
3. `Dev Containers: Reopen in Container` を実行
4. コンテナのビルドと起動を待つ

## 含まれるツール

- Flutter SDK (最新安定版)
- Node.js 20.x
- Dart
- Google Chrome (Flutter Web開発用)
- Git, GitHub CLI
- 各種開発用VSCode拡張機能

## ポート

- 3000: Web開発サーバー
- 8080: Flutter Web
- 5000: APIサーバー（カスタマイズ可能）

## トラブルシューティング

### Flutter Doctorでエラーが出る場合

```bash
flutter doctor -v
```

### コンテナの再ビルド

コマンドパレットから `Dev Containers: Rebuild Container` を実行
