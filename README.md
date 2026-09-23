# etng Homebrew Tap

通过 Homebrew 安装和更新 etng 的 macOS 工具。

```bash
brew tap etng/taps
```

## 先看这里：Homebrew 7 的信任机制

Homebrew 7 起，**非官方 tap 的 formula / cask 需要先被信任**才会被加载。

用完整名字安装时 Homebrew 会自动记下信任，多数情况下你不用管这一步：

```bash
brew install --cask etng/taps/autoz   # 自动信任，直接可用
```

但如果你想用短名字（`brew install --cask autoz`）、或者希望 `brew outdated` / `brew upgrade`
不报信任错误，就显式信任整个 tap：

```bash
brew trust --tap etng/taps
```

撤销信任：

```bash
brew untrust --tap etng/taps
```

查看当前已信任的条目：

```bash
brew trust --json v1
```

> 如果你看到这个报错：
> `Refusing to load cask etng/taps/autoz from untrusted tap etng/taps.`
> 按提示执行 `brew trust --cask etng/taps/autoz` 或 `brew trust --tap etng/taps` 即可。

## AutoZ

菜单栏上一个**永远是东八区**的时钟；开启同步后按出口 IP 自动写入系统时区，菜单栏时间随之变红提醒。

```bash
brew install --cask etng/taps/autoz
```

AutoZ 未做 Apple 公证（ad-hoc 签名）。cask 的 `postflight` 会在安装后自动去掉隔离标记
（等价于 `xattr -dr com.apple.quarantine /Applications/AutoZ.app`），不需要你手动处理。

用法、原理、卸载说明见 → [etng/autoz](https://github.com/etng/autoz)

## 仓库结构

```
Casks/     Cask —— 图形界面 App（.app 包）
Formula/   Formula —— 命令行工具
```

配方由**各项目自己的发布流程**在打 tag 时自动推送更新（例如 AutoZ 的
[release workflow](https://github.com/etng/autoz/blob/main/.github/workflows/release.yml)）。
生成的文件开头会写明来源，**不要手改**。
