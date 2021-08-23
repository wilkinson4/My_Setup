local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-eplorer"}

local sonokai_colors = {
  bg = "#313b42",
  -- bg = "#2E3440",
  fg = "#e1e2e3",
  line_bg = "#353f46",
  lbg = "#313b42",
  fg_green = "#a2e57b",
  yellow = "#e3d367",
  cyan = "#7cd5f1",
  darkblue = "#354157",
  green = "#9cd57b",
  orange = "#f3a96a",
  purple = "#7b54eb",
  magenta = "#baa0f8",
  gray = "#82878b",
  blue = "#78cee9",
  red = "#f76c7c"
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

-- auto change color according the vim mode
local mode_color = {
  n = sonokai_colors.green,
  i = sonokai_colors.blue,
  v = sonokai_colors.orange,
  [""] = sonokai_colors.blue,
  V = sonokai_colors.orange,
  c = sonokai_colors.red,
  no = sonokai_colors.magenta,
  s = sonokai_colors.orange,
  S = sonokai_colors.orange,
  [""] = sonokai_colors.orange,
  ic = sonokai_colors.yellow,
  R = sonokai_colors.red,
  Rv = sonokai_colors.purple,
  cv = sonokai_colors.purple,
  ce = sonokai_colors.purple,
  r = sonokai_colors.cyan,
  rm = sonokai_colors.cyan,
  ["r?"] = sonokai_colors.cyan,
  ["!"] = sonokai_colors.red,
  t = sonokai_colors.blue
}

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {sonokai_colors.blue, sonokai_colors.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "     "
    end,
    highlight = {sonokai_colors.green, sonokai_colors.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, sonokai_colors.line_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:F")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {sonokai_colors.orange, sonokai_colors.bg},
    highlight = {sonokai_colors.orange, sonokai_colors.line_bg, "bold"}
  }
}

section.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {sonokai_colors.yellow, sonokai_colors.bg,'bold'}
  }
}


section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {sonokai_colors.orange, sonokai_colors.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "",
    separator_highlight = {sonokai_colors.purple, sonokai_colors.bg},
    highlight = {sonokai_colors.orange, sonokai_colors.line_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[3] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {sonokai_colors.green, sonokai_colors.line_bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "柳",
    highlight = {sonokai_colors.yellow, sonokai_colors.line_bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {sonokai_colors.red, sonokai_colors.line_bg}
  }
}

section.right[6] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = {sonokai_colors.blue, sonokai_colors.line_bg},
    highlight = {sonokai_colors.gray, sonokai_colors.line_bg}
  }
}
-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {sonokai_colors.blue, sonokai_colors.line_bg},
--     highlight = {sonokai_colors.fg, sonokai_colors.line_bg}
--   }
-- }

section.right[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {sonokai_colors.red, sonokai_colors.line_bg},
    separator_highlight = {sonokai_colors.bg, sonokai_colors.bg}
  }
}
section.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = " ",
    highlight = {sonokai_colors.yellow, sonokai_colors.line_bg},
    separator_highlight = {sonokai_colors.bg, sonokai_colors.bg}
  }
}

section.right[10] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = {sonokai_colors.green, sonokai_colors.line_bg},
    separator_highlight = {sonokai_colors.bg, sonokai_colors.bg}
  }
}

section.right[11] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = " ",
    highlight = {sonokai_colors.blue, sonokai_colors.line_bg},
    separator_highlight = {sonokai_colors.bg, sonokai_colors.bg}
  }
}

section.short_line_left[1] = {
  BufferType = {
    provider = "FileIcon",
    separator = " ",
    separator_highlight = {"NONE", sonokai_colors.lbg},
    highlight = {sonokai_colors.blue, sonokai_colors.lbg, "bold"}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = function()
      local fileinfo = require("galaxyline.provider_fileinfo")
      local fname = fileinfo.get_current_file_name()
      for _, v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ""
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {sonokai_colors.white, sonokai_colors.lbg, "bold"}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {sonokai_colors.fg, sonokai_colors.lbg}
  }
}
