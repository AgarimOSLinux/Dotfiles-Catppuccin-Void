local wezterm = require 'wezterm';

-- Title

function basename(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane

    local index = ""
    if #tabs > 1 then
        index = string.format("%d: ", tab.tab_index + 1)
    end

    local process = basename(pane.foreground_process_name)

    return {{
        Text = ' ' .. index .. process .. ' '
    }}
end)

return {

font = wezterm.font_with_fallback({
  "FiraCode Nerd Font",
  "feather",
   }),

-- key mappings
  leader = { key = 'a', mods = 'CTRL' },
  keys = {
    {
      key = 'v',
      mods = 'ALT',
      action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } },
    },
    {
      key = 'h',
      mods = 'ALT',
      action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } },
    },
    { key = 'w', mods = 'LEADER', action = 'ShowTabNavigator' },
    { key = '*', mods = 'SUPER', action = wezterm.action { ActivateTabRelative = -1 } },
    { key = '/', mods = 'SUPER', action = wezterm.action { ActivateTabRelative = 1 } },
    { key = '/', mods = 'SUPER|SHIFT', action = wezterm.action { MoveTabRelative = -1 } },
    { key = '*', mods = 'SUPER|SHIFT', action = wezterm.action { MoveTabRelative = 1 } },
    { key = 'u', mods = 'SUPER', action = wezterm.action { ScrollByPage = -1 } },
    { key = 'd', mods = 'SUPER', action = wezterm.action { ScrollByPage = 1 } },
    { key = 'l', mods = 'SUPER', action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'h', mods = 'SUPER', action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'k', mods = 'SUPER', action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'u', mods = 'SUPER', action = wezterm.action { ScrollByPage = -1 } },
    { key = 'd', mods = 'SUPER', action = wezterm.action { ScrollByPage = 1 } },
    { key = 'l', mods = 'SUPER', action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'h', mods = 'SUPER', action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'k', mods = 'SUPER', action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'j', mods = 'SUPER', action = wezterm.action { ActivatePaneDirection = 'Down' } },
    { key = '0', mods = 'SUPER', action = 'ResetFontSize' },
    { key = '-', mods = 'SUPER', action = 'DecreaseFontSize' },
    { key = '+', mods = 'SUPER', action = 'IncreaseFontSize' },
    { key = 'z', mods = 'SUPER', action = 'TogglePaneZoomState' },
    { key = 't', mods = 'SUPER', action = wezterm.action { SpawnTab = 'CurrentPaneDomain' } },
    { key = 'W', mods = 'SUPER', action = wezterm.action { CloseCurrentTab = { confirm = true } } },
    { key = 'w', mods = 'SUPER', action = wezterm.action { CloseCurrentPane = { confirm = true } } },
    { key = ' ', mods = 'LEADER', action = 'QuickSelect' },
    { key = 'f', mods = 'SUPER', action = 'ToggleFullScreen' },
    { key = 'h', mods = 'SUPER|ALT', action = wezterm.action { AdjustPaneSize = { 'Left', 5 } } },
    { key = 'j', mods = 'SUPER|ALT', action = wezterm.action { AdjustPaneSize = { 'Down', 5 } } },
    { key = 'k', mods = 'SUPER|ALT', action = wezterm.action { AdjustPaneSize = { 'Up', 5 } } },
    { key = 'l', mods = 'SUPER|ALT', action = wezterm.action { AdjustPaneSize = { 'Right', 5 } } },
},



front_end = "OpenGL",
font_size = 12,

color_scheme = "Catppuccin Mocha",
window_padding = {
left = 10,
right = 10,
top = 10,
bottom = 10,
},

window_background_opacity = 0.88,
enable_tab_bar = true,
hide_tab_bar_if_only_one_tab = true,
tab_bar_at_bottom = true,
use_fancy_tab_bar = false,
scrollback_lines = 5000,
tab_max_width = 20,
enable_kitty_graphics = true,
enable_scroll_bar = false,
warn_about_missing_glyphs = false,
adjust_window_size_when_changing_font_size = true,
check_for_updates = false,
bold_brightens_ansi_colors = true,
selection_word_boundary = " \t\n{}[]()\"'`,;:=",
audible_bell = "Disabled",
use_ime = true,
automatically_reload_config = true,
enable_wayland = true,
swallow_mouse_click_on_pane_focus = true,
default_prog = {"/bin/zsh"},
default_cwd = "/home/jose",
term = "xterm-256color",
default_cursor_style = "BlinkingBlock",
text_background_opacity = 1.0,
exit_behavior = "Close",

 hyperlink_rules = {
    -- Linkify things that look like URLs and the host has a TLD name.
    {
      regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },

    -- linkify email addresses
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = "mailto:$0",
    },

    -- file:// URI
    {
      regex = [[\bfile://\S*\b]],
      format = "$0",
    },

    -- Linkify things that look like URLs with numeric addresses as hosts.
    -- E.g. http://127.0.0.1:8000 for a local development server,
    -- or http://192.168.1.1 for the web interface of many routers.
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = "$0",
    },

    -- Make username/project paths clickable. This implies paths like the following are for GitHub.
    -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
    -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
    -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
    {
      regex = [["([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)"]],
      format = "https://www.github.com/$1/$3",
    },
  },
}
