return function(s)
	local M = {}

	M.row = function(a)
		return { 0, 0, 0 }
	end
	M.column = function(a)
		return { 0, 0, 0 }
	end

	return M
end
