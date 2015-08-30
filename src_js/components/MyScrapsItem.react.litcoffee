# スクラップアイテムの定義

## 依存モジュール

	React = require 'react'
	ReactPropTypes = React.PropTypes
	MyScrapsActions = require '../actions/MyScrapsActions'
	MyScrapsTextInput = require './MyScrapsTextInput.react'


## 内部変数

	cx = require 'react/lib/cx'

## スクラップアイテムクラスの定義

	MyScrapsItem = React.createClass
		propTypes:
			scrap: ReactPropTypes.object.isRequired
		getInitialState: ->
			isEditing: false
		render: ->
			todo = @props.todo
			if @state.isEditing
				input = <MyScrapsTextInput
					className="edit"
					onSave={@_onSave}
					value={todo.text}
				/> 
			<li
				className= {cx({
					'completed': todo.complete, 
					'editing': @state.isEditing})}
				key={todo.id}>
				<div className="view">
					<label onDoubleClick={@_onDoubleClick}>
						{todo.text}
					</label>
					<button className="destroy" onClick={@_onDestroyClick} />
				</div>
				{input}
			</li>
		_onDoubleClick: ->
			@setState isEditing: true
		_onSave: (text)->
			MyScrapsActions.updateText @props.todo.id, text
			@setState isEditing: false
		_onDestroyClick: ->
			MyScrapsActions.destroy @props.todo.id

## モジュールの発行

	module.exports = MyScrapsItem
