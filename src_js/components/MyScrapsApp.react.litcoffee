# メインクラスの定義

## React オブジェクトの読み込み

	Header = require './Header.react'
	Footer = require './Footer.react'
	MainSection = require './MainSection.react'
	React = require 'react'
	MyScrapsStore = require('../stores/MyScrapsStore');

## メインのトップモジュールを宣言

	MyScrapsApp = React.createClass

### 初期化処理

		getInitialState: ->
			allTodos: MyScrapsStore.getAll()

### イベントハンドラの設定

		componentDidMount: ->
			MyScrapsStore.addChangeListener @_onChange
		componentWillUnmount: ->
			MyScrapsStore.removeChangeListener @_onChange

### 描画処理

		render: ->
			<div>
				<Header />
				<MainSection allTodos={this.state.allTodos}/>
				<Footer allTodos={this.state.allTodos} />
			</div>

### データ変更イベントハンドラの定義

		_onChange : ->
			this.setState
				allTodos: MyScrapsStore.getAll()

## クラスの発行

	module.exports = MyScrapsApp
