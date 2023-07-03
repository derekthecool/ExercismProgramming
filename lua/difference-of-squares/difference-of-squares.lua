local M = {}

M.square_of_sum = function(n)
	local output = 0
	for i = 1, n do
		output = i + output
	end
	return output * output
end

M.sum_of_squares = function(n)
    local output = 0
	for i = 1, n do
		output = i * i + output
	end
	return output
end

M.difference_of_squares = function(n)
	return (M.square_of_sum(n) - M.sum_of_squares(n))
end

return M
