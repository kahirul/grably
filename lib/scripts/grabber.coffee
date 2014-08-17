page = require('webpage').create()
url = phantom.args[0]
id = phantom.args[1]

page.open url, ->
  page.render "public/images/grabbed/#{id}.png"
  phantom.exit()
  return
