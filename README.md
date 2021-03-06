
# 「＃推し」

## 概要


**「＃（ハッシュタグ)　推し」** は、ユーザーにキャラクターとそのキャラについての特徴を登録してもらうサイトです。

　キャラを登録してもらうことで、他のユーザーに今まで興味のなかった作品のキャラを知ってもらったり、あるいは自分が好きなキャラの特徴を理解する手助けになればよいと考えています。私自身がアニメや漫画が好きでそういった人たちがもっと多くのキャラクターを知る機会を作れればよいと思い、このアプリを開発しました。


「＃推し（以下、本アプリ）」の主要機能は以下の通りです。

　＊ログイン必須

１.キャラクターの登録

２．キャラクターをお気に入りにする

　ログインなしでも可能

３．キャラクターを属性別に検索ができる

４．自分以外のユーザーがお気に入りにしたキャラクターの閲覧も可能


なお、現時点では完全な実装段階には入っておりません。

ご了承くださいますようお願いします。

現時点でデプロイされたものはこちらです。（2022/04/11）
[Heroku]https://hash-osis-app.herokuapp.com/

　windows/Androidで動作確認は済んでいます。


## できること

    -サインアップよりユーザー登録、サインアップ後はログインよりログインが行えます。

    -ログイン中のみキャラクター一覧からキャラ登録(キャラクター名・登場作品・キャラクターの特徴の入力)が可能です。

    -ログイン中のみキャラをお気に入りに登録できます。

    -ログイン中のみ、キャラクター情報の更新が可能です。名前やタイトル、特徴を間違えてしまった場合にご利用ください。

    -ユーザー　一覧からお気に入りにしたキャラクターを確認することができます。

    -ほかのユーザーの画面に行くとそのユーザーがお気に入りにしているキャラクターの一覧を確認することができます。

    -また、検索機能を用いてユーザー名を検索することができます。

    -キャラクターに関する検索は、キャラクター名、作品名、タグ検索、複数のタグを使った検索（未実装）が可能です。

##  利用方法

　想定しているユーザーの動きとしては、

　-キャラをお気に入り登録したい。

    サインアップよりログインしてもらい、キャラクター一覧へ。

    キャラクター一覧に好きなキャラクターがいない場合キャラ登録からキャラクターの名前、作品名、そのキャラの特徴を登録してもらいます。

　  その後、キャラクターに対してお気に入り登録を行っていただきます。

　-他のユーザーがどんなキャラをお気に入りにしているかについて知りたい

    ユーザー一覧から他のユーザーの確認ができます。ユーザー検索でユーザーを探すことも可能です。

   -この特徴を持ったキャラを知りたい

    タグ検索からキャラクターを探します。　

　という動きです



## エンジニア向け


### 技術

言語 :Ruby 3.0.3

デザイン: HTML/CSS/ HTML.erb  Bootstrap5

フレームワーク（アプリを作るための土台）:Ruby on Rails 6.1.5

本番環境のデータベース:Postgre 14.2

デプロイ先:Heroku 20

### 要件定義

本アプリを製作するにあたっての要件定義を下記に記載します。（☆は自身が決めた実装への重要度です。☆☆☆最重要　☆重要度低　★未実装・★☆実装途中）

　　☆　　　ユーザー管理：ログインでできること、できないことを区別する。登録したキャラが消えないよう論理削除を導入する。

　　☆☆☆　キャラクター管理機能：キャラクターの登録、更新、表示機能の導入。一応、荒らし対応として表示機能以外はログインユーザーのみ行えるよう設計。

　　★☆　　お気に入り機能：ログインユーザーのみキャラクターをお気に入りにできる。誰が何のキャラを気に入っているかはログイン状態にかかわらず閲覧可能。（現在エラー対応中）

　　☆☆☆  タグ付け機能：キャラクターの登録・更新時に、画面に表示されたタグをつけられる機能。

　　★★☆  検索機能：ユーザー名・キャラ名・作品名・タグについての検索を可能にする。

　　★★★　ツイッターの認証機能：「ツイッターに自身の推し一覧画面を共有できる」が最終目的。（料金がかかる場合、実装を断念）

　　★★☆　デザイン性：全体的にスマホユーザーの利便性が向上できるような設計にすること


### 現段階の実装状態 2022/04/11

　　機能自体はツイッターの認証及び複合的なタグ検索以外ほぼ実装済み。

　　また、こちらが予め用意しておくタグについての内容の入力は完了済みである。

　　残りの問題はスマホ・タブレット端末を利用しているユーザー向けのデザイン性についての課題である。

　　現在お気に入り機能のエラーを確認し、対処中。


 ### よくできたところ

 　タグをテキスト形式ではなく、チェックボックスで入力させることで入力時の利便性を向上させたり、タグの共通化が図れ、データの検索がしやすくなる。

　　gem'devise'にユーザー名の登録を追加。

   全体的にrailsチュートリアルを活用することで理解への促進を図り、内容の復習にもなった。

　　検索機能を導入することで、今後ほかのアプリを作るときに参考にすることができる。

　　論理削除を導入し、ユーザーが削除されてもキャラクターが削除されないようにした。



