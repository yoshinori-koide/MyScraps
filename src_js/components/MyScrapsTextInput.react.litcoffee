# テキスト入力フォームの定義

## 依存モジュールの読み込み

	React = require 'react'
	ReactPropTypes = React.PropTypes

## 内部変数の宣言

	ENTER_KEY_CODE = 13

## 入力フォームクラスの宣言

	MyScrapsTextInput = React.createClass
		propTypes:
			className: ReactPropTypes.string
			id: ReactPropTypes.string
			placeholder: ReactPropTypes.string
			onSave: ReactPropTypes.func.isRequired
			value: ReactPropTypes.string
		getInitialState: ->
			value: this.props.value ? ''
		render: ->
			<textarea
				className={@props.className}
				id={@props.id}
				placeholder={@props.placeholder}
				onBlur={@_save}
				onChange={@_onChange}
				onKeyDown={@_onKeyDown}
				value={@state.value}
				autoFocus={true}/>
		_save: ->
			@props.onSave @state.value
			@setState value: ''
		_onChange: (evt)->
			this.setState
				value: evt.target.value
		_onKeyDown: (evt)->
			@_save() if evt.keyCode is ENTER_KEY_CODE

## モジュールの発行

	module.exports = MyScrapsTextInput;
