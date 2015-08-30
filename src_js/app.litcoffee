# React アプリケーションのエントリーポイント

## 依存モジュールの読み込

	React = require 'react'

## アプリケーションの宣言

	MyScrapsApp = require './components/MyScrapsApp.react'

## アプリケーションの実行開始

	React.render <MyScrapsApp />, document.getElementById 'myscrapsapp'
