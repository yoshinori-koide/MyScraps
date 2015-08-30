# メインセクションの定義

## 依存モジュールの読み込み

	React = require 'react'
	ReactPropTypes = React.PropTypes
	MyScrapsActions = require '../actions/MyScrapsActions'
	MyScrapsItem = require './MyScrapsItem.react'

## メインセクションクラスの定義

	MainSection = React.createClass
		propTypes:
			allTodos: ReactPropTypes.object.isRequired
			areAllComplete: ReactPropTypes.bool.isRequired
		render: ->
			return null if Object.keys(@props.allTodos).length < 1
			allTodos = this.props.allTodos
			todos = for key of allTodos
				<MyScrapsItem key={key} todo={allTodos[key]} /> 
			<section id="main">
				<ul id="todo-list">{todos}</ul>
			</section>


## クラスの発行

	module.exports = MainSection