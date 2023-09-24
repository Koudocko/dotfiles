if status is-interactive
  if test -z "$DISPLAY"
    if test $XDG_VTNR -eq 1
      set -x MOZ_ENABLE_WAYLAND 1
      exec Hyprland
    else if test $XDG_VTNR -eq 2
      exec startx
    end
  end

  xmodmap -e "pointer = 1 2 3" > /dev/null 2>&1

  function fish_prompt 
      printf '[%s] > %s' (prompt_pwd -d 3) (set_color normal)
  end

  function n
      set -q NNNLVL; or set NNNLVL 0

      if test $NNNLVL -ge 1
          echo "nnn is already running"
          return
      end

      set -x NNN_TMPFILE "$XDG_CONFIG_HOME/$HOME/.config/nnn/.lastd"

      nnn -Read $argv

      if test -f $NNN_TMPFILE
          source $NNN_TMPFILE
          rm -f $NNN_TMPFILE > /dev/null
      end
  end

  function vidtrim
      if test "$argv[3]" = "-"
          ffmpeg -i "$argv[1]" -to "$argv[4]" -c:v copy -c:a copy "$argv[2]"
      else if test "$argv[4]" = "-"
          ffmpeg -i "$argv[1]" -ss "$argv[3]" -c:v copy -c:a copy "$argv[2]"
      else
          ffmpeg -i "$argv[1]" -ss "$argv[3]" -to "$argv[4]" -c:v copy -c:a copy "$argv[2]"
      end
  end

  set -U fish_greeting
  set -x PATH "$HOME/.cargo/bin" $PATH
  set -x DOTDIR ~/Documents/dotfiles
  set -x FZF_DEFAULT_COMMAND "find"
  set -x EDITOR nvim
  set -x NNN_BMS 'b:bookmarks;p:~/Pictures;d:~/Downloads;c:~/.config;D:~/Documents;v:~/Videos'
  set -x NNN_PLUG 'f:fzcd;o:fzopen;p:preview-tui;i:imgview'
  set -x NNN_FCOLORS '696969696969696969696969'
  set -x NNN_COLORS '#6969696969'

  alias cl 'clear'
  alias neo 'neofetch'
  alias uwu='uwufetch'
  alias syspo 'systemctl poweroff'
  alias sysrb 'systemctl reboot'
  alias nnn 'nnn -Read'
  alias vidsave 'yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'

  bind \cs 'tfind'
  bind \cy 'pfind'
end
