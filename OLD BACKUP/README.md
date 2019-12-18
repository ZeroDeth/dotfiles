# tmux

# zsh

# vim

## Navigation Fundamentals
1. Line navigation
  - k – navigate upwards
  - j – navigate downwards
  - l – navigate right side
  - h – navigate left side

  - 0 – go to the starting of the current line.
  - ^ – go to the first non blank character of the line.
  - $ – go to the end of the current line.
  - g_ – go to the last non blank character of the line.
2. Screen navigation
  - H – Go to the first line of current screen.
  - M – Go to the middle line of current screen.
  - L – Go to the last line of current screen.
  - ctrl+f – Jump forward one full screen.
  - ctrl+b – Jump backwards one full screen
  - ctrl+d – Jump forward (down) a half screen
  - ctrl+u – Jump back (up) one half screen
3. Word navigation
  - N% – Go to the Nth percentage line of the file.
  - NG – Go to the Nth line of the file.
  - G – Go to the end of the file.
  - `” – Go to the position where you were in NORMAL MODE while last closing the file.
  - `^ – Go to the position where you were in INSERT MODE while last closing the file.
  - g – Go to the beginning of the file.
4. Special navigation
  - e – go to the end of the current word.
  - E – go to the end of the current WORD.
  - b – go to the previous (before) word.
  - B – go to the previous (before) WORD.
  - w – go to the next word.
  - W – go to the next WORD.
5. Paragraph navigation
  - { – Go to the beginning of the current paragraph. By pressing { again and again move to the previous paragraph beginnings.
  - } – Go to the end of the current paragraph. By pressing  } again and again move to the next paragraph end, and again.
6. Search navigation
  - /i – Search for a pattern which will you take you to the next occurrence of it.
  - ?i – Search for a pattern which will you take you to the previous occurrence of it.
  - * – Go to the next occurrence of the current word under the cursor.
  - #– Go to the previous occurrence of the current word under the cursor.
7. Code navigation
  - % – Go to the matching braces, or parenthesis inside code.
8. Navigation from command line
  - Vim +N filename: Go to the Nth line of the file after opening it.

### Disabling auto indent temporarily to paste
```
:set paste
:set nopaste
```
or
Avoid having to turn paste on and off, just put the text. Rather than going into insert mode and pasting, in command mode type
`"+p`

###
Type

:h cmdline-editing

```
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
```

```
ctrl+left arrow: move back a word
ctrl+right arrow - move forward a word
ctrl+b - back to the beginning of the line
ctrl+e - go to the end of the line
ctrl+w - remove one word before the cursor
ctrl+u - remove line
ctrl+f - if you need more editing power use ctrl+f and you will edit your command in normal mode. For example, if you want to move 5 characters to the left, use ctrl+f and then  5h.
```

# bash

# issues

## Macvim troubles with Lua?

```
brew uninstall macvim
brew remove macvim
brew cleanup
brew install macvim --custom-icons --with-override-system-vim --with-lua --with-luajit
```

## Terminal Vim troubles with Lua?

Installing terminal vim (with lua) with an RVM managed Ruby can cause the neocomplete plugin to segfault. Try uninstalling vim, then installing with system ruby:

```
brew uninstall vim
rvm system do brew install vim --with-lua
```

# Resources
- [A generator which provides a simple method of generating a .vimrc configuration for vim](http://vim-bootstrap.com/)
- [VIM All the right moves](http://vim.wikia.com/wiki/All_the_right_moves)
