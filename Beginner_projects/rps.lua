-- Rock Paper Scissors on Lua --
-- make the computer move first --
local choice = {"Rock", "Paper", "Scissors"}
local playscore, comscore = 0, 0

-- use while loop -- 
while true do
    print("Make your move and let's play RPS")
    print("1. Rock")
    print("2. Paper")
    print("3. Scissors")
    print("0: Quit")

    -- get player choice
    io.write("> ")
    local player = tonumber(io.read())
    
    -- provided the player wants to quit or enters an invalid choice
    if player == 0 then
        print("I quit")
        break
    end
    if player < 1 or player > 3 then
        print("Invalid move bzzt")
    else
        -- Test the RPS --
        local computer = math.random(1, 3)
        print("Your choice: " .. choice[player])
        print("Computer choice: " .. choice[computer])

        if player == computer then
            print("It's a tie")
        elseif 
            (player == 1 and computer == 3) or
            (player == 2 and computer == 1) or 
            (player == 3 and computer == 1) then
                print("You got a point")
                playscore = playscore + 1
        else
            print("Computer wins!")
            comscore = comscore + 1
        end

        print()
        print("Player Score: " .. playscore)
        print("Computer Score: " .. comscore)
    end
end
print("Final Score")
print("Player Score: " .. playscore)
print("Computer Score: " .. comscore)