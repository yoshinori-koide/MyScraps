# Store クラスの定義

## 依存モジュールの読み込み

	AppDispatcher = require '../dispatcher/AppDispatcher'
	EventEmitter = require('events').EventEmitter
	MyScrapsConstants = require '../constants/MyScrapsConstants'
	assign = require 'object-assign'

## グローバル変数定義

	CHANGE_EVENT = 'change'
	_todos = {}

## 内部関数定義

	create = (text)->
		id = (+new Date() + Math.floor(Math.random() * 999999)).toString(36)
		_todos[id] =
			id: id
			complete: false
			text: text
		setLocalStrage()

	update = (id, updates)->
		_todos[id] = assign {}, localStorage.todos[id], updates
		setLocalStrage()

	updateAll = (updates)->
		update id, updates for id in _todos

	destroy = (id) ->
		delete _todos[id]
		setLocalStrage()

	destroyCompleted = ->
		destroy id for id in _todos
		setLocalStrage()

	setLocalStrage = ->
		localStorage.todos = JSON.stringify(_todos)

	getLocalStrage = ->
		if localStorage["todos"]
			JSON.parse localStorage["todos"]
		else
			{}

## クラス定義

	MyScrapsStore = assign {}, EventEmitter.prototype,
		areAllComplete: ->
			return false for id in _todos where _todos.id.complete
			true
		getAll: ->
			_todos = getLocalStrage()
		emitChange: ->
			@emit CHANGE_EVENT
		addChangeListener: (callback)->
			@on CHANGE_EVENT, callback
		removeChangeListener: (callback)->
			@removeListener CHANGE_EVENT, callback

## ディスパッチャへの登録

	AppDispatcher.register (action)->
		switch action.actionType
			when MyScrapsConstants.CREATE
				text = action.text.trim()
				if text isnt ''
					create text
					MyScrapsStore.emitChange()
			when MyScrapsConstants.UPDATE_TEXT
				text = action.text.trim()
				if text isnt ''
					update action.id, {text:text}
					MyScrapsStore.emitChange()
			when MyScrapsConstants.DESTROY
				destroy action.id
				MyScrapsStore.emitChange()
			when MyScrapsConstants.DESTROY_COMPLETED
				destroyCompleted
				MyScrapsStore.emitChange()

## モジュールの発行

	module.exports = MyScrapsStore
