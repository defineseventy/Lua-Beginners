-- make this later --
-- start this with simple cli calculator first --
print("=== Making a calculator app ====")

function calculate(num1, num2, op)
    if not num1 or not num2 then
        return nil, "Invalid number."
    end

    if op == "+" then
        return num1 + num2
    elseif op == "-" then
        return num1 - num2
    elseif op == "*" then
        return num1 * num2
    elseif op == "/" then
        if num2 == 0 then
            return nil, "Cannot divide by zero."
        end
        return num1 / num2
    elseif op == "%" then
        return num1 % num2
    elseif op == "^" then
        return num1 ^ num2
    end

    return nil, "Invalid operator."
end

while true do
    io.write("Enter number 1: ")
    local num1 = tonumber(io.read())

    io.write("Enter number 2: ")
    local num2 = tonumber(io.read())

    io.write("Operator (+ - * / % ^): ")
    local op = io.read()

    local result, err = calculate(num1, num2, op)

    if err then
        print("Error: " .. err)
    else
        print("Result: " .. result)
    end

    io.write("Another calculation? (y/n): ")
    local answer = io.read()

    if answer ~= "y" then
        break
    end
end

print("Goodbye!")