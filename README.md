# **mablモバイルテスト デモアプリ開発ガイド**

mablのモバイルテスト機能（要素操作、AIアサーション、テスト自動作成、自動修復）を紹介するためのデモ用Webアプリケーションです。

このリポジトリは、docker-composeを使用して、ローカル環境で簡単にWebサーバーを起動できるように構成されています。

## **1\. ローカル環境での起動方法 (Docker)**

お使いの環境に [Docker](https://www.google.com/search?q=https.www.docker.com/get-started) と [Docker Compose](https://www.google.com/search?q=https.docs.docker.com/compose/install/) がインストールされていることを確認してください。

1. このリポジトリをクローンまたはダウンロードします。  
2. ターミナル（コマンドプロンプト）でこのディレクトリに移動します。  
3. 以下のコマンドを実行して、Webサーバーをバックグラウンドで起動します。  
   docker-compose up \-d

4. 起動したら、ブラウザで http://localhost:8080 にアクセスしてください。mabl-demo-app.html の内容がモバイルアプリ風のUIで表示されます。  
5. サーバーを停止する場合は、以下のコマンドを実行します。  
   docker-compose down

## **2\. mablデモ用Webアプリ (mabl-demo-app.html) について**

mabl-demo-app.html ファイルは、mablのテスト対象として使用できる、モバイルアプリ風のUIと画面遷移を持つ単一のWebアプリです。

* mablのデス"  
  "スクトップブラウザテスト（モバイルエミュレーション）  
* スマートフォンの実機ブラウザ（http://\<PCのIPアドレス\>:8080 などでアクセス）

上記の方法でテスト対象として使用できます。mablの各機能を試せるよう、意図的に様々な要素が配置されています。

## **3\. デモ用Webアプリのテストシナリオ**

mabl-demo-app.html ファイルを使って、mablで以下のテストシナリオを試すことができます。

### **A. 従来のテスト（要素の選択とアサーション）**

1. **対象:** ログイン画面  
2. **操作:**  
   * id="email" の入力欄に "test@mabl.com" と入力する。  
   * id="password" の入力欄に "password" と入力する。  
   * id="login-button" のボタンをクリックする。  
3. **アサーション:**  
   * 「ホーム」画面に遷移することを確認する。  
   * id="welcome-message" の要素に "ようこそ、Demo Userさん" というテキストが表示されることをアサートする。

### **B. AIアサーション / Visual Find**

1. **対象:** ホーム画面  
2. **Visual Find:**  
   * ヘッダーの「カートアイコン」を視覚的に（Visual Findで）特定し、クリックする。（このデモではクリックしても何も起きませんが、要素の特定テストになります）  
3. **AIアサーション:**  
   * 「おすすめ商品」のセクション（id="item-3"など）が、**「商品らしく」表示されていること**（画像、タイトル、価格が揃っているなど）をAIアサーションで確認する。  
   * AIアサーションは、将来的に価格が変動したり、商品の説明文がA/Bテストで変わったりしても、レイアウトが崩れていなければパスする堅牢なテストが可能です。

### **C. Test Creation Agent（テスト自動作成）**

* mablのTest Creation Agent（ブラウザ拡張機能など）を使用して、上記のAのログインフローを記録し、テストを自動作成できるか試します。

### **D. 自動修復 (Auto-heal)**

1. まず、上記の\*\*シナリオA（ログインテスト）\*\*が成功するmablテストを作成します。このテストは id="login-button" をクリックするはずです。  
2. 「設定」画面に移動します。  
3. id="change-id-button"（自動修復デモ）ボタンをクリックします。  
   * これにより、ログイン画面のボタンのIDが login-button から login-btn-v2 にプログラム的に変更されます。  
4. 再度、mablで**シナリオAのテストを実行します。**  
5. mablが「id="login-button" が見つからない」というエラーで停止せず、AIが「これは以前のログインボタンだ」と判断し、 id="login-btn-v2" をクリックしてテストを続行（自動修復）できるかを確認します。

## **4\. （参考）ネイティブアプリ開発について**

このリポジトリはWebアプリですが、もしFlutterやReact Nativeでネイティブアプリを開発される場合の一般的な手順を参考までに記載します。

*ネイティブアプリの開発・ビルドはこのチャット環境ではサポートされていません。*

### **Flutterの場合**

1. **Flutter SDK** のインストールが必要です。  
2. **プロジェクト作成:** flutter create mabl\_demo\_app  
3. **開発:** cd mabl\_demo\_app して flutter run  
4. **ビルド (Android):** flutter build apk または flutter build appbundle  
5. **ビルド (iOS):** flutter build ios (macOSとXcodeが必要)

### **React Nativeの場合**

1. **React Nativeの開発環境**（Node.js, Android Studio, Xcodeなど）のセットアップが必要です。  
2. **プロジェクト作成:** npx react-native init MablDemoApp  
3. **開発 (Android):** cd MablDemoApp して npx react-native run-android  
4. **開発 (iOS):** npx react-native run-ios (macOSとXcodeが必要)