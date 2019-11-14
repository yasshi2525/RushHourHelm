# RushHour helm chart
## Pre Requirement
* Docker Registryが `registry.host` に構築されている
* (PersistentVolumeにデータを保存する場合) StorageClassが `pv.storageClassName` に定義されている
* (既存DBにデータを保存する場合) MariaDB/MySQLサーバが `db.external.host` に構築されている
* OAuth用のクライアントが作成されている (Twitter, Google, GitHub)
## 設定項目
|変数名|説明|デフォルト値|必須|
|-|-|-|-|
|`app.admin_username`|管理者ユーザ名(メールアドレス形式)|`admin@example.com`|○|
|`app.admin_password`|管理者パスワード|`admin`|○|
|`app.baseurl`|RushHourアプリケーションのアクセスURL|`http://localhost`|○|
|`app.cookie`|Cookieの暗号化キー| |○|
|`app.key`|プレイヤーデータをDBに保存するときのCBCモードのキー(16文字)|`_16byte_len_str_`|○|
|`app.salt`|ユーザIDをハッシュ化する際のHMAC-SHA256のキー||○|
|`app.state`|OAuth 2.0認証時のstateキー||○|
|`app.github_client`|GitHubサービスのOAuthクライアントID||○|
|`app.github_secret`|GitHubアカウントサービスのOAuthクライアントシークレット||○|
|`app.google_client`|GoogleアカウントサービスのOAuthクライアントID||○|
|`app.google_secret`|GoogleアカウントサービスのOAuthクライアントシークレット||○|
|`app.twitter_client`|Twitter AppsのOAuthクライアントID||○|
|`app.twitter_secret`|Twitter AppsのOAuthクライアントシークレット||○|
|`db.type`|`None` 永続化しない<br/>`Pod` Podに永続化する<br/>`External` 既存DBに格納する|`Node`|○|
|`db.pod.user`|DB Podのユーザ名|`rushhour`|`db.type`=`Pod`|
|`db.pod.password`|DB Podのパスワード|`rushhour`|`db.type`=`Pod`|
|`db.pod.database`|DB Podのデータベース名|`rushhour`|`db.type`=`Pod`|
|`db.external.host`|既存DBのホスト名|`rushhour`|`db.type`=`External`|
|`db.external.port`|既存DBのポート番号|`3306`|`db.type`=`External`|
|`db.external.user`|既存DBのユーザ名|`rushhour`|`db.type`=`External`|
|`db.external.password`|既存DBのパスワード|`rushhour`|`db.type`=`External`|
|`db.external.database`|既存DBのデータベース名|`rushhour`|`db.type`=`External`|
|`hostname`|RushHourアプリケーションのホスト名|`localhost`|○|
|`pv.enabled`|アプリのログ、DB PodをPVに格納する|`false`||
|`pv.capacity`|PVのサイズ|`10Gi`|`pv.enabled`=`true`|
|`pv.storageClassName`|PVCのストレージクラス名||`pv.enabled`=`true`|
|`registry.host`|Dockerイメージを格納しているRegistryのホスト名|`localhost`|○|
|`registry.user`|Registryのユーザ名|`admin`|○|
|`registry.password`|Registryのパスワード|`admin`|○|
|`tls.enabled`|SSL終端をIngressで実現する|`false`||
|`tls.cert`|SSL証明書||`tls.enabled`=`true`|
|`tls.key`|SSL証明書の秘密鍵||`tls.enabled`=`true`|