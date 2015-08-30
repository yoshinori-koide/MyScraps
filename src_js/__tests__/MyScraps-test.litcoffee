# MyScrapsApp のテストケース


--

## 準備

* 非モッククラスの指定
	jest.dontMock '../MyScrapsApp.litcoffee'

* 依存ファイルの読み込み
	React = require 'react/addons'
	MyScraps = require '../MyScraps.litcoffee'
	TestUtils = React.addons.TestUtils

## MyScraps 全体の定義

	describe 'MyScraps', ->
	it 'view top page', ->
### 初期表示
		container = TestUtils.renderIntoDocument '<MyScraps />'
		label = TestUtils.findRenderedDOMComponentWithTag container, 'label'
### 記事なし
		expect(label.getDOMNode().textContent).toEqual 'Here is no Scraps!'
	it 'add Test Scrap', ->
### 記事を1件追加
		MyScraps.addText 'title','content','referer'
		container = TestUtils.renderIntoDocument '<MyScraps />'
		label = TestUtils.findRenderedDOMComponentWithTag container, 'label'
		expect(label.getDOMNode().textContent).toEqual 'Here is 1 Scrap!'
### 記事をさらに1件追加
		MyScraps.addText 'title','content','referer'
		container = TestUtils.renderIntoDocument '<MyScraps />'
		label = TestUtils.findRenderedDOMComponentWithTag container, 'label'
		expect(label.getDOMNode().textContent).toEqual 'Here is 2 Scraps!'
	