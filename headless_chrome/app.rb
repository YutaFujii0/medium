require_relative "headless_chrome"

# Replace or add urls you want to take screenshots
url = "https://medium.com/"

# Call the method defined in 'screenshot.rb'
Screenshot.call(url)

# uncomment here if you want to specify the path to save image file
# by default, screenshot image will be saved at the same directory level as 'screenshot.rb' file
# path = "YOUR_PATH"
# Screenshot.call(url, path)
