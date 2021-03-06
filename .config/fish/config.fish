function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository

  # to install plugin functions
  # fisher install oh-my-fish/plugin-peco
  # fisher install yoshiori/fish-peco_select_ghq_repository
end

set -x GOPATH ~/gohome
set -x GCLOUD /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
set -x GAE /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/platform/google_appengine
set -x GHQ_ROOT ~/src

set PATH $GCLOUD/bin $PATH
set PATH $GAE $PATH

set PATH /Applications/Visual\ Studio\ Code\.app/Contents/Resources/app/bin $PATH
set PATH /opt/homebrew/bin/brew $PATH
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths

# Deno
set DENO_INSTALL "/Users/yusukekokubo/.deno"
set PATH $DENO_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yusukekokubo/google-cloud-sdk/path.fish.inc' ]; . '/Users/yusukekokubo/google-cloud-sdk/path.fish.inc'; end

# pyenv
source (pyenv init - | psub)

# Rust
set -gx PATH "$HOME/.cargo/bin" $PATH
