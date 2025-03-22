
local jdtls = require("jdtls")

local home = os.getenv("HOME")
local workspace = home .. "/.local/share/nvim/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  cmd = { home .. "/.local/share/nvim/mason/bin/jdtls", "-data", workspace },
  root_dir = require("jdtls.setup").find_root({ "gradlew", "mvnw", ".git" }), -- ✅ Fixed missing comma

  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "automatic",
      },
      completion = {
        favoriteStaticMembers = {
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
        },
        importOrder = { "java", "javax", "com", "org" },
      },
      signatureHelp = { enabled = true },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        useBlocks = true,
      },
    },
  },

  flags = {
    debounce_text_changes = 150,
  },
}

jdtls.start_or_attach(config)


