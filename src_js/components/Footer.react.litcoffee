# フッターの定義

## 依存モジュールのロード

	React = require 'react'
	ReactPropTypes = React.PropTypes
	MyScrapsActions = require '../actions/MyScrapsActions'

## Footer クラスの定義

	Footer = React.createClass

		propTypes :
			allTodos: ReactPropTypes.object.isRequired

		render: ->
			allTodos = @props.allTodos
			total = Object.keys(allTodos).length
			return null if total is 0
			completed = (todo for todo in allTodos when todo.complete).length
			itemsLeft = total - completed
			itemsLeftPhrase = (if itemsLeft is 1 then ' item ' else ' items ') + 'saved'
			if completed
				clearCompletedButton =
					<button type=button
						id="clear-completed"
						onClick={@_onClearCompletedClick}
						>Clear completed ( {completed} )</button>
			<footer id="footer">
				<span id="todo-count">
					<strong>{itemsLeft}</strong>
					{itemsLeftPhrase}
				</span>
				{clearCompletedButton}
			</footer>
		_onClearCompletedClick: ->
			MyScrapsActions.destroyCompleted()

	module.exports = Footer
