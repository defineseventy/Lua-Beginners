-- make the score --
local score = {}

-- Wins, losses and tie --
score.wins = 0
score.losses = 0
score.tie = 0

-- call for game reset --
function score.reset()
    score.wins = 0
    score.losses = 0
    score.tie = 0
end

return score