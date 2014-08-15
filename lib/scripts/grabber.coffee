page = require('webpage').create()
page.open 'https://github.com/', ->
  page.render 'public/images/grabbed/github.png'
  phantom.exit()
  return
