return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
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
                snippet("id", function_node(get_random_id)),
                snippet("time", function_node(function() return os.date("%H:%M:%S") end)),
                snippet(
                    "date",
                    choice_node(1, {
                        function_node(function() return os.date("%Y-%m-%d") end),
                        function_node(function() return os.date("%d.%m.%Y") end),
                        function_node(function() return os.date("%m/%d/%Y") end),
                    })
                ),
                ls.parser.parse_snippet(
                    "cpp",
                    [[
-std=c++2b
-Wall
-Wextra
-I
/home/jan/bin/dealii/install/include/
-I
/usr/include/c++/11/
-I
/usr/include/octave-6.4.0/
-I
/usr/include/trilinos/
-I
/usr/include/x86_64-linux-gnu/c++/11/
-I
/usr/lib/gcc/x86_64-linux-gnu/11/include/
-I
/usr/lib/x86_64-linux-gnu/
-I
/usr/lib/x86_64-linux-gnu/openmpi/include/
-I
/usr/share/petsc/3.15/include/petsc/finclude/
]] -- compile_flags.txt
                ),
            },

            c = {
                ls.parser.parse_snippet(
                    "main",
                    [[
#include <stdio.h>

int main() {
    $1
}
]]
                ),
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("printf(\"{}\\n\");", insert_node(1)),
                            fmt("printf(\"{}\");", insert_node(1)),
                        })
                    )
                ),
            },

            cpp = {
                ls.parser.parse_snippet(
                    "main",
                    [[
#include <iostream>

int main() {
    $1
}
]]
                ),
                ls.parser.parse_snippet(
                    "for",
                    [[
for (${1:init-statement}; ${2:condition}; ${3:inc-expression}) {
    ${4:statements}
}
]]
                ),
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("std::cout << {} << '\\n';", insert_node(1)),
                            fmt("std::cout << {};", insert_node(1)),
                            fmt("printf(\"{}\\n\");", insert_node(1)),
                            fmt("printf(\"{}\");", insert_node(1)),
                        })
                    )
                ),
            },

            fortran = {
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("write(*, *) {}", insert_node(1)),
                            fmt("write(*, *) \"{}\"", insert_node(1)),
                        })
                    )
                ),
                snippet(
                    "d",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("write(*, *) {}\nstop", insert_node(1)),
                            fmt("write(*, *) \"{}\"\nstop", insert_node(1)),
                        })
                    )
                ),
            },

            go = {
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("fmt.Println({})", insert_node(1)),
                            fmt("fmt.Println(\"{}\")", insert_node(1)),
                        })
                    )
                ),
            },

            javascript = {
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("console.log({});", insert_node(1)),
                            fmt("console.log(\"{}\");", insert_node(1)),
                        })
                    )
                ),
                snippet(
                    "d",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("console.log({});\nprocess.exit();", insert_node(1)),
                            fmt("console.log(\"{}\");\nprocess.exit();", insert_node(1)),
                        })
                    )
                ),
            },

            julia = {
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("println({});", insert_node(1)),
                            fmt("println(\"{}\");", insert_node(1)),
                        })
                    )
                ),
            },

            lua = {
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("print({})", insert_node(1)),
                            fmt("print(\"{}\")", insert_node(1)),
                            fmt("io.write({})", insert_node(1)),
                            fmt("io.write(\"{}\")", insert_node(1)),
                        })
                    )
                ),
            },

            make = {
                ls.parser.parse_snippet(
                    "run",
                    [[
.PHONY: run

run:
    @$1
]]
                ),
            },

            markdown = {
                ls.parser.parse_snippet("h1", "$1\n================================================================================\n"),
                ls.parser.parse_snippet("h2", "$1\n----------------------------------------------------------------------\n"),
                ls.parser.parse_snippet(
                    "yaml",
                    [[
---
title: $1
author:
    - $2
year: $3
place: $4
type: $5
url: $6
keywords:
    - $7
---
]]
                ),
                ls.parser.parse_snippet(
                    "pandoc",
                    [[
---
geometry: left = 2.5cm, right = 2.5cm, top = 2.5cm, bottom = 2.5cm
pagestyle: plain
papersize: a4
fontfamily: lmodern
graphics: yes
header-includes:
    - \renewcommand*\familydefault{\sfdefault}
    - \renewcommand{\labelitemi}{$\bullet$}
---
]]
                ),
            },

            matlab = {
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("fprintf({});", insert_node(1)),
                            fmt("fprintf(\"{}\");", insert_node(1)),
                        })
                    )
                ),
                snippet(
                    "d",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("{}\npause;", insert_node(1)),
                        })
                    )
                ),
            },

            python = {
                ls.parser.parse_snippet(
                    "main",
                    [[
def main() -> None:
    $1


if __name__ == "__main__":
    main()
]]
                ),
                ls.parser.parse_snippet(
                    "def",
                    [[
def $1($2) -> $3:
    $4
]]
                ),
                snippet(
                    "o",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("print({})", insert_node(1)),
                            fmt("print(f\"{}\")", insert_node(1)),
                            fmt("print(type({}))", insert_node(1)),
                            fmt("print(len({}))", insert_node(1)),
                            fmt("print(np.shape({}))", insert_node(1)),
                        })
                    )
                ),
                snippet(
                    "d",
                    fmt(
                        "{}",
                        choice_node(1, {
                            fmt("print({})\nraise SystemExit()", insert_node(1)),
                            fmt("print(f\"{}\")\nraise SystemExit()", insert_node(1)),
                            fmt("print(type({}))\nraise SystemExit()", insert_node(1)),
                            fmt("print(len({}))\nraise SystemExit()", insert_node(1)),
                            fmt("print(np.shape({}))\nraise SystemExit()", insert_node(1)),
                        })
                    )
                ),
            },
        })

        -- expand or jump forward
        vim.keymap.set({ "i", "s" }, "<A-j>", function()
            if ls.expand_or_jumpable() then ls.expand_or_jump() end
        end, { silent = true })

        -- jump backward
        vim.keymap.set({ "i", "s" }, "<A-k>", function()
            if ls.jumpable(-1) then ls.jump(-1) end
        end, { silent = true })

        -- selecting within list of options
        vim.keymap.set("i", "<A-l>", function()
            if ls.choice_active() then ls.change_choice(1) end
        end)
    end,
}
