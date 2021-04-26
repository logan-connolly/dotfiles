local prettier = { cmd = { "prettier -w" }}
local prettier_eslint = { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" }}
local python = { cmd = { "black", "isort" }}
local python_markdown = {
	cmd = { "black" },
	start_pattern = "^```python$",
	end_pattern = "^```$",
	target = "current"
}
local remove_whitespace = { cmd = { "sed -i 's/[ \t]*$//'" }}

require "format".setup {
	["*"] = { remove_whitespace },
	css = { prettier },
	html = { prettier },
	html = { prettier },
	json = { prettier },
	yaml = { prettier },
	markdown = { prettier, python_markdown },
	javascript = { prettier_eslint },
	vue	 = { prettier_eslint },
	python = { python },
}
