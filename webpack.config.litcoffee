# Webpack Configuration

	module.exports =

		entry: './src_js/app.litcoffee'
		output:
			filename: './js/main.js'
		devtool: 'inline-source-map'
		module:
			loaders: [
				test: /\.litcoffee$/
				loaders: ['coffee?literate','cjsx']
			]
		resolve:
			extensions: ['', '.js', '.litcoffee']