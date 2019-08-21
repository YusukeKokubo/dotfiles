function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

balias g git
balias v vim

set -x GOPATH ~/gohome
set -x GCLOUD /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
set -x GAE /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/platform/google_appengine
set -x GHQ_ROOT ~/src

set PATH $GCLOUD/bin $PATH
set PATH $GAE $PATH

