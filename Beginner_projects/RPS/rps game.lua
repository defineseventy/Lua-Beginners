-- making Rock Paper Scissors in LOVE --

-- making Rock Paper Scissors in LOVE --

local choices = {"Rock", "Paper", "Scissors"}
local game = {}

-- Get the score
local score = require("rps score")

-- Get player choice
game.playerChoice = ""
game.computerChoice = ""
game.results = "Choose options!"
game.gameOver = false
game.winner = ""

function game.play(choice)

    if game.gameOver then
        return
    end

    game.playerChoice = choice
    game.computerChoice = choices[love.math.random(#choices)]

    if game.playerChoice == game.computerChoice then

        game.results = "It's a tie"
        score.tie = score.tie + 1

    elseif
        (game.playerChoice == "Rock" and game.computerChoice == "Scissors") or
        (game.playerChoice == "Paper" and game.computerChoice == "Rock") or
        (game.playerChoice == "Scissors" and game.computerChoice == "Paper") then

        game.results = "You win!"
        score.wins = score.wins + 1

    else

        game.results = "Computer wins!"
        score.losses = score.losses + 1

    end

    -- First to 5 wins
    if score.wins >= 5 then

        game.gameOver = true
        game.winner = "You won :)"
        game.results = "Match over"

    elseif score.losses >= 5 then

        game.gameOver = true
        game.winner = "Computer wins"
        game.results = "Match over"

    end
end

function game.reset()

    game.playerChoice = ""
    game.computerChoice = ""
    game.results = "Choose options!"
    game.gameOver = false
    game.winner = ""

    score.reset()

end

return game