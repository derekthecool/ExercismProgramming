--[[
This exercise is great for learning programming

However, it is not good for steno speed programming which I'm actively working on
There is a large amount of exact text that needs to be copied so it is not ideal for quickly writing from scratch
as it requires looking at the problem description

1. Generate the text: This is the [item]
2. That [action] [next item]
3. Repeat until at index 1
]]

local house = {}

local items = {
	[[house that Jack built.]],
	[[malt]],
	[[rat]],
	[[cat]],
	[[dog]],
	[[cow with the crumpled horn]],
	[[maiden all forlorn]],
	[[man all tattered and torn]],
	[[priest all shaven and shorn]],
	[[rooster that crowed in the morn]],
	[[farmer sowing his corn]],
	[[horse and the hound and the horn]],
}

local actions = {
	"",
	"lay in",
	"ate",
	"killed",
	"worried",
	"tossed",
	"milked",
	"kissed",
	"married",
	"woke",
	"kept",
	"belonged to",
}

house.verse = function(verse_index)
	local output_string = string.format("This is the %s", items[verse_index])
	while verse_index > 1 do
		output_string =
			string.format("%s\nthat %s the %s", output_string, actions[verse_index], items[verse_index - 1])
		verse_index = verse_index - 1
	end

	return output_string
end

house.recite = function()
	local output = ""
	for verse = 1, #items do
		local newline = ""
		if verse ~= 1 then
			newline = "\n"
		end

		output = output .. newline .. house.verse(verse)
	end
	return output
end

return house
