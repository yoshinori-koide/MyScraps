# アクションの定義


## 依存モジュールのロード

	AppDispatcher = require '../dispatcher/AppDispatcher'
	MyScrapsConstants = require '../constants/MyScrapsConstants'

## アクションクラス定義

	MyScrapsActions =
		create : (text) -> AppDispatcher.dispatch
			actionType: MyScrapsConstants.CREATE
			text: text
		updateText : (id, text) -> AppDispatcher.dispatch
			actionType: MyScrapsConstants.UPDATE_TEXT
			id : id
			text: text
		destroy : (id) -> AppDispatcher.dispatch
			actionType: MyScrapsConstants.DESTROY
			id : id
		destroyCompleted : ->
			null

## モジュールの発行

	module.exports = MyScrapsActions
