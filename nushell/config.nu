# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

alias c = clear
alias ff = bash -c "hyfetch -b fastfetch --args '--config examples/13'"
alias shutdown = systemctl poweroff
alias wifi = nmtui
alias v = ^hx
alias helix = ^hx
if not $env.IS_ZELLIJ {
    alias ssh = kitten ssh
}
alias paru = yay
alias inst = yay -S

# YAZI

def --env y [...args] {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != "" and $cwd != $env.PWD {
        cd $cwd
    }
    rm -fp $tmp
}

# ML4W

alias ml4w = com.ml4w.welcome
alias ml4w-settings = com.ml4w.dotfilessettings
alias ml4w-hyprland = com.ml4w.hyprland.settings
alias ml4w-options = ml4w-hyprland-setup -m options
alias ml4w-sidebar = ags toggle sidebar
alias ml4w-diagnosis = sh ~/.config/hypr/scripts/diagnosis.sh
alias ml4w-hyprland-diagnosis = sh ~/.config/hypr/scripts/diagnosis.sh
alias ml4w-qtile-diagnosis = sh ~/.config/ml4w/qtile/scripts/diagnosis.sh
alias ml4w-update = sh ~/.config/ml4w/update.sh
alias cleanup = sh ~/.config/ml4w/scripts/arch/cleanup.sh

# COMPLETION
let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | from tsv --flexible --noheaders --no-infer
    | rename value description
}

let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

# This completer will use carapace by default
let external_completer = {|spans|
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -o 0.expansion

    let spans = if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ' | take 1)
    } else {
        $spans
    }

    match $spans.0 {
        # carapace completions are incorrect for nu
        nu => $fish_completer
        # fish completes commits and branch names in a nicer way
        git => $fish_completer
        # carapace doesn't have completions for asdf
        asdf => $fish_completer
        # default to carapace
        _ => $carapace_completer
    } | do $in $spans
}

# ZOXIDE
source ~/.zoxide.nu

# STARSHIP
# mkdir ($nu.data-dir | path join "vendor/autoload")
# starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# CONFIG
$env.TRANSIENT_PROMPT_COMMAND = $"(ansi pi) (ansi reset)"

$env.config = {
    use_kitty_protocol: true
    table: {
        show_empty: false
        mode: "default"
    }
    buffer_editor: "hx"
    edit_mode: "vi"
    show_banner: false
    cursor_shape: {
        vi_insert: "line"
        vi_normal: "block"
    }
    rm: {
        always_trash: true
    }
    history: {
        isolation: false
    }
    completions: {
        algorithm: "fuzzy"
        external: {
            enable: true
            completer: $external_completer
        }
    }
}

source login.nu
