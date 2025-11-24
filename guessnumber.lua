-- Seed the random number generator
math.randomseed(os.time() * 100000)

local not_found = true
local n = math.random(1, 10)
while not_found do
    print("Guess random number")
    local input = io.read("*n")
    if input == n then
        print("Correct")
        not_found = false
    else
        print("Incorrect try again")
    end
end
