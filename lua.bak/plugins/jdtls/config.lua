local function jdtls_setup(event)
    local lspinfoConfig = require("plugins.lsp.config")

    local jdtls = require("jdtls")

    local root_markers = { "gradlew", "mvnw", ".git" }
    local root_dir = require("jdtls.setup").find_root(root_markers)

    local home = os.getenv("HOME")
    local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    local cache_vars = {}

    local config = {

        flags = {
            debounce_text_changes = 80,
        },
        on_attach = function()
            lspinfoConfig.on_attach() -- We pass our on_attach keybindings to the configuration map
            jdtls.setup_dap({ hotcodereplace = "auto" })
            require("jdtls.dap").setup_dap_main_class_configs()
        end,
        capabilities = lspinfoConfig.capabilities,
        root_dir = root_dir, -- Set the root directory to our found root_marker
        -- Here you can configure ekkclipse.jdt.ls specific settings
        -- These are defined by the eclipse.jdt.ls project and will be passed to eclipse when starting.
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- for a list of options
        settings = {
            java = {
                format = {
                    enabled = true,
                    -- settings = {
                    --     -- Use Google Java style guidelines for formatting
                    --     -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
                    --     -- and place it in the ~/.local/share/eclipse directory
                    --     url = "/.local/share/eclipse/eclipse-java-google-style.xml",
                    --     profile = "GoogleStyle",
                    -- },
                },
                signatureHelp = { enabled = true },
                contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
                -- Specify any completion options
                completion = {
                    favoriteStaticMembers = {
                        "org.hamcrest.MatcherAssert.assertThat",
                        "org.hamcrest.Matchers.*",
                        "org.hamcrest.CoreMatchers.*",
                        "org.junit.jupiter.api.Assertions.*",
                        "java.util.Objects.requireNonNull",
                        "java.util.Objects.requireNonNullElse",
                        "org.mockito.Mockito.*",
                    },
                    filteredTypes = {
                        "com.sun.*",
                        "io.micrometer.shaded.*",
                        "java.awt.*",
                        "jdk.*",
                        "sun.*",
                    },
                },
                -- Specify any options for organizing imports
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999,
                    },
                },
                -- How code generation should act
                codeGeneration = {
                    toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                    },
                    hashCodeEquals = {
                        useJava7Objects = true,
                    },
                    useBlocks = true,
                },
                -- If you are developing in projects with different Java versions, you need
                -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
                -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
                -- And search for `interface RuntimeOption`
                -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
                -- configuration = {
                --     runtimes = {
                --         {
                --             name = "JavaSE-17",
                --             path = home .. "/.asdf/installs/java/corretto-17.0.4.9.1",
                --         },
                --         {
                --             name = "JavaSE-11",
                --             path = home .. "/.asdf/installs/java/corretto-11.0.16.9.1",
                --         },
                --         {
                --             name = "JavaSE-1.8",
                --             path = home .. "/.asdf/installs/java/corretto-8.352.08.1",
                --         },
                -- },
                -- },
            },
        },
        init_options = {
            bundles = {
                vim.fn.glob(
                -- home
                -- "/home/krzys/"
                -- "/home/krzys/.m2/repository/com/microsoft/java/com.mirosoft.java.debug.plugin/0.50.0/com.microsoft.java.debug.plugin-*.jar",
                    "~/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.50.0/com.microsoft.java.debug.plugin-*.jar",
                    1
                ),
            },
        },
        -- cmd is the command that starts the language server. Whatever is placed
        -- here is what is passed to the command line to execute jdtls.
        -- Note that eclipse.jdt.ls must be started with a Java version of 17 or higher
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        -- for the full list of options
        cmd = {
            "jdtls",
        },
    }

    jdtls.start_or_attach(config)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java" },
    desc = "Setup jdtls",
    callback = jdtls_setup,
    callback = jdtls_setup,
})
