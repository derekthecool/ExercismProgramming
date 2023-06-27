local Hamming = {}

function Hamming.compute(a, b)
	local length_a = #a
	if length_a ~= #b then
		return -1
	elseif length_a == 0 or a == b then
		return 0
	else
		local hamming = 0
		for i = 1, length_a + 1 do
			if a:sub(i, i) ~= b:sub(i, i) then
				hamming = hamming + 1
			end
		end
		return hamming
	end
end

return Hamming
