Import-Module oh-my-posh
oh-my-posh prompt init pwsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/v$(oh-my-posh --version)/themes/mt.omp.json | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function pipInstall {
  param (
    [string[]] $packages
      )
  # if you want to install more packages at once, you should input `pipInstall pandas, numpy` for example
  pip install -i https://pypi.tuna.tsinghua.edu.cn/simple $packages
}

Set-Alias -Name lg -Value lazygit

function l {
  exa -lag --icons
}

chcp 936
