function j --description 'Open daily journal'
    cd ~/notes
    set today (date +%Y-%m-%d).md

    if test -f daily/$today
        nvim daily/$today
    else
        nvim -c 'lua require("lazy").load({ plugins = { "obsidian.nvim" } })' -c ObsidianToday $argv
    end

    set_color green
    echo "Always stay positive! :)"
end
