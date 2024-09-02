puts "\u26AA"

require "./lib/board_class"
require "./lib/play_game"

red_circle = "\033[31m⬤\033[0m"
black_circle_yellow = "\033[33m⬤\033[0m"

play = PlayGame.new

puts play.play_game
