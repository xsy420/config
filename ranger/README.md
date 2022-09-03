# Ranger Config files

Besides the default configs by this command

```shell
ranger --copy-config=all
```

I add more configs below

* It will show hidden files

* It will preview images by ueberzug method

In Arch Linux, you can install it with this command

```shell
sudo pacman -S ueberzug
```

* It will preview video

In Arch Linux, you can start it with this command

```shell
sudo pacman -S ffmpegthumbnailer
```

* It will show numbers before files

* Show filetype icons

```shell
git clone https://github.com/cdump/ranger-devicons2 ~/.config/ranger/plugins/devicons2
```

Then Add/change default_linemode devicons2 in your ~/.config/ranger/rc.conf

