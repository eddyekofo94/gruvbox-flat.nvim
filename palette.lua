local palette = {}
-- local rgb_color = vim.api.nvim_get_color_by_name

local is_dark = vim.o.background == "dark"

local function palette_base(gruvbox_bg, p)
    if gruvbox_bg == "hard" then
        if is_dark then
            p.bg0 = {"#1a1a1a", "233"}
            p.bg1 = {"#282828", "235"}
            p.bg2 = {"#282828", "235"}
            p.bg3 = {"#3c3836", "237"}
            p.bg4 = {"#3c3836", "237"}
            p.bg5 = {"#504945", "239"}
            p.bg_statusline1 = {"#282828", "235"}
            p.bg_statusline2 = {"#32302f", "235"}
            p.bg_statusline3 = {"#504945", "239"}
            p.bg_diff_green = {"#32361a", "22"}
            p.bg_visual_green = {"#333e34", "22"}
            p.bg_diff_red = {"#3c1f1e", "52"}
            p.bg_visual_red = {"#442e2d", "52"}
            p.bg_diff_blue = {"#0d3138", "17"}
            p.bg_visual_blue = {"#2e3b3b", "17"}
            p.bg_visual_yellow = {"#473c29", "94"}
            p.bg_current_word = {"#32302f", "236"}
        else
            p.bg0 = {"#f9f5d7", "230"}
            p.bg1 = {"#f5edca", "229"}
            p.bg2 = {"#f3eac7", "229"}
            p.bg3 = {"#f2e5bc", "228"}
            p.bg4 = {"#eee0b7", "223"}
            p.bg5 = {"#ebdbb2", "223"}
            p.bg_statusline1 = {"#f5edca", "223"}
            p.bg_statusline2 = {"#f3eac7", "223"}
            p.bg_statusline3 = {"#eee0b7", "250"}
            p.bg_diff_green = {"#e4edc8", "194"}
            p.bg_visual_green = {"#dde5c2", "194"}
            p.bg_diff_red = {"#f8e4c9", "217"}
            p.bg_visual_red = {"#f0ddc3", "217"}
            p.bg_diff_blue = {"#e0e9d3", "117"}
            p.bg_visual_blue = {"#d9e1cc", "117"}
            p.bg_visual_yellow = {"#f9eabf", "226"}
            p.bg_current_word = {"#f3eac7", "229"}
        end
    elseif gruvbox_bg == "medium" then
        if is_dark then
            p.bg0 = {"#282828", "235"}
            p.bg1 = {"#32302f", "236"}
            p.bg2 = {"#32302f", "236"}
            p.bg3 = {"#45403d", "237"}
            p.bg4 = {"#45403d", "237"}
            p.bg5 = {"#5a524c", "239"}
            p.bg_statusline1 = {"#32302f", "236"}
            p.bg_statusline2 = {"#3a3735", "236"}
            p.bg_statusline3 = {"#504945", "240"}
            p.bg_diff_green = {"#34381b", "22"}
            p.bg_visual_green = {"#3b4439", "22"}
            p.bg_diff_red = {"#402120", "52"}
            p.bg_visual_red = {"#4c3432", "52"}
            p.bg_diff_blue = {"#0e363e", "17"}
            p.bg_visual_blue = {"#374141", "17"}
            p.bg_visual_yellow = {"#4f422e", "94"}
            p.bg_current_word = {"#3c3836", "237"}
        else
            p.bg0 = {"#fbf1c7", "229"}
            p.bg1 = {"#f4e8be", "228"}
            p.bg2 = {"#f2e5bc", "228"}
            p.bg3 = {"#eee0b7", "223"}
            p.bg4 = {"#e5d5ad", "223"}
            p.bg5 = {"#ddccab", "250"}
            p.bg_statusline1 = {"#f2e5bc", "223"}
            p.bg_statusline2 = {"#f2e5bc", "223"}
            p.bg_statusline3 = {"#e5d5ad", "250"}
            p.bg_diff_green = {"#e6eabc", "194"}
            p.bg_visual_green = {"#dee2b6", "194"}
            p.bg_diff_red = {"#f9e0bb", "217"}
            p.bg_visual_red = {"#f1d9b5", "217"}
            p.bg_diff_blue = {"#e2e6c7", "117"}
            p.bg_visual_blue = {"#dadec0", "117"}
            p.bg_visual_yellow = {"#fae7b3", "226"}
            p.bg_current_word = {"#f2e5bc", "228"}
        end
    elseif gruvbox_bg == "soft" then
        if is_dark then
            p.bg0 = {"#32302f", "236"}
            p.bg1 = {"#3c3836", "237"}
            p.bg2 = {"#3c3836", "237"}
            p.bg3 = {"#504945", "239"}
            p.bg4 = {"#504945", "239"}
            p.bg5 = {"#665c54", "241"}
            p.bg_statusline1 = {"#3c3836", "237"}
            p.bg_statusline2 = {"#46413e", "237"}
            p.bg_statusline3 = {"#5b534d", "241"}
            p.bg_diff_green = {"#3d4220", "22"}
            p.bg_visual_green = {"#424a3e", "22"}
            p.bg_diff_red = {"#472322", "52"}
            p.bg_visual_red = {"#543937", "52"}
            p.bg_diff_blue = {"#0f3a42", "17"}
            p.bg_visual_blue = {"#404946", "17"}
            p.bg_visual_yellow = {"#574833", "94"}
            p.bg_current_word = {"#45403d", "238"}
        else
            p.bg0 = {"#f2e5bc", "228"}
            p.bg1 = {"#eddeb5", "223"}
            p.bg2 = {"#ebdbb2", "228"}
            p.bg3 = {"#e6d5ae", "223"}
            p.bg4 = {"#dac9a5", "250"}
            p.bg5 = {"#d5c4a1", "250"}
            p.bg_statusline1 = {"#ebdbb2", "223"}
            p.bg_statusline2 = {"#ebdbb2", "223"}
            p.bg_statusline3 = {"#dac9a5", "250"}
            p.bg_diff_green = {"#dfe1b4", "194"}
            p.bg_visual_green = {"#d7d9ae", "194"}
            p.bg_diff_red = {"#f7d9b9", "217"}
            p.bg_visual_red = {"#efd2b3", "217"}
            p.bg_diff_blue = {"#dbddbf", "117"}
            p.bg_visual_blue = {"#d3d5b8", "117"}
            p.bg_visual_yellow = {"#f3deaa", "226"}
            p.bg_current_word = {"#ebdbb2", "227"}
        end
    end
