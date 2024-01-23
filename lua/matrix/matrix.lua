return function(s)
	local M = {}

	local matrix = {}
	local count = 0
	for row in s:gmatch("[^\n]+") do
		count = count + 1
		matrix[count] = {}
		for column in row:gmatch("%d+") do
			table.insert(matrix[count], tonumber(column))
		end
	end

	M.row = function(a)
		return matrix[a]
	end

	M.column = function(a)
		local column_output = {}
		for i = 1, #matrix do
			table.insert(column_output, matrix[i][a])
		end
		return column_output
	end

	return M
end
