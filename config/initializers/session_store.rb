Rails.application.config.middleware.use ActionDispatch::Cookies
Rails.application.config.middleware.use ActionDispatch::Session::CookieStore, key: '_la_bish_budget_session'