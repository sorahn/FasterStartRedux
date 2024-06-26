function IsModChanged(data, modName)
	if data
			and data.mod_changes
			and data.mod_changes[modName]
			and data.mod_changes[modName].old_version then
		return true
	end
	return false
end

function GetOldVersion(data, modName)
	return FormatVersion(data.mod_changes[modName].old_version)
end

function GetNewVersion(data, modName)
	return FormatVersion(data.mod_changes[modName].new_version)
end

function FormatVersion(version)
	return string.format("%02d.%02d.%02d", string.match(version, "(%d+).(%d+).(%d+)"))
end

function Contains(tab, elem)
	for _, v in pairs(tab) do
		if v == elem then
			return true
		elseif type(v) == "table" then
			if Contains(v, elem) then
				return true
			end
		end
	end
	return false
end

function Remove(tab, elem)
	for i, v in pairs(tab) do
		if v == elem then
			table.remove(tab, i)
			return true
		end
	end
	return false
end

function Count(list)
	local i = 0
	for _ in pairs(list) do
		i = i + 1
	end
	return i
end