end

local function palette_color(gruvbox_palette, p)
    if gruvbox_palette == "material" then
        if is_dark then
            p.fg0 = {"#d4be98", "223"}
            p.fg1 = {"#ddc7a1", "223"}
            p.red = {"#ea6962", "167"}
            p.orange = {"#e78a4e", "208"}
            p.yellow = {"#d8a657", "214"}
            p.green = {"#a9b665", "142"}
            p.aqua = {"#89b482", "108"}
            p.blue = {"#7daea3", "109"}
            p.purple = {"#d3869b", "175"}
            p.bg_red = {"#ea6962", "167"}
            p.bg_green = {"#a9b665", "142"}
            p.bg_yellow = {"#d8a657", "214"}
        else
            p.fg0 = {"#654735", "237"}
            p.fg1 = {"#4f3829", "237"}
            p.red = {"#c14a4a", "88"}
            p.orange = {"#c35e0a", "130"}
            p.yellow = {"#b47109", "136"}
            p.green = {"#6c782e", "100"}
            p.aqua = {"#4c7a5d", "165"}
            p.blue = {"#45707a", "24"}
            p.purple = {"#945e80", "96"}
            p.bg_red = {"#ae5858", "88"}
            p.bg_green = {"#6f8352", "100"}
            p.bg_yellow = {"#a96b2c", "130"}
        end
    elseif gruvbox_palette == "mix" then
        if is_dark then
            p.fg0 = {"#e2cca9", "223"}
            p.fg1 = {"#e2cca9", "223"}
            p.red = {"#f2594b", "167"}
            p.orange = {"#f28534", "208"}
            p.yellow = {"#e9b143", "214"}
            p.green = {"#b0b846", "142"}
            p.aqua = {"#8bba7f", "108"}
            p.blue = {"#80aa9e", "109"}
            p.purple = {"#d3869b", "175"}
            p.bg_red = {"#db4740", "167"}
            p.bg_green = {"#b0b846", "142"}
            p.bg_yellow = {"#e9b143", "214"}
        else
            p.fg0 = {"#514036", "237"}
            p.fg1 = {"#514036", "237"}
            p.red = {"#af2528", "88"}
            p.orange = {"#b94c07", "130"}
            p.yellow = {"#b4730e", "136"}
            p.green = {"#72761e", "100"}
            p.aqua = {"#477a5b", "165"}
            p.blue = {"#266b79", "24"}
            p.purple = {"#924f79", "96"}
            p.bg_red = {"#ae5858", "88"}
            p.bg_green = {"#6f8352", "100"}
            p.bg_yellow = {"#a96b2c", "130"}
        end
    elseif gruvbox_palette == "original" then
        if is_dark then
            p.fg0 = {"#ebdbb2", "223"}
            p.fg1 = {"#ebdbb2", "223"}
            p.red = {"#fb4934", "167"}
            p.orange = {"#fe8019", "208"}
            p.yellow = {"#fabd2f", "214"}
            p.green = {"#b8bb26", "142"}
            p.aqua = {"#8ec07c", "108"}
            p.blue = {"#83a598", "109"}
            p.purple = {"#d3869b", "175"}
            p.bg_red = {"#cc241d", "124"}
            p.bg_green = {"#b8bb26", "106"}
            p.bg_yellow = {"#fabd2f", "172"}
        else
            p.fg0 = {"#3c3836", "237"}
            p.fg1 = {"#3c3836", "237"}
            p.red = {"#9d0006", "88"}
            p.orange = {"#af3a03", "130"}
            p.yellow = {"#b57614", "136"}
            p.green = {"#79740e", "100"}
            p.aqua = {"#427b58", "165"}
            p.blue = {"#076678", "24"}
            p.purple = {"#8f3f71", "96"}
            p.bg_red = {"#ae5858", "88"}
            p.bg_green = {"#6f8352", "100"}
            p.bg_yellow = {"#a96b2c", "130"}
        end
    end
end

local function palette_grey(p)
    if is_dark then
        p.grey0 = {"#7c6f64", "243"}
        p.grey1 = {"#928374", "245"}
        p.grey2 = {"#a89984", "246"}
    else
        p.grey0 = {"#a89984", "246"}
        p.grey1 = {"#928374", "245"}
        p.grey2 = {"#7c6f64", "243"}
    end
end

function palette.get_palette(gruvbox_bg, gruvbox_palette)
    local p = {}

    palette_base(gruvbox_bg, p)
    palette_color(gruvbox_palette, p)
    palette_grey(p)

    -- local colors = {}
    --
    -- for key, value in pairs(p1) do
    --     colors[key] = rgb_color(value[1])
    -- end
    --
    -- for key, value in pairs(p2) do
    --     colors[key] = rgb_color(value[1])
    -- end
    --
    -- for key, value in pairs(p3) do
    --     colors[key] = rgb_color(value[1])
    -- end

    return p
end

palette.is_dark = is_dark

return palette
