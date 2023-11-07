return function(array, target)
    if #array == 0 then
        return -1
    end

    local midpoint = math.ceil(#array / 2)
    if array[midpoint] == target then
        return 1
    end

    

    
end
