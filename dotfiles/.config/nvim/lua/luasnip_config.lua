local ls = require("luasnip")

local snippet = ls.snippet
local insert_node = ls.insert_node
local function_node = ls.function_node
local choice_node = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
})

local get_random_id = function()
    math.randomseed(os.time())
    local id = ""
    for _ = 1, 12 do
        id = id .. math.random(0, 9)
    end
    return id
end

ls.add_snippets(nil, {
    all = {
        ls.parser.parse_snippet("expand", "this is what expanded!"),
        snippet("id", function_node(get_random_id)),
        snippet("time", function_node(function() return os.date("%H:%M:%S") end)),
        snippet("date", choice_node(1, {
            function_node(function() return os.date("%Y-%m-%d") end),
            function_node(function() return os.date("%d.%m.%Y") end),
            function_node(function() return os.date("%m/%d/%Y") end),
        })),
        ls.parser.parse_snippet("cpp",  -- compile_flags.txt
        "-std=c++2b\n" ..
        "-Wall\n" ..
        "-Wextra\n" ..
        "-I\n" ..
        "/home/jan/bin/dealii/install/include/\n" ..
        "-I\n" ..
        "/usr/lib/x86_64-linux-gnu/openmpi/include/\n" ..
        "-I\n" ..
        "/usr/include/c++/11/\n" ..
        "-I\n" ..
        "/usr/include/octave-6.4.0/\n" ..
        "-I\n" ..
        "/usr/include/x86_64-linux-gnu/c++/11/\n" ..
        "-I\n" ..
        "/usr/lib/gcc/x86_64-linux-gnu/11/include/\n" ..
        "-I\n" ..
        "/usr/lib/x86_64-linux-gnu/\n" ..
        "-I\n" ..
        "/usr/lib/x86_64-linux-gnu/openmpi/include/"
        ),
    },

    c = {
        ls.parser.parse_snippet("main",
        "#include <stdio.h>\n" ..
        "\n" ..
        "int main() {\n" ..
        "    $1\n" ..
        "}"
        ),
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("printf(\"{}\\n\");", insert_node(1)),
                fmt("printf(\"{}\");", insert_node(1)),
            })
        )),
    },

    cpp = {
        ls.parser.parse_snippet("main",
        "#include <iostream>\n" ..
        "\n" ..
        "int main() {\n" ..
        "    $1\n" ..
        "}"
        ),
        ls.parser.parse_snippet("for",
        "for (${1:init-statement}; ${2:condition}; ${3:inc-expression}) {\n" ..
        "    ${4:statements};\n" ..
        "}"
        ),
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("std::cout << {} << '\\n';", insert_node(1)),
                fmt("std::cout << {};", insert_node(1)),
                fmt("printf(\"{}\\n\");", insert_node(1)),
                fmt("printf(\"{}\");", insert_node(1)),
            })
        )),
    },

    fortran = {
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("write(*, *) {}", insert_node(1)),
                fmt("write(*, *) \"{}\"", insert_node(1)),
            })
        )),
        snippet("d", fmt("{}",
            choice_node(1, {
                fmt("write(*, *) {}\nstop", insert_node(1)),
                fmt("write(*, *) \"{}\"\nstop", insert_node(1)),
            })
        )),
    },

    go = {
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("fmt.Println({})", insert_node(1)),
                fmt("fmt.Println(\"{}\")", insert_node(1)),
            })
        )),
    },

    javascript = {
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("console.log({});", insert_node(1)),
                fmt("console.log(\"{}\");", insert_node(1)),
            })
        )),
        snippet("d", fmt("{}",
            choice_node(1, {
                fmt("console.log({});\nprocess.exit();", insert_node(1)),
                fmt("console.log(\"{}\");\nprocess.exit();", insert_node(1)),
            })
        )),
    },

    julia = {
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("println({});", insert_node(1)),
                fmt("println(\"{}\");", insert_node(1)),
            })
        )),
    },

    lua = {
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("print({})", insert_node(1)),
                fmt("print(\"{}\")", insert_node(1)),
                fmt("io.write({})", insert_node(1)),
                fmt("io.write(\"{}\")", insert_node(1)),
            })
        )),
    },

    make = {
        ls.parser.parse_snippet("run",
        ".PHONY: run\n" ..
        "\n" ..
        "run:\n" ..
        "\t@$1"
        ),
    },

    markdown = {
        ls.parser.parse_snippet("h1", "$1\n================================================================================\n"),
        ls.parser.parse_snippet("h2", "$1\n----------------------------------------------------------------------\n"),
        ls.parser.parse_snippet("yaml",
        "---\n" ..
        "title: $1\n" ..
        "author:\n" ..
        "    - $2\n" ..
        "year: $3\n" ..
        "place: $4\n" ..
        "type: $5\n" ..
        "url: $6\n" ..
        "keywords:\n" ..
        "    - $7\n" ..
        "---\n" ..
        "\n" ..
        "[PDF]($8.pdf)\n" ..
        "\n" ..
        "# Abstract by the author\n" ..
        "\n" ..
        "$9"
        ),
    },

    matlab = {
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("fprintf({});", insert_node(1)),
                fmt("fprintf(\"{}\");", insert_node(1)),
            })
        )),
        snippet("d", fmt("{}",
            choice_node(1, {
                fmt("{}\npause;", insert_node(1)),
            })
        )),
    },

    python = {
        ls.parser.parse_snippet("main",
        "\"\"\"$1\"\"\"\n" ..
        "\n" ..
        "\n" ..
        "def main():\n" ..
        "    \"\"\"Main function\"\"\"\n" ..
        "\n" ..
        "    $2\n" ..
        "\n" ..
        "\n" ..
        "if __name__ == \"__main__\":\n" ..
        "    main()"
        ),
        ls.parser.parse_snippet("def",
        "def $1($2):\n" ..
        "    \"\"\"$1 function\"\"\"\n" ..
        "\n" ..
        "    $3"
        ),
        snippet("o", fmt("{}",
            choice_node(1, {
                fmt("print({})", insert_node(1)),
                fmt("print(f\"{}\")", insert_node(1)),
            })
        )),
        snippet("d", fmt("{}",
            choice_node(1, {
                fmt("print({})\nraise SystemExit()", insert_node(1)),
                fmt("print(f\"{}\")\nraise SystemExit()", insert_node(1)),
            })
        )),
    },
})
