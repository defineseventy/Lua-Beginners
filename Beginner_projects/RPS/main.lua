local game = require("rps game")
local score = require("rps score")
local ui = require("rps ui")

function love.load()
    love.window.setTitle("Rock Paper Scissors")
    love.window.setMode(800, 600)

    ui.load(game, score)
end

function love.mousepressed(x, y, button)
    ui.mousepressed(x, y, button)
end

function love.draw()
    ui.draw()
end