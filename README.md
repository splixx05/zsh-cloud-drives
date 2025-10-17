# Copy, manage and organize cloud files with yazi 🐧📦

This plugin automates the upload/download process of your favorite cloud service and also offers a mounting
function. This allows you to download data (backup), upload data (save it to the cloud), or mount your cloud
as a network folder. By default, it is installed via Oh-My-Zsh, but the scripts can also be installed
individually under /usr/bin or (recommended) /usr/local/bin.

> Note:
> This repository is currently not inactive. It is neither maintained nor further developed. Requests will not be processed. Ideas can be submitted, but a timely response should not be expected. Thank you for your understanding.

---

## 🔧 Features

**Actually supported**

- Google Drive
- Onedrive

**In progress**

- Dropbox
- iCloud
- Webdev

---

## 🚀 Installation & Usage

1. Clone or copy the script:

```bash
 git clone https://github.com/splixx05/zsh-cloud-drives.git "${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/zsh-cloud-drives"
```

2. Activate the plugin in your /.zshrc under "plugins" like so:

```bash
  plugins=(git ... zsh-cloud-drives ...)
```

3. Usage in terminal:

**For Google type this**

```bash
  $ :cp-gdrive
  $ :mnt-gdrive
  $ :up-gdrive
```

**For Onedrive type this**

```bash
  $ :cp-onedrive
  $ :mnt-onedrive
  $ :up-onedrive
```

4. Browse the mounted device with yazi – once you quit yazi, the device will be automatically unmounted.

## 📋 Requirements

- bash/zsh
- Oh-My-Zsh
- yazi
- gum
- rclone
- noto-fonts-emoji (or something similar for icons)

## 🛡️ Safety

- Mounts by default to your $HOME directory or a custom location of your choice
- Provides a quit function at any time
- You can choose what happens with your data (clone/upload)

## 📃 License

**MIT – feel free to fork, improve, and share!**

## ❌ Uninstallation

1. Remove the plugin folder:

   ```bash
   rm -rf ~/.oh-my-zsh/custom/plugins/zsh-cloud-drives
   ```

2. Remove zsh-cloud-drives from the plugins=(...) line in your ~/.zshrc.

3. Restart your terminal or run:

```bash
source ~/.zshrc
```

Optional: If you no longer need the additional software (gum, rclone, noto-fonts-emoji), you can uninstall
them using your package manager.
