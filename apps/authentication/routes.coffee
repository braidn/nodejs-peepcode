routes = (app) ->
	app.get '/login', (req, res) ->
		res.render "#{__dirname}/views/login",
			title: 'Login'
			stylesheet: 'login'

	app.post '/sessions', (req, res) ->
		if ('piechef' is req.body.user) and ('12345' is req.body.password)
			req.session.currentUser = req.body.user
			req.flash 'info', "You are logged in as #{req.session.currentUser}"
			res.redirect '/admin/pies'
			return
		req.flash 'error', 'Credentials incorrect'
		res.redirect '/login'

	app.del '/login', (req, res) ->
		req.session.regenerate (err) ->
			req.flash 'info', "You have been successfully logged out"
			res.redirect '/login'

module.exports = routes
