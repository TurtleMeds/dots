# env.nu
#
# Installed by:
# version = "0.104.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# def gpg_cache [] {
#   gpg-connect-agent /bye o+e> /dev/null
#   ~/.local/bin/op item get qz6ij6klkjaxch3vwoilfsqzs4 --reveal --fields password | /usr/lib/gnupg/gpg-preset-passphrase --preset E6EC1627215E8439FA43EB989C5793F69A4D9A79
# }
# job spawn { gpg_cache }

use std/util "path add"
$env.IN_TTY = false

if (uwsm check may-start | complete | get exit_code) == 0 {
  $env.IN_TTY = true
  uwsm start default
}

zoxide init nushell | save -f ~/.zoxide.nu

$env.EDITOR = "hx"
$env.GPG_TTY = ^tty

path add ~/.local/bin

if $env.ZELLIJ? == '0' {
  $env.IS_ZELLIJ = true
} else {
  $env.IS_ZELLIJ = false
  if $env.IN_TTY == false and $env.VSCODE_PORTABLE? == null {
    zellij
  }
}
