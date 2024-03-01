return function(s)
    local letter_table = {}
    for  letter in s:tolower():gmatch('[a-z]') do
        letter_table[letter] = (letter_table[letter] or 0) + 1
    end
end
