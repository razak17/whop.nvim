local M = {}

local commands = {
	{
		name = "[builtin] Base64 Encode (base64)",
		cmd = [[%!base64]],
	},
	{
		name = "[builtin] Base64 Encode without newlines (tr, base64)",
		cmd = [[%!tr -d '\n' | base64]],
	},
	{
		name = "[builtin] Base64 Decode (base64)",
		cmd = [[%!base64 -d]],
	},
	{
		name = "[builtin] Format JSON (jq)",
		cmd = [[%!jq]],
	},
	{
		name = "[builtin] URL Encode (jq)",
		cmd = [[%!jq -sRr @uri]],
	},
	{
		name = "[builtin] Minify JSON (jq)",
		cmd = [[%!jq -r tostring]],
	},
	{
		name = "[builtin] Build MD5 (md5)",
		cmd = [[%!md5]],
	},
	{
		name = "[builtin] Build SHA1 (tr, sha1sum)",
		cmd = [[%!tr -d '\n' | sha1sum]],
	},
	{
		name = "[builtin] Build SHA256 (tr, sha256sum)",
		cmd = [[%!tr -d '\n' | sha256sum]],
	},
	{
		name = "[builtin] Build SHA512 (tr, sha512sum)",
		cmd = [[%!tr -d '\n' | sha512sum]],
	},
	{
		name = "[builtin] Reverse (rev)",
		cmd = [[%!rev]],
	},
	{
		name = "[builtin] Remove all whitespace (tr)",
		cmd = [[%!tr -d "[:space:]"]],
	},
	{
		name = "[builtin] Remove blank lines (grep)",
		cmd = [[%!grep .]],
	},
	{
		name = "[builtin] Remove blank lines with spaces only (grep)",
		cmd = [[%!grep "\S"]],
	},
	{
		name = "[builtin] Remove blank lines (rg)",
		cmd = [[%!rg -N .]],
	},
	{
		name = "[builtin] Remove blank lines with spaces only (rg)",
		cmd = [[%!rg -N "\S"]],
	},
	{
		name = "[builtin] Join lines with comma (vim)",
		cmd = [[%s/\n/,/]],
	},
	{
		name = "[builtin] Wrap numbers with single quotes (vim)",
		cmd = [[%s/\(\d*\)/'\1'/g]],
	},
	{
		name = "[builtin] Wrap numbers with double quotes (vim)",
		cmd = [[%s/\(\d*\)/"\1"/g]],
	},
	{
		name = "[builtin] Remove single quotes (vim)",
		cmd = [[%s/'//g]],
	},
	{
		name = "[builtin] Remove double quotes (vim)",
		cmd = [[%s/'//g]],
	},
	{
		name = "[builtin] Remove duplicate lines (vim)",
		cmd = [[sort u]],
	},
	{
		name = "[builtin] Remove duplicate lines (sort, uniq)",
		cmd = [[%!sort | uniq -u]],
	},
	{
		name = "[builtin] Query string to json (tr, python)",
		cmd = [[%!tr -d '\n'  | python -c 'import sys; from urllib.parse import parse_qs; import json; print(json.dumps(parse_qs(sys.stdin.read())))']],
	},
	{
		name = "[builtin] Sum all (awk)",
		cmd = [[%!awk '{s+=$1} END {print s}']],
	},
	{
		name = "[builtin] Python dict to JSON (python)",
		cmd = [[%!python -c 'import sys; import json; print(json.dumps(sys.stdin.read()))]],
	},
	-- TODO: add more commands:
	--  - URL Decode
	--  - HTML Encode
	--  - HTML Decode
	--  - Sort json
	--  - Markdown quote
	--  - Count characters (view only)
	--  - Count words (view only)
	--  - Shuffle lines
	--  - Change cURL format from Windows to Unix
	--  - JSON to Query String
	--  - JSON to YAML
	--  - Lorem ipsum
	--  - HEX to RGB
	--  - RGB to HEX
	--  - JSON to CSV
	--  - CSV to JSON
	--  - Lower Case
	--  - Camel Case
	--  - Snake Case
	--  - Upper Case
	--  - Kebab Case
	--  - Replace single quotes with double quotes
	--  - Replace double quotes with single quotes
	--  - Wrap with single quotes
	--  - Wrap with double quotes
}

function M.setup(config)
	M._commands = vim.tbl_deep_extend("force", commands, config.commands or {})
end

return M