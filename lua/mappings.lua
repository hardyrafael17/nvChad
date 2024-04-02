function FormatJavaScriptAndJSX()
  -- Check if the filetype is javascript or javascriptreact
  local filetype = vim.bo.filetype
  if filetype == "javascript" or filetype == "javascriptreact" then
    -- Save the cursor position
    local cursor_pos = vim.fn.getpos "."

    -- Save the current buffer's content to a temporary file
    local temp_file = vim.fn.tempname()
    vim.cmd("silent! w! " .. temp_file)

    -- Run the standard command with the temporary file as argument
    local command = string.format("standard --fix %s", temp_file)

    -- Run the command asynchronously using jobstart
    vim.fn.jobstart(command, {
      on_exit = function(_, exit_code, _)
        -- Read the modified content back into the buffer
        local modified_content = vim.fn.readfile(temp_file)
        vim.cmd "edit!"
        vim.fn.setline(1, modified_content)
        vim.cmd "w"

        -- Delete the temporary file
        vim.loop.fs_unlink(temp_file, function(err)
          if err then
            print("Error deleting temporary file:", err)
          end
        end)
        -- Redraw the buffer
        vim.cmd "redraw!"
      end,
      on_stderr = function(_, data, _)
        if data then
          print(vim.inspect(data))
        end
      end,
      on_stdout = function(_, data, _)
        if data then
          print(vim.inspect(data))
        end
      end,
    })

    -- Restore the cursor position
    vim.fn.setpos(".", cursor_pos)
  else
    print "This command can only be used with JavaScript or JavaScriptReact files."
  end
end

require "nvchad.mappings"
-- Disable mappings
--
local nomap = vim.keymap.del
nomap("n", "<C-n>")
nomap("n", "<leader>e")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  -- get filetype and check if it's javascript or javascriptreact
  local filetype = vim.bo.filetype
  if filetype == "javascript" or filetype == "javascriptreact" then
    print "Formatting JavaScript and JSX..."
    FormatJavaScriptAndJSX()
  else
    require("conform").format()
  end
end, { desc = "File Format with conform" })

map("i", "jj", "<ESC>", { desc = "Escape insert mode" })
map("i", "kk", "<ESC>", { desc = "Escape insert mode" })
map("n", "<leader>e", "<cmd>NvimTreeToggle <cr>", { desc = "Toggle File Browser" })
map("n", "<S-h>", "<cmd>bp <cr>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>bn <cr>", { desc = "Next Buffer" })
map("n", "<leader>w", ":w<cr>", { desc = "Save changes" })
map("n", "<leader>gd", function()
  local function Toogle_git_diff_tool()
    if vim.g.is_custom_git_dif_tool_open == true then
    print "true"
    else
    print "false"
    end
    print "custom_git_dif_tool_open"
    if vim.g.is_custom_git_dif_tool_open == true then
      vim.cmd "DiffviewClose"
    else
      vim.cmd "DiffviewOpen"
    end
  end
  if vim.g.is_custom_git_dif_tool_open == nil then
    vim.g.is_custom_git_dif_tool_open = false
    Toogle_git_diff_tool()
  else
    if vim.g.is_custom_git_dif_tool_open == true then
      vim.g.is_custom_git_dif_tool_open = false
      Toogle_git_diff_tool()
    elseif vim.g.is_custom_git_dif_tool_open == false then
      vim.g.is_custom_git_dif_tool_open = true
      Toogle_git_diff_tool()
    end
  end
end, { desc = "Toggle Git Diff Tool" })

-- Codeium mappings
map("i", "<C-a>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
map("i", "<C-m>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
map("i", "<C-g>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
map("i", "<C-d>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })
map("n", "<leader>cc", function()
  return vim.fn["codeium#Chat"]()
end, { expr = true, silent = true }, { desc = "Codeium Chat" })
