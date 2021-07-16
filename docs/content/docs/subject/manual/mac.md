---
title: "Mac Manual Setup"
weight: 2
---

# Preface

Here list so many steps because I alway prefer clean reinstall my Mac and avoid use apple time machine. It is a painful process, but clean environment makes me feel less anxious.

# Pre-processing

## Erase Mac before reinstall it

- Backup .zsh_history
- Cancel AppleMusic 授權 (max limit 10 devices, 5 desktops)
- logout iMessage
- logout iCloud (system preference > iCloud)
- logout App Store
- Reboot and press key "option"
  - Erase disk
  - Install OSX from USB

## Setup after reinstall

0. 辨識鍵盤 (系統主動, 外接鍵盤)
1. 設定鍵盤
    - Option 與 Command Key 互換 (外接鍵盤))
    - 鍵盤 > 按鍵重複 `快`, 重複暫延 `短`
    - 文字 > disable `自動大寫` and `加入全形句號`
    - 快速鍵
        - 指揮中心 > 顯示通知中心 `Cmd + Shit + >`
        - 輸入方式 > 選擇上一個 `Cmd + Space`, disable Next
        - 停用 Spotlight 的快速鍵 (與 Alfred 習慣的快速鍵衝突)
    - 輸入方式 > disable 使用大寫鎖定切換 ABC 與目前輸入方式
    - `defaults write -g ApplePressAndHoldEnabled -bool false`
        > 關閉 key 按壓連續輸入被限制的設定, need relogin
    - 停用 Text 連續兩個 space 被替換成 dot (Add period with double-space) 
        > not exist anymore?
    - 全面鍵盤操控 (鍵盤) (not exist anymore?)
2. 觸控式軌跡板
    - 點按
       - [x] 點一下來選按
       - [ ] 靜音點按 (? 用途不明)
    - 更多手勢
       - [x] App Expose
3. 輔助使用中 > 指標控制 > 觸控式軌跡板選項 > `啟用拖移 | 帶拖移鎖定`
4. 使用者與群組 > 設定帳戶頭像
    > 將圖片直接拖曳到原始頭像上即可覆蓋, (Option) 可以一併同時把登入畫面改成直接輸入密碼, 不用等待選取使用者
5. Internet 帳號
    - iCloud
        - [x] iCloud雲疊
        - [ ] 照片
        - [ ] 郵件
        - [x] 聯絡人
        - [ ] 行事曆
        - [x] 提醒事項
        - [x] Safari
        - [x] 備忘錄
        - [ ] Siri
        - [x] 鑰匙圈
        - [x] 尋找我的Mac
        - [x] 股市
        - [ ] 家庭
    - Google (option, 工作用的電腦有加入公司行事曆)
6. Finder Preference
    - 一般
        - 桌面顯示 disable 外接硬碟, CD、DVD and iPod
        - 開啟新的 finder 視窗在 `下載項目`
    - 側邊欄
        - disable `最近項目`, `硬碟`, `最近使用過的標記`
        - enable $HOME
    - 進階
        - enable 顯示所有副檔名
        - disable 改變副檔名前顯示警告
7. Docker 與選單列
    - Dock enable `放大` and `自動隱藏及顯示Dock`, disable `顯示最近使用過的應用程式` 
    - 藍芽 在選單列中顯示
    - 聲音 在選單列中顯示 `永遠`
    - 時鐘 disable `顯示星期`, `顯示日期`, `顯示上午/下午` (只要勾選數位)
    - Spotlight disable `在選單中顯示`
8. Misc
    - 隱私 > 進入睡眠立即鎖定
    - 一般
        - enable `關閉文件時詢問保留`
        - disable `結束 App 時關閉視窗`
        - 最近使用過的項目 `無`
    - 聲音 > 音效 > 調整提示音音量至最小
9. 從 iMessage 中打開 sync from iCloud 的選項
10. reverse `Erase Mac` action

## Post-processing

- Copy or merge `.zsh_history` from old computer
- Point alfred preference to Dropbox and enable powerpack
- Install Smooze (mouse only)
- Install fonts if iterm2 font not display normal with p10k
```bash
brew tap homebrew/cask-fonts
brew install install font-hack-nerd-font
```
- If iterm2 has tab style setting (Because Catalina preference not match with Big Sur)
  > https://felixjung.io/blog/posts/pretty-iterm2-with-a-modern-titlebar
- Install sublime package control
  > `cmd+shift+p` type `:Install Package Control` first and
  > press enter and wait all plugins all installed

## Exist issues

- Overwrite Zotero with darktheme (should be auto)
- brave not sync yet

---

# Options

## Enable third-party app
```bash
sudo spctl --master-disable                      // 開啟 app 安裝第三方的選項
sudo xattr -r -d com.apple.quarantine `app path` // 用拖拉至 terminal 即可, 移除 App 附加屬性
xattr -cr xxx.app                                // 如果上面方法失效的話可用此移除 binary 的全部附加屬性
```

## Enable aptX codec
```bash
sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true // Enable Aptx
```

## Homebrew temp folder
> Manual clean temp folder
- `$HOME/Library/Caches/Homebrew/`
- `$HOME/Library/Caches/Homebrew/Cask`


## Homebrew cask 實際安裝路徑
> Manual remove app if it's not cleaned up
- `/usr/local/Caskroom/`

## Update homebrew installed tools
```bash
brew cu --all
brew cu -facy
brew upgrade
```

## 總是顯示 localhost 在 zsh 上
comment `~/.p10k.zsh` below line for always show context prompt (Option)
```
# typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
```

## pmset.config
save mac power

## xcode theme
https://github.com/hdoria/xcode-themes
> 目前已經匯入完成, mackup 應該要會自動備份不用再重新安裝

## Unknown section
`CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" \                                                                                   ~
LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib" \
PYTHON_CONFIGURE_OPTS=--enable-unicode=ucs2 \
pyenv install -v 3.8.0
