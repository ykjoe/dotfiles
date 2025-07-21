# dotfiles

## 概述
搞个仓库放一下自己的dotfile，到时候重装系统可以直接下载，懒得重新配

## 版本
| 软件 | 版本 | 功能 | 配置文件 |
| ---- | ---- | ---- | -------- |
| bash | 5.1.16 | 终端 | `.bashrc` `.bash_logout` `.profile` |
| zsh | 5.8.1 | 终端 | `.zshrc` `.p10k.zsh` |
| tmux | 3.2a | 窗口 | `.tmux.conf` |
| vim | 8.2 | 编辑器 | `.vimrc` |
| neovim | 0.11.3 | 编辑器 | `.config/nvim/` |

## 安装
1. 安装相关依赖
```bash
sudo apt install ripgrep
```
2. 安装相关软件
```bash
sudo apt install zsh tmux vim neovim
```
3. 下载zsh外观仓库
```bash
git clone https://github.com/romkatv/powerlevel10k.git
```
4. 克隆本仓库
```bash
git clone https://github.com/ykjoe/dotfiles.git
```
5. 应用配置文件
```bash
bash ./apply_all.sh
```
**重要：**不能删除本仓库，应用配置文件是生成软链接！建议将其放在~/下

