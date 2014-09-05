page = require('webpage').create()
page.viewportSize = { width: 1366, height: 768 }
url = phantom.args[0]
id = phantom.args[1]

page.open url, ->
  page.render "public/images/grabbed/#{id}.png"
  phantom.exit()
  return
