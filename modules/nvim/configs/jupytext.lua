-- make sure to add jupytext python package bin to path
require("jupytext").setup({
  style = "hydrogen",
  output_extension = "auto",  -- Default extension. Don't change unless you know what you are doing
  force_ft = nil,  -- Default filetype. Don't change unless you know what you are doing
  custom_language_formatting = {
    python = {
      extension = "qmd",
      style = "quarto",
      force_ft = "quarto", -- you can set whatever filetype you want here
    },
  }
})

