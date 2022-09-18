-- CC-IP Library (libccip)
-- common code between parts

function string.starts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end