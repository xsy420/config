# config

This is my personal configs.

In the file .ideavimrc, the which-key part is copy from
[LintaoAmons/.ideavimrc](https://gist.github.com/LintaoAmons/18a8e3d5d45a22280ca54f1c69f43717)

## Install exa on Windows

- clone the repo from
[win-support](https://github.com/skyline75489/exa/tree/chesterliu/dev/win-support)
or
[win-support](https://github.com/tigercat2000/exa/tree/win-support)

- install rust with `scoop` or `chocolatey` or manually

```
scoop install rust
scoop install rustup
```

or

```
choco install rust
```

- build `exa` from source

```
cargo build --release
```

- set exa into system path

