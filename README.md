# Live Link

## 概要

現在、SNS、HP、ビラなど様々な場所にライブ情報やバンド情報が散らばっており

欲しい情報を簡単に探せなかったり、取りこぼしが多く発生している問題を解決するアプリです。

ライブ情報、バンド情報、ライブハウス情報を全て一元管理し、またそれらの情報を

全て繋げることによって、この1つのアプリで全て解決するようになります。

## デプロイ先

http://52.193.228.126/

(後日ドメインを当てる予定)

## コンセプト

行きたい日に行きたいライブや好きなバンドを簡単に探せるようにして

ふらっとライブハウスに足を運べるようなアプリ。

## バージョン

* Ruby 2.6.3 
* Rails 5.2.3


## 機能一覧

* ログイン機能
* サインアップ機能
* マイページ機能
* ユーザー情報機能
* バンド情報機能
* ライブハウス情報機能
* ライブ情報投稿機能
* ライブ情報編集機能
* ライブハウス検索機能
* ライブ検索機能
* ブックマーク機能
* バンドフォロー機能
* ブックマークリスト化機能
* ページネーション機能

## カタログ設計
https://docs.google.com/spreadsheets/d/1WGAH23kbG8F-JX2edgY9RuY7_pK05gXQSUOPUtShJEs/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1HTWQqjKxb6uHIRUMgj6AU-fDKDWaMaF7FVo6PmwNybs/edit?usp=sharing

## 画面遷移図/ワイヤーフレーム
https://xd.adobe.com/view/1d7ea470-2bfd-4db6-680e-e80e3f1021bc-6b4f/

## 使用予定gem

* device
* carrierwave
* mini_magick
* kaminari
* fog-aws
* ransack
* geocoder