if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_donations-backend', domain: 'https://enigmatic-dawn-22027.herokuapp.com/'
else
  Rails.application.config.session_store :cookie_store, key: '_donations-backend' 
end