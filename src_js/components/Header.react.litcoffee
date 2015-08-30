# ヘッダーの定義

## 依存モジュールのロード

	React = require 'react'
	MyScrapsActions = require '../actions/MyScrapsActions'
	MyScrapsTextInput = require './MyScrapsTextInput.react'

## Header クラスの定義

	Header = React.createClass
		render: ->
			<header id="header">
				<h1>スクラップメモ</h1>
				<MyScrapsTextInput
					id="new-todo"
					placeholder="What needs to be done?"
					onSave={this._onSave}
				/>
			</header>
		_onSave: (text)->
			MyScrapsActions.create text if text.trim()

## モジュールの発行

	module.exports = Header
