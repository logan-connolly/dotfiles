require "format".setup {
	["*"] = {
		{ cmd = { "sed -i 's/[ \t]*$//'" }} -- remove trailing whitespace
	},
	python = {
		{ cmd = { "black", "isort" }}
	},
	markdown = {
		{ cmd = { "prettier -w" }},
		{
			cmd = { "black" },
			start_pattern = "^```python$",
			end_pattern = "^```$",
			target = "current"
		}
	}
}
