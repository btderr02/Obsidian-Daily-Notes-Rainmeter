function Initialize()
    sFileToRead = SELF:GetOption('FileToRead')
end

function Update()
    local hReadingFile = io.open(sFileToRead, "r")
    if not hReadingFile then
        print('ObsidianDailyNoteDisplay: unable to open file at ' .. sFileToRead)
        return ""
    end

    local sAllText = "\n"
    for line in hReadingFile:lines() do
        -- Replace tab characters with spaces
        line = string.gsub(line, "\t", "    ")
		
		-- Insert unicode characters to reflect checkboxes
		line = string.gsub(line, "- %[%s%]", "⬜")
        line = string.gsub(line, "- %[x%]", "■")
		
		-- Remove text inside parentheses if it comes directly after text within brackets
        line = string.gsub(line, "(%[.-%])%b()", "%1")
		
        -- Check if the line is longer than 50 characters and truncate if necessary
        if string.len(line) > 60 then
			local cutOff = 60
			-- Find the position of the last space before the cutoff
			for i = 60, 1, -1 do
				if string.sub(line, i, i) == " " then
					cutOff = i
					break
				end
			end
			line = string.sub(line, 1, cutOff) .. "..."
		end

        -- Add a "-" character to lines not starting with "#" and not empty to bring them in line with heading objects.
        if not string.match(line, "^#") and line ~= "" then
            line = "-  " .. line
        end

        -- Append the processed line to the rest of the text
        sAllText = sAllText .. line .. "\n"
    end

    hReadingFile:close()

    return sAllText
end
