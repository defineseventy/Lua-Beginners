local ui = {}

local game
local score

local buttonWidth = 150
local buttonHeight = 50
local spacing = 25

local totalWidth =
    buttonWidth * 3 +
    spacing * 2

local startX =
    (800 - totalWidth) / 2

local buttons = {
    {
        text = "Rock",
        x = startX,
        y = 330,
        w = buttonWidth,
        h = buttonHeight
    },

    {
        text = "Paper",
        x = startX + buttonWidth + spacing,
        y = 330,
        w = buttonWidth,
        h = buttonHeight
    },

    {
        text = "Scissors",
        x = startX + (buttonWidth + spacing) * 2,
        y = 330,
        w = buttonWidth,
        h = buttonHeight
    }
}

local restartButton = {
    text = "Restart",
    x = (800 - 200) / 2,
    y = 440,
    w = 200,
    h = 50
}

function ui.load(gameModule, scoreModule)
    game = gameModule
    score = scoreModule
end

function ui.mousepressed(x, y, button)
    if button ~= 1 then
        return
    end

    -- Choice buttons
    for _, b in ipairs(buttons) do
        if x >= b.x and x <= b.x + b.w and
           y >= b.y and y <= b.y + b.h then

            game.play(b.text)
            return
        end
    end

    -- Restart button
    if x >= restartButton.x and
       x <= restartButton.x + restartButton.w and
       y >= restartButton.y and
       y <= restartButton.y + restartButton.h then

        game.reset()
    end
end

function ui.draw()
    -- Title
    love.graphics.printf(
        "ROCK PAPER SCISSORS",
        0,
        40,
        800,
        "center"
    )

    -- Choices
    love.graphics.printf(
        "Your Choice: " .. game.playerChoice,
        0,
        90,
        800,
        "center"
    )

    love.graphics.printf(
        "Computer Choice: " .. game.computerChoice,
        0,
        120,
        800,
        "center"
    )

    love.graphics.printf(
        "Result: " .. game.results,
        0,
        150,
        800,
        "center"
    )

    -- Score Panel
    love.graphics.rectangle(
        "line",
        250,
        190,
        300,
        120
    )

    love.graphics.printf(
        "MATCH SCORE",
        0,
        200,
        800,
        "center"
    )

    love.graphics.printf(
        "Wins: " .. score.wins,
        0,
        230,
        800,
        "center"
    )

    love.graphics.printf(
        "Losses: " .. score.losses,
        0,
        255,
        800,
        "center"
    )

    love.graphics.printf(
        "Ties: " .. score.tie,
        0,
        280,
        800,
        "center"
    )

    -- Choice Buttons
    for _, b in ipairs(buttons) do
        love.graphics.rectangle(
            "line",
            b.x,
            b.y,
            b.w,
            b.h
        )

        love.graphics.printf(
            b.text,
            b.x,
            b.y + 15,
            b.w,
            "center"
        )
    end

    -- Winner Message
    if game.gameOver then
        love.graphics.printf(
            game.winner,
            0,
            400,
            800,
            "center"
        )
    end

    -- Restart Button
    love.graphics.rectangle(
        "line",
        restartButton.x,
        restartButton.y,
        restartButton.w,
        restartButton.h
    )

    love.graphics.printf(
        restartButton.text,
        restartButton.x,
        restartButton.y + 15,
        restartButton.w,
        "center"
    )
end

return ui