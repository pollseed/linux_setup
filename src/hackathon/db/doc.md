### メモ
##### indexに固定させたいならば、正規化をしてNULLを省くことが大切
→NOTNULL制約が入れられないようなテーブル構造はよくない

⇔ただし、ログとか履歴テーブルはまた話は別。そもそもリレーション必要なければNULLがあってもよい。

前提はリレーションにおいてはNULLを入れないでという話なのでね

##### 使うのはどうかと思う(使うな)関数・演算子一覧
* IFNULL()
* COALESCE()
* NULLIF()
* <=>
* IS NOT NULL
* IS NOT
* IS NULL

##### DB正規化について
確かに正規化をしすぎると管理が一元化されているのかわかりづらい。

さらに細かいルールが多く、新規エンジニアの把握に時間がかかるのではないかという話がある

テーブルの設計書は常に最新に整備＆ER図のような俯瞰図を用意しておく