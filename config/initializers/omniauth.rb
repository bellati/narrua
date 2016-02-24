Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  :scope => 'public_profile, user_events,',
  :client_options => {
 	:site => 'https://graph.facebook.com/v2.5',
  	:authorize_url => "https://www.facebook.com/v2.5/dialog/oauth"
  },
  token_params: { parse: :json }
end