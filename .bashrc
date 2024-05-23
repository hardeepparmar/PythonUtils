# To the extent possible under law, the author(s) have dedicated all
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
# base-files version 4.2-4
# ~/.bashrc: executed by bash(1) for interactive shells.
# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc
# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.
# User dependent .bashrc file
# https://man7.org/linux/man-pages/man1/bash.1.html#INVOCATION
# https://man7.org/linux/man-pages/man1/bash.1.html#OPTIONS
[[ -f ~/.before.sh ]] &&  source ~/.before.sh
# [[ $- != *i* ]] && { [[ -e /dev/pts/0 ]] && echo "$(date): BASH Invoked with OPTIONS: $-" > /dev/pts/0; true; } && BOOT_OPTIONS=0 || date
[[ $- != *i* ]] && BOOT_OPTIONS=0 || date
export BOOT_OPTIONS=${BOOT_OPTIONS:=255}
function initTermColors {
  local COLORS=$(tput colors 2> /dev/null)
  if [ $? = 0 ] && [ $COLORS -gt 8 ]; then
    # function blink {
      # local YELLOWIT="\e[1;3;5;43m";
      # for i in $(seq 1 1 100);
      # do
        # tput cup 0 0;
        # if [ $(expr $i % 2) -eq 1 ]; then
          # echo -ne "\r${YELLOWIT}### This is an example of blinking text ###${RESET_COL}";
        # else
          # echo -ne "\r${YELLOW_COL}### This is an example of blinking text ###${RESET_COL}";
        # fi;
        # sleep 1;
      # done
    # }
    # # Connector fifos directory
      # read TMPDIR < <(mktemp -d /dev/shm/conn_shell_XXXXXXX)
      # fd=3
    # # find next free fd
      # nextFd() { while [ -e /dev/fd/$fd ];do ((fd++)) ;done;printf -v $1 %d $fd;}
      # tputConnector() {
        # mkfifo $TMPDIR/tput
        # nextFd TPUTIN
        # eval "exec $TPUTIN> >(LANG=C exec stdbuf -o0 tput -S - >$TMPDIR/tput 2>&1)"
        # nextFd TPUTOUT
        # eval "exec $TPUTOUT<$TMPDIR/tput"
        # rm $TMPDIR/tput
        # rmdir $TMPDIR
      # }
      # myTput() { echo -e "$1\ncr" 1>&$TPUTIN && IFS= read -r -d $'\r' -u $TPUTOUT $2
      # }
      # tputConnector
      # myTput op op
      # myTput "setaf 7" grey
      # myTput "setaf 16" black
      # fore=("$black" "$grey")
      # for ((i=0; i<256; i++)) ;do
        # myTput "setab $i" bgr
        # printf "  %s%s  %3d  %s" "$bgr" "${fore[ i>231 && i<244||(i<17)&& (i%8<2)||
          # (i>16&&i<232)&&((i-16)%6*11+(i-16)/6%6*14+(i-16)/36*10)<58
          # ? 1 : 0 ]}" $i "$op"
        # (( ((i<16||i>231) && ((i+1)%8==0)) || ((i>16&&i<232)&& ((i-15)%6==0)) )) &&
          # printf "\n" ''
      # done
    export RED_COL=$(tput setaf 1)
    export GREEN_COL=$(tput setaf 2)
    export YELLOW_COL=$(tput setaf 3)
    export BLUE_COL=$(tput setaf 4)
    export MAGNETA_COL=$(tput setaf 5)
    export CYAN_COL=$(tput setaf 6)
    export WHITE_COL=$(tput setaf $[7+8]) # White of higher octave.
    export GREY_COL=$(tput setaf 8)
    export SAFFRON_COL=$(tput setaf 208)
    export BOLD=$(tput bold)
    export RESET_COL=$(tput sgr0)
    export RED_BG=$(tput setab 1)
    export GREEN_BG=$(tput setab 2)
    export YELLOW_BG=$(tput setab 3)
    export BLUE_BG=$(tput setab 4)
    export MAGNETA_BG=$(tput setab 5)
    export CYAN_BG=$(tput setab 6)
    export WHITE_BG=$(tput setab $[7+8]) # White of higher octave.
    export GREY_BG=$(tput setab 8)
    # https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
  fi
}
initTermColors
export VAULT_ADDR='https://vault.or1.adobe.net'
export VAULT_CAMP_PATH='secret/campaign/techops-secrets/mdp/provisioning/tenant/'
export MASTER_BRANCH="v6-master"
export ADOBE_DOMAIN='adobe.com'
export ADOBE_CORP_DOMAIN="corp.${ADOBE_DOMAIN}"
export HOSTED_CAMPAIGN_DOMAIN="campaign.${ADOBE_DOMAIN}"
export TEAM_SHARE_SERVER=indshare.${ADOBE_CORP_DOMAIN}
export TEAM_SHARE_LOCATION=${TEAM_SHARE_LOCATION:='\\'${TEAM_SHARE_SERVER}'\share\campaign_acc_india_mustang\dev\setup\'}
export TEAM_SHARE_CACHE=${TEAM_SHARE_CACHE:='\\'${TEAM_SHARE_SERVER}'\share\campaign_acc_india_mustang\dev\cache\'}
export USER_SHARE_LOCATION=${USER_SHARE_LOCATION:='\\'${TEAM_SHARE_SERVER}'\users\'$(printf '%c' $(whoami) | tr [a-z] [A-Z])'\'$(whoami)'\'}
# export TEAM_SHARE_LOCATION='z:\campaign_acc_india_mustang\dev\setup\'
# wps -Command "net use z: /DELETE; net use z: \\\\${TEAM_SHARE_SERVER}\\share  /USER:ADOBENET\\$(whoami) /PERSISTENT:YES"
# wps -Command "$cred = Get-Credential -Credential ADOBENET\\$(whoami); Get-PSDrive Z | Remove-PSDrive -Force; New-PSDrive -Name Z -PSProvider FileSystem -Root \"\\\\${TEAM_SHARE_SERVER}\share\" -Persist -Credential $cred"

# Shell Options
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell
shopt -s extglob # Reqd for sudo rm -rf /tmp/!(.|..|bkp) in openTerm function at around line 1160.
# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion
# History Options
# https://www.baeldung.com/linux/bash-using-history-efficiently
# https://www.gnu.org/software/bash/manual/html_node/Using-History-Interactively.html#Using-History-Interactively
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:pwd:cd:h:dv:c:o:2*'
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"
# export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '
# export HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT='%d-%m %H:%M '
export HISTSIZE=10000
export CAMP_LANG=${CAMP_LANG:="eng"}

# run 13 command with its first and last arguent swapped.
#!13:0 !13:$ !13
alias 2conf='cd $CAMP_AC_ROOT/nl/build/ncs/conf'
alias 2envsetup='cd $CAMP_AC_ROOT/../acc-dev/acc-dev-setup'
alias 2integro='cd $CAMP_AC_ROOT/../v6SOAPAPI/Adobe-Campaign/'
function colors {
  for i in $(seq 1 1 $(tput colors)); do echo "$(tput setaf $i)${TERM}-$i${RESET_COL}"; done
}

function _TS {
  if [ ! -z ${TIME_PROFILE_SCRIPT+x} ]; then
    local MARKER_BEGIN="__tBegin${1}"
    local MARKER_TLAST="__tTlast${1}"
    trap 'previous_command=$this_command; this_command=$BASH_COMMAND' DEBUG
    declare -g ${MARKER_BEGIN}=$(($(date +%s%N)/1000000))
    declare -g ${MARKER_TLAST}=${!MARKER_BEGIN}
  fi
}
function _TE {
  if [ ! -z ${TIME_PROFILE_SCRIPT+x} ]; then
    local MARKER_BEGIN="__tBegin${1}"
    local MARKER_TLAST="__tTlast${1}"
    local __tEnd=$(($(date +%s%N)/1000000))
    local title="$@"
    local padding=$(head -c $(expr 20 - ${#title}) < /dev/zero | tr '\0' ' ')
    if [[ -z $title ]]; then
      title="${previous_command}:"
    else
      title="${title}${padding}"
    fi
    local incrTime=$(expr ${__tEnd} - ${!MARKER_TLAST})
    echo "${YELLOW_COL}${BOLD}${title} took  $(expr ${__tEnd} - ${!MARKER_BEGIN}) ms :++: ${incrTime}${RESET_COL}" > /dev/tty
    declare -g ${MARKER_TLAST}=${__tEnd}
  fi
}
_TS bashrc_script
function _KEY_HAS_VALUE {
  local searchKey=$1
  [[ -z ${searchKey} ]] && return 2;
  shift
  for idx in $(seq 1 1 $#); do
    if [[ "X${1,,}" = "X${searchKey}" ]];  then
      echo $2
      return 0
    fi
    shift
  done
  return 1;
}
function _CONTAINS {
  local searchKey=$1
  [[ -z ${searchKey} ]] && false && return
  shift
  for i in "$@"; do
    if [[ "X${i,,}" = "X${searchKey}" ]];  then
      true
      return
    fi
  done
  false
}

function _MATCHES {
  local searchKey=$1
  [[ -z ${searchKey} ]] && false && return
  shift
  for i in "$@"; do
    if [[ "${i,,}" =~ ${searchKey} ]];  then
      true
      return
    fi
  done
  false
}
# sed -n -e '/b/,/d/!p' abcde => ae
# sed -n -e '/b/,/d/p' abcde => bcd
# sed -n -e '/b/,/d/{//!p}' abcde => c
# sed -n -e '/b/,/d/{//p}' abcde => bd
# sed -e '/b/,/d/!d' abcde => bcd
# sed -e '/b/,/d/d' abcde => ae
# sed -e '/b/,/d/{//!d}' abcde => abde
# sed -e '/b/,/d/{//d}' abcde => ace
# https://stackoverflow.com/questions/17908555/printing-with-sed-or-awk-a-line-following-a-matching-pattern
function load {
  local __FUNCNAME=$1 file=$2
  _CONTAINS -h "$@" || _CONTAINS -? "$@" || [[ $# -eq 0 ]] && { echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <function> [-h(elp)] [file to load function from (default ~/.bashrc)]"; complete  -o nosort -W "-h $(declare -F | awk '{print $3}' | grep -Ev '^_' | xargs)" ${FUNCNAME[0]}; return 1; }
  [[ -z $file ]] && file=~/.bashrc
  [[ ! -f $file ]] && return $(errno ENOENT | tee /dev/tty | awk '{print $2}')
  awk "/^[[:space:]]*function[[:space:]]+${__FUNCNAME}[\{[:space:]]*$/,/^}$/" $file > /tmp/loadedfunction.sh
  [[ -s /tmp/loadedfunction.sh ]] || return $(echo "$(errno ENOSYS) in $file" | tee /dev/tty | awk '{print $2}')
  source /tmp/loadedfunction.sh
}

# Count number of files in a directory , 0 if it is not a directory
function fCount {
  function __count { echo $#; }
  (shopt -s nullglob; __count $1/*)
}

function history2 {
  for arg do
    if [ "$arg" = "-c" ]; then
      rm -f ${HISTFILE}
      for i in "$( (set -o posix ; set) | grep ^HIST)"; do
        local cmd=$(echo $i | sed -r 's/\=.*$//g')
        unset $cmd
      done
    fi
    shift
    set -- "$@" "$arg"
  done
  history "$@"
}

# a is ARRAY: a=(one two three) _indexof three ${a[@]} will return 2.
# However if: a="one two three" _indexof three $a will return 2.
_indexof() {
        for ((;$#;)) ; do
                case "$1" in
                        --) shift ; break ;;
                        -*) printf "Usage: %s [--] VALUE ARRAY...\n" "$FUNCNAME" >&2 ; return 2 ;;
                        *) break ;;
                esac
                shift
        done
        local asize value=$1
        shift
        asize=$#
        ((asize)) || { printf "Usage: %s [--] VALUE ARRAY...\n" "$FUNCNAME" >&2 ; return 2 ;}
        while (($#)) ; do
                [[ "$1" != "${value}" ]] || break
                shift
        done
        (($#)) || return 1
        echo $((asize-$#))
}
function int2bool { [[ $1 =~ ^[0-9]*[1-9]+[0-9]*$ ]] && ((1)); }
# Find number of characters(first argument i.e $1) in second argument($2)
# e.g nchars P PIPE  ...returns 2.
# nchars : $PATH  ....returns total number of paths in PATH variable.
function nchars { local v c=$1; shift; local s="$([[ -p /dev/stdin ]] && cat - || echo "$@")"; v="${s//[^$c]}"; echo ${#v}; }
function joinArray {
  local IFS="${1}"
  shift
  echo "$*"
}
# *************************************************************
# This function redirect the pipe input to stderr.
#
# @param string
function STDERR {
  echo -n "${RED_COL}" 1>&2
  cat - 1>&2
  echo -n "${RESET_COL}" 1>&2
  return 1
}
function STDWARN {
  echo -n "${YELLOW_COL}" 1>&2
  cat - 1>&2
  echo -n "${RESET_COL}" 1>&2
  return 0
}
function STDINFO {
  echo -n "${GREEN_COL}" 1>&2
  cat - 1>&2
  echo -n "${RESET_COL}" 1>&2
  return 0
}
function trim {
    local var="$*"
    # remove trailing whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s' "$var"
}
function rep {
    local re='^[0-9]+$' str=$1 count=$2
    count=
    [[ ! $2 =~ $re ]] && return 1
    printf "%0.s${str}" $(seq 1 $count) && return
    export RARE_SQ1=${RARE_SQ1:=$(getUUID)}
    [[ $2 = 0 ]] && return
    [[ -z $2 || $2 = 1 ]] && echo -ne "${1}" && return
    [[ $2 -ge 2 ]] && eval echo \"${1}${RARE_SQ1}\"{$(head -c $[$2-1] /dev/zero |tr '\0' ',')} | sed -r "s,${RARE_SQ1}[[:space:]]?,,g"
}
# sed multi line relace.
# Usage: grep -rl '<h2' * | while read i; do sedml $i "s/<h2.*</h2>/No title here/g" $i.tmp; done;
# curl www.gmail.com > gmail.html
# sedml gmail.html 's,<BODY>.*</BODY>,NOBODYFOUND,g' out.html
function sedml {
  if [ "$#" -lt 2 ]
  then
  exit;
  fi
  # change the input file if no 3rd argument
  if [ -z "$3" ]
  then
      outputfile="$1"
  else
      outputfile="$3"
  fi
  sed -n '
  # if the first line copy the pattern to the hold buffer
  1h
  # if not the first line then append the pattern to the hold buffer
  1!H
  # if the last line then ...
  $ {
      # copy from the hold to the pattern buffer
      g
      # do the search and replace
      '"$2"'
      # print
      p
  }
  ' $1 > $1.tmp;
  mv -f $1.tmp $outputfile;
}
function flushInput {
    local attempts=16
    while read -r -t 0; do read -r; attempts=$[${attempts}-1]; [[ $attempts -eq 0 ]] && { [[ "$(sed 's/.*/\U&/' <<< X${EXPERT_MODE:0:1})" =~ X[Y1T] ]] && echo "Script execution currently in function ${FUNCNAME[1]}" || echo ""; } && break; done;
}
# function h2d {
  # echo "ibase=16; $@"|bc
# }
# function d2h {
  # echo "obase=16; $@"|bc
# }
function h2d {
# signed int32 range is      0 1 2 ... 9 10 11 2147483647 -2147483648 -2147483647 ... -1
# signed int32 range(in hex) 0 1 2 ... 9  A  B   7fffffff    80000000    80000001 ... FFFFFFFF
  local outAsUnSigned ignoreNonHexChars iRc
  [[ X${1:0:1} = X"-" || $# -eq 0 ]] && { [[ $1 =~ [hH/?] || $# -eq 0 ]] && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-h(help)i(ignore non hex chars in input)u(unsigned output)] <hexnum-1> [hexnum-2] ... Or PIPE-IN" && return 1; [[ $1 =~ [uU] ]] && outAsUnSigned=1; [[ $1 =~ [iI] ]] && ignoreNonHexChars=1; true; } && shift
  local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
  if [[ -n "$input" ]]; then
    for i in $input; do
      local num
      if [[ $i =~ .*[^0-9a-fA-F]+.* ]]; then
        num=$(echo $i | sed -r -e 's,^.*[xX],,' -e 's,[hH]$,,')
        if [[ $num =~ ^[0-9a-fA-F]+$ ]]; then
          iRc=0
        else
          iRc=1
          [[ -z ${ignoreNonHexChars} ]] || { num=${num%%.*}; num=$(echo ${num} | tr -c -d '0-9a-fA-F'); [[ -n $num ]] && iRc=0; }
        fi
      else
        iRc=0
        num=$i
      fi
      [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT${RESET_COL}: Ignoring Invalid hex ${i}"; continue; }
      local hexNum=${num}
      [[ ${#num} -gt 16 ]] && outAsUnSigned=1
      num=$(( 16#${num} ))
      if [[ -z ${outAsUnSigned} ]]; then
        [[ ${num} -gt 2147483647 && ${num} -le 4294967295 ]] && num=$(echo -n "-$[4294967296 - ${num}]")
      else
        [[ ${num} -lt 0 ]] && num=$(echo "obase=10; ibase=16; ${hexNum}" | bc -l)
      fi
      echo -n ${num}
    done
  fi
  return $iRc
}

function d2h {
  local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
  if [[ -n "$input" ]]; then
    for i in $input; do
      i=${i//,/} # remove any  commas.
      i=${i//+/} # remove any  + sign.
      i=${i%%.*} # remove any (.)decimal/fractional part or Mantissa.
      printf '%x ' $i
    done
  fi
}
function xt {
  export FMT=${FMT:="+%Y-%m-%d %H:%M:%S %:z"}
  _MATCHES '(-|/)h' "$@" || _MATCHES '^(-|/)\?' "$@" || [[ $# -eq 0 ]] && { echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <function> [-h(elp)] [from-time-zone(default ${YELLOW_COL}${TZ}${RESET_COL})] <to-timezone> [time (in format recognized by date command e.g ${YELLOW_COL}YYYY-MM-DD HH:MM:SS TZ${RESET_COL} if format is ${YELLOW_COL}${FMT}${RESET_COL})]"; echo "Modify env variable ${YELLOW_COL}FMT${RESET_COL} to choose a different output format."; complete  -W "$( (cd /usr/share/zoneinfo/posix/ && find -L . -type f) | sed 's,./,,' | xargs)" ${FUNCNAME[0]}; return 1; }

  function __adjustTZ {
    [[ -z $1 ]] && return
    local l_tz=$1
    [[ $l_tz =~ ^[0-9] ]] && l_tz="+${l_tz}"
    [[ $l_tz =~ ^[-+] ]] && l_tz="UTC${l_tz}"
    [[ $l_tz =~ [-+][0-9] ]] && l_tz=$(echo $l_tz | tr "+-" "-+") || {
      local l
      if [[ ${l_tz} =~ / ]]; then
        l=$((cd /usr/share/zoneinfo/posix/ && find -L . -type f) | sed 's,./,,' | grep -E "^${l_tz}$")
      else
        l=$((cd /usr/share/zoneinfo/posix/ && find -L . -type f) | sed 's,./,,' | grep "${l_tz}" | head -n 1)
      fi
      l_tz=$l
    }
    echo ${l_tz}
  }
  from=$(__adjustTZ $1)
  shift

  local to=$1
  [[ -z $to ]] && to=${from} && from='' || { shift; to=$(__adjustTZ $to); }

  local timeInfo="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
  [[ -z "$timeInfo" ]] && timeInfo="$(date)"
  if [[ -n "$timeInfo" ]]; then
    t_IFS=$IFS
    IFS=$'\n'
    for t in $timeInfo ; do
      if [[ -z $from ]]; then
        from=$(echo $t | awk -F":" '{print $NF;}' | sed -n -r 's,([^+-]+)([+-][^\s]*).*,\2,p') && from=$(__adjustTZ $from)
        [[ -z $from ]] && from=$(echo $t | awk -F":" '{print $NF;}' | sed -n -r 's,.*\s([A-Z]{3\,4})(\s.*|$),\1,p')
        local l_tz=${TZ}
        [[ -z ${l_tz} ]] && exec_command_exists timedatectl && l_tz=$(timedatectl show -p Timezone --value)
        if [[ ! -z $from ]] ; then
          from=$(__adjustTZ $from)
          [[ -z $from ]] && echo "${RED_COL}ALERT:${RESET_COL} Failed to deduce 'from' time zone." && from=${l_tz}
          from=$(__adjustTZ $from)
          echo "Fallback to timezone ${YELLOW_COL}${from}${RESET_COL} or else Pls specify time zone explicitly."
        else
          from=${l_tz}
        fi
      fi
      # echo "$(__adjustTZ $from) to $(__adjustTZ $to)"
      TZ=${to} date --date="TZ=\"${from}\" ${t}" "${FMT}"
    done
    IFS=${t_IFS}
  fi
  unset __adjustTZ
}

function lBound {
  # export TIME_PROFILE_SCRIPT=1
  # _TS ${FUNCNAME[0]}
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} <lower bound> [num-1] ... Or PIPE-IN" && return 1
  local arg1=$1
  [[ -z $arg1 ]]        && arg1=$(( 16#8000000000000000 )) # -9223372036854775808 INT64_MIN
  [[ ${arg1,} = x86 ]]  && arg1=-$(( 16#80000000 ))        # -2147483648          INT32_MIN
  [[ $arg1 =~ ^[-+]?[[:digit:]]*[\.]?[[:digit:]]+$ ]] || { echo "${FUNCNAME[0]} value $arg1 is NaN. Using 0 as default bound value." | STDERR; arg1=0; }
#  echo ${arg1}#${LINENO}
  local bVal=$arg1
  shift
  local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
  local t_IFS i=0 bcExprMaxBatchSize=100000
  local batchValuesArray=()  batchExprArray=()
  # _TE ${FUNCNAME[0]} $LINENO
  for n in ${input}; do
    [[ $n =~ ^[-+]?[[:digit:]]*[\.]?[[:digit:]]+$ ]] && \
    { batchExprArray[$i]="$n < ${bVal};"; batchValuesArray[$i]=$n; } \
    || { batchExprArray[$i]="0 == 1;" batchValuesArray[$i]='NaN'; }
    i=$[$i+1]
    if [[ $i -gt $bcExprMaxBatchSize ]]; then
      t_IFS=$IFS
      IFS=$'\n'
      i=0
      for r in $(echo "${batchExprArray[@]}" | bc -l); do
        [[ $r -eq 0 ]] && echo ${batchValuesArray[$i]} || echo $bVal
        i=$[$i+1]
      done
      i=0
      IFS=$t_IFS
      batchExprArray=()
      batchValuesArray=()
    fi
  done
  # _TE ${FUNCNAME[0]} $LINENO
  i=0
  t_IFS=$IFS
  IFS=$'\n'
  for r in $(echo "${batchExprArray[@]}" | bc -l); do
    [[ $r -eq 0 ]] && echo ${batchValuesArray[$i]} || echo $bVal
    i=$[$i+1]
  done
  IFS=$t_IFS
  _TE ${FUNCNAME[0]} $LINENO
  # unset TIME_PROFILE_SCRIPT
}

function uBound {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} <upper bound> [num-1] ... Or PIPE-IN" && return 1
  local arg1=$1
  [[ -z $arg1 ]]        && arg1=$(( 16#7FFFFFFFFFFFFFFF )) # 9223372036854775807 INT64_MAX
  [[ ${arg1,} = x86 ]]  && arg1=$(( 16#7FFFFFFF ))         # 2147483647          INT32_MAX
  [[ $arg1 =~ ^[-+]?[[:digit:]]*[\.]?[[:digit:]]+$ ]] || { echo "${FUNCNAME[0]} value $arg1 is NaN. Using 0 as default bound value." | STDERR; arg1=0; }
#  echo ${arg1}#${LINENO}
  local bVal=$arg1
  shift
  local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
  local t_IFS i=0 bcExprMaxBatchSize=100000
  local batchValuesArray=()  batchExprArray=()
  for n in ${input}; do
    [[ $n =~ ^[-+]?[[:digit:]]*[\.]?[[:digit:]]+$ ]] && { batchExprArray[$i]="$n > ${bVal};"; batchValuesArray[$i]=$n; } || { batchExprArray[$i]="0 == 1;" batchValuesArray[$i]='NaN'; }
    i=$[$i+1]
    if [[ $i -gt $bcExprMaxBatchSize ]]; then
      t_IFS=$IFS
      IFS=$'\n'
      i=0
      for r in $(echo "${batchExprArray[@]}" | bc -l); do
        [[ $r -eq 0 ]] && echo ${batchValuesArray[$i]} || echo $bVal
        i=$[$i+1]
      done
      IFS=$t_IFS
      i=0
      batchExprArray=()
      batchValuesArray=()
    fi
  done
  i=0
  t_IFS=$IFS
  IFS=$'\n'
  for r in $(echo "${batchExprArray[@]}" | bc -l); do
    [[ $r -eq 0 ]] && echo ${batchValuesArray[$i]} || echo $bVal
    i=$[$i+1]
  done
  IFS=$t_IFS
}

function bindInRange {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [lower-bound] [upper-bound] [num-1] ... Or PIPE-IN" && return 1
  local lB=$1
  local uB=$2
  uB=${uB:=${lB}}
  if [[ $lB =~ ^[-+]?[[:digit:]]*[\.]?[[:digit:]]+$ && $uB =~ ^[-+]?[[:digit:]]*[\.]?[[:digit:]]+$ ]]; then
    if (( $(echo "$lB > ${uB}" | bc -l) )); then
      local t=$lB
      lB=$uB
      uB=$t
    fi
  fi
  shift
  shift
  local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
  echo "${input}" | lBound ${lB} | uBound ${uB}
}
# generates a 1 byte XOR from input string(s).can be used to generate a unique 1 byte hash.
function XOR {
  local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
  if [[ -n "$input" ]]; then
    for s in $input; do
      local res=0 b
      for (( i=0; i<${#s}; i++ )); do
        b=$(ascii "${s:$i:1}" -i | awk '{print $2}')
        res=$(printf "$(( ${res} ^ ${b} ))")
      done
      echo $res
    done
  fi
}

# reverse_word_order
function rwo {
  local l_IFS=$IFS
  local delim=$' '
  if [[ X${1,,} = "X-d" ]] && [[ ! -z $2 ]]; then
    delim=$"$2"
  fi
  local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
  if [[ -n "$input" ]]; then
    IFS=$'\n'
    for line in $input; do
      IFS=$delim
      local result=""
      for word in $line; do
        result="$word$delim$result"
      done
      IFS=$'\n'
      echo ${result%${delim}}
    done
    IFS=$l_IFS
  fi
}
# function c2s1 {
  # SLEEP_GRANULARITY="$1"
  # local time_To_Sleep=0
  # local ts
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'Y' | sed -r 's/Y.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 365 \* 24 \* 60 \* 60 + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'W' | sed -r 's/W.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 7   \* 24 \* 60 \* 60 + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'D' | sed -r 's/D.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 24  \* 60 \* 60       + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'H' | sed -r 's/H.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 60  \* 60             + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'M' | sed -r 's/M.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 60                    + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'S' | sed -r 's/S.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0)                          + ${time_To_Sleep})
  # echo ${time_To_Sleep}
# }
# function c2s2 {
  # SLEEP_GRANULARITY="$1"
  # local time_To_Sleep=0
  # local ts
  # time_To_Sleep = $(echo $SLEEP_GRANULARITY | sed -r 's/Y/ \* 365 \* 24 \* 60 \* 60 \+ //' | sed -r 's/W/ + \* 7 \* 24 \* 60 \* 60 \+ //' | sed -r 's/D/ \* 24 \* 60 \* 60 \+ //' |
  # sed -r 's/H/ \* 60 \* 60 \+ //' | sed -r 's/M/ \* 60 \+ //'  | sed -r 's/S/ + \+ 0//')
  # time_To_Sleep=$(expr time_To_Sleep)
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'W' | sed -r 's/W.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 7   \* 24 \* 60 \* 60 + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'D' | sed -r 's/D.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 24  \* 60 \* 60       + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'H' | sed -r 's/H.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 60  \* 60             + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'M' | sed -r 's/M.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0) \* 60                    + ${time_To_Sleep})
  # time_To_Sleep=$(expr $(expr $(echo $SLEEP_GRANULARITY | grep 'S' | sed -r 's/S.*//g' | rev | sed -r 's/[^0-9]+.*//g' | rev) +  0)                          + ${time_To_Sleep})
  # echo ${time_To_Sleep}
# }
function readEx {
# Pressing Ctrl+C midway or allowing the timeout counter to run though to 0. In both cases this function returns an error code.
  local firstArg="$1"
  shift
  local secondArg="$1"
  shift
  local iRc=0
#
#  if [[ $SLEEP_GRANULARITY =~ ^[0-9]+[Y]?([0-9]|[1-4][0-9]|5[0-2])?[W]?([0-9]|[1-9][0-9]|[1-2][0-9][0-9]|3[0-5][0-9]|36[0-6]])?[D]?([0-9]|1[0-9]|2[0-4])?[H]?([0-9]|[1-5][0-9])?[M]?([0-9]|[1-5][0-9])?[S]?$ ]]; then
#    c2s1 $SLEEP_GRANULARITY
#    c2s2 $SLEEP_GRANULARITY
#  fi
  export SLEEP_GRANULARITY=${SLEEP_GRANULARITY:=0}
  time_To_Sleep=$(awk "BEGIN {print 10^$SLEEP_GRANULARITY}")
  if int2bool ${secondArg}; then
    local n=${secondArg}
    local indent=""
    local paused
    while [ $n -ge 0 ];
    do
      if [[ $n =~ ^9*$ ]]; then
        indent=${indent}" "
      fi
      echo -ne "\r${firstArg}${indent}${RED_COL}${n}${RESET_COL}""$@""\t${paused}"
      paused=$(trim ${paused})
      [[ -z ${paused} ]] && n=$(expr $n - 1)
      read -t ${time_To_Sleep} -d'' -s -n1
      iRc=$?
      if [ $iRc = 0 ]; then
        if [[ "$REPLY" == $'\x20' ]]; then
          # Is A SpaceBar
          [[ -z $(trim ${paused}) ]] && paused='Paused...' || paused='         '
        else
          echo "$REPLY"
          return 0
        fi
      fi
    done
  else
    local var=${@:$#:$#}
    if [[ -n $secondArg ]]; then
      read "${firstArg}" "${secondArg}" $@
    elif [[ -n $firstArg ]]; then
      read "${firstArg}"
    else
      read
    fi
    iRc=$?
    [[ -n $var ]] && echo "${!var}" > /dev/null
  fi
  return $iRc
}
function exec_command_exists {
  type -a $1 &> /dev/null
  local retVal=$?
  if [ $# -eq 0 ] || [ ${retVal} -ne 0 ]
  then
    false
  else
    true
  fi
}
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
function cd_func {
  local x2 the_new_dir adir index
  local -i cnt
  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi
  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME
  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi
  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)
  #
  # Trim down everything beyond 11th entry
  popd -n +11 2>/dev/null 1>/dev/null
  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 10; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done
  return 0
}
function currentBranch {
  local curBranch=$(git branch --show-current)
  if [ -z ${curBranch} ]; then
    git name-rev --name-only --exclude=tags/* @ | cut -d '/' -f3 | sed 's/~.*//'
  else
    echo ${curBranch}
  fi
}
function commitsBetween {
  if [ -z $1 ] || [ -z $2 ]; then
    echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} <branch-name-1> <branch-name-2> [folder to find commits into]"
    return 1
  fi
  local firstBranch=$1
  local secondBranch=$2
  if [ -z $3 ]; then
    git logline ${firstBranch} --not  ${secondBranch}
  else
    git logline ${firstBranch} --not  ${secondBranch} -- $3
  fi
}
function genretateOptimizedEnv {
  local OPT_BRANCH_NAME=acc-OptimizedEnv
  git checkout -f ${MASTER_BRANCH}
  git pull
  git pull
  git checkout -b ${OPT_BRANCH_NAME}
  local camp_env="$CAMP_AC_ROOT/nl/env.sh"
  local git_hist_Cmd="git -C $(native $(dirname ${camp_env}))"
  ${git_hist_Cmd} checkout -f -- env.sh
  ${git_hist_Cmd} show ${c}:./$(basename ${camp_env})
  for c in $(${git_hist_Cmd} log -n 10 --reverse --pretty=format:"%h" --no-patch -- ${camp_env}); do
     ${git_hist_Cmd} show ${c}:./$(basename ${camp_env}) > ${camp_env}_$c
     git format-patch -1 ${c} -- ${PWD}/env.sh
     # sed  -i -r 's,/nl/env\.sh,/nl/env_test\.sh,g' 0001-NEO-59235-last.patch
  done
}

function RHEAD {
  echo origin/$(currentBranch)
}
function xmlize {
    echo '<?xml version="1.0" encoding="UTF-8"?><CAMP_XML_ROOT>'
    if [ ! -t 0 ]; then
        echo "$(cat)" | grep -i -v "<?xml "
    fi
    echo "</CAMP_XML_ROOT>"
}

function updateXMLAttr_v0 {
  if [ $# -ne 4 ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <file-path> <XML-tag> <XML-tag-attribute> <XML-attribute-valueToset>"
    return 1
  fi
  sed -r -i "s/^(\s+<$2.+$3=\")[^\"]*(.*)/\1$4\2/g"  $1
}
function updateXMLAttr {
  export RARE_SQ1=${RARE_SQ1:=$(getUUID)}
  if [ $# -ne 4 ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <file-path> <XML-tag> <XML-tag-attribute> <XML-attribute-valueToset>"
    return 1
  fi
  if [ ! -f "$1" ]; then
    echo "${RED_COL}ALERT${RESET_COL}:  Cannot open/read ${1} "
    return 3
  fi
  local __EOL;
  (head $1 | grep -U $'\r' > /dev/null) && __EOL="\r"
  __EOL+="\n"
  cat $1 | sed -r ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g"  | sed -r "s/(<${2}[^[:alnum:]][^>]*${3}[^=]*=[^\"]*\")[^\"]*(.*)/\1${4}\2/g"  | sed "s/ ${RARE_SQ1} /${__EOL}/g" > $1.tmp
  cmp $1.tmp $1 > /dev/null
  if [ $? -eq 0 ]; then
    local value="$(getXMLAttrVal $2 $3 1 $1)"
    if [ "${value}" = "${4}" ]; then
      rm -f ${1}.tmp
      return 0;
    else
      echo "${YELLOW_COL}WARN:${RESET_COL} XML-tag(${2}) / XML-tag-attribute(${3}) not found.Trying to add XML-tag-attribute(${3}) for given XML-tag(${2}) to the $1."
      cat $1 | sed -r ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g"  | sed -r "s/(<${2})([/|>|[:space:]*])([^/>]*)/\1 ${3}=\"${4}\"\2\3/g"  | sed "s/ ${RARE_SQ1} /${__EOL}/g" > $1.tmp
      if [[ "$(${OPENSSL_BIN} dgst -md5 "${1}.tmp" | awk '{print $2}')" = "$(${OPENSSL_BIN} dgst -md5 "${1}"| awk '{print $2}')" ]]; then
        echo "${RED_COL}ALERT:${RESET_COL} XML-tag(${2}) not found in $1."
        rm -f ${1}.tmp
        return 2
      fi
    fi
  fi
  mv -f $1.tmp $1
  return 0
}
# function addXMLAttr {
  # export RARE_SQ1=${RARE_SQ1:=$(getUUID)}
  # if [ $# -ne 4 ]; then
    # echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <file-path> <XML-tag> <XML-tag-attribute> <XML-attribute-valueToset>"
    # return 1
  # fi
  #  local __EOL;
  # (head $1 | grep -U $'\r' > /dev/null) && __EOL="\r"
  # __EOL="\n"
  # cat $1 | sed -r ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g"  | sed -r "s/(<${2}[^>]*)>/\1 ${3}=\"${4}\">/g"  | sed "s/ ${RARE_SQ1} /${__EOL}/g" > $1.tmp
  # mv -f $1.tmp $1
  # return 0
# }
function getXMLAttrVal_last {
  export RARE_SQ1=${RARE_SQ1:=$(getUUID)}
  export RARE_SQ2=${RARE_SQ2:=$(getUUID)}
  local TAG=$1
  local ATTR=$2
  local INPUT xpathIsExpr
  isValidXMLName $TAG || { echo "$TAG does not appear to be a valid XML Name." | STDERR; ! useXMLLint && return 1; xpathIsExpr=1; }

  if [ $# -eq 2 ]; then
    if [ ! -t 0 ]; then
      INPUT=$(cat)
    fi
    if useXMLLint; then
      local opipefailVal='+' iRc
      [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
      set -o pipefail
      if [[ -z $xpathIsExpr ]]; then
        echo "${INPUT}" | xmllint --xpath "(//*/*[name()=\"${T}\"]/@${ATTR})[last()]" - | cut -d\" -f2
        iRc=$?
      else
        echo "${INPUT}" | xmllint --xpath "(//*/${TAG}/@${ATTR})[last()]" - | cut -d\" -f2
        iRc=$?
      fi
      set ${opipefailVal}o pipefail
      return $iRc
    fi
    echo "$INPUT" | sed -r ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g"  | sed -r "s/.*(<$TAG [^>]*>).*/\1/g" | sed "s/${RARE_SQ1}//g" | sed -r "s/.*<${TAG}[^>]*${ATTR}\s*=\s*\"([^\"]*)\".*/\1/g"
  elif [ $# -eq 3 ]; then
    INPUT=$3
    if useXMLLint; then
      local opipefailVal='+' iRc
      [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
      set -o pipefail
      if [[ -z $xpathIsExpr ]]; then
        cat "${INPUT}" | xmllint --xpath "(//*/*[name()=\"${T}\"]/@${ATTR})[last()]" - | cut -d\" -f2
        iRc=$?
      else
        cat "${INPUT}" | xmllint --xpath "(//*/${TAG}/@${ATTR})[last()]" - | cut -d\" -f2
        iRc=$?
      fi
      set ${opipefailVal}o pipefail
      return $iRc
    fi
    local n=$(cat $INPUT | grep -c "<$TAG ")
    local data=$(cat $INPUT | sed ':a;N;$!ba;s/\r\n/ $RARE_SQ1 /g')
#    for i in $(seq $n -1 2)
#    do
#      data=$(echo "$data" | sed -r "s/<$TAG [^>]*>//1")
#    done
    echo "$data" | sed -r "s/.*(<$TAG [^>]*>).*/\1/g" | sed "s/$RARE_SQ1//g" | sed -r "s/.*<${TAG}[^>]*${ATTR}\s*=\s*\"([^\"]*)\".*/\1/g"
  else
    echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <file-path> <XML-tag> <XML-tag-attribute>"
    return 1
  fi
  return 0
}

function getXMLTagVal {
  local TAG=$1
  shift
  local INPUT xpathIsExpr
  isValidXMLName $TAG || { echo "$TAG does not appear to be a valid XML Name." | STDERR; ! useXMLLint && return 1; xpathIsExpr=1; }
  local NthOccurrence=$1
  NthOccurrence=${NthOccurrence:=1}
  shift
  if [ ! -t 0 ]; then
    INPUT=$(cat)
  else
    INPUT="$(cat "$@")"
  fi
  if useXMLLint; then
    # Use can use trim to get rid of leading and trailing spaces/newlines.
    local opipefailVal='+' iRc
    [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
    set -o pipefail
    if [[ -z $xpathIsExpr ]]; then
      echo "${INPUT}" | xmllint --xpath "(//*/*[name()=\"${TAG}\"])[${NthOccurrence}]/text()" - | cut -d\" -f2
      iRc=$?
    else
      echo "${INPUT}" | xmllint --xpath "(//*/${TAG})[${NthOccurrence}]/text()" - | cut -d\" -f2
      iRc=$?
    fi
    iRc=$?
    set ${opipefailVal}o pipefail
    return $iRc
  else
    export RARE_SQ1=${RARE_SQ1:=$(getUUID)}
    echo "$INPUT" | sed -r -e '/^[\r\n[:blank:]]*$/ d' -e ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g" | sed -r -e "s,^.*<${TAG}>,,g" -e "s,</${TAG}>.*$,,g" -e "s, ${RARE_SQ1} ,\n,g" | grep -v '<'
  fi

#  echo "$INPUT" | sed -r -e '/^[\r\n[:blank:]]*$/ d' -e ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g" | sed -r -e "s,<${TAG}>([^<]*)</${TAG}>,\1\n,g" -e "s, ${RARE_SQ1} ,\n,g"
}

function getXMLAttrVal {
  export RARE_SQ1=${RARE_SQ1:=$(getUUID)}
  export RARE_SQ2=${RARE_SQ2:=$(getUUID)}
  local T TAGS bGetTagValue INPUT xpathIsExpr NthOccurrence=1 nArgs=$# iRc=0
  [[ ! -z $1 ]] && { IFS=$','; TAGS=($1); unset IFS; }
  for T in "${TAGS[@]}"; do
    isValidXMLName "${T}" || { echo "$T does not appear to be a valid XML Name." | STDERR; ! useXMLLint && return 1; xpathIsExpr=1; }
  done
  ATTR=$2
  isValidXMLName "${ATTR}" || { echo "$ATTR does not appear to be a valid XML Name." | STDERR; ! useXMLLint && return 1; xpathIsExpr=1; }
  [[ ${ATTR} =~ [nN][oO][nN][eE] || ${ATTR} =~ [nN][uU][lL][lL] || ${ATTR} =~ [nN][iI][lL] || ${ATTR} =~ 0 ]] && bGetTagValue=1
  case ${nArgs} in
    2)
      [[ ! -t 0 ]] && INPUT=$(cat)
      ;;
    3)
      [[ ! -t 0 ]] && INPUT=$(cat) && NthOccurrence=$3
      [[ $3 =~ ^-?[1-9]$ ]] && { NthOccurrence=$3; shift; }
      ;;
    4)
      NthOccurrence=$3
      shift
      [[ ! -t 0 ]] && INPUT=$(cat)
      ;;
    *)
      echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <XML-tag> <XML-tag-attribute> [NthOccurrence...1-9] <file-path>"
      return 1
      ;;
  esac

  [[ $NthOccurrence =~ ^-([1-9])$ ]] && { useXMLLint && NthOccurrence="last()-$[${BASH_REMATCH[1]}-1]"; } || [[ $NthOccurrence =~ ^[1-9]$ ]] || { echo "Bad value of occurence param '$NthOccurrence'. It must be an (+-)integer between 1-9." | STDERR || return 2; }
  if [[ ! -z ${INPUT} ]]; then
    # INPUT is read from pipe.
    if useXMLLint; then
      local opipefailVal='+'
      [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
      set -o pipefail
      for T in "${TAGS[@]}"; do
        if [[ -z ${bGetTagValue} ]]; then
          if [[ -z $xpathIsExpr ]]; then
            echo "${INPUT}" | xmllint --xpath "(//*/*[name()=\"${T}\"]/@${ATTR})[${NthOccurrence}]" - | cut -d\" -f2
          else
            echo "${INPUT}" | xmllint --xpath "(//*/${T}/@${ATTR})[${NthOccurrence}]" - | cut -d\" -f2
          fi
        else
          echo "${INPUT}" | getXMLTagVal "${T}" ${NthOccurrence}
        fi
        [[ $? -eq 0 ]] || iRc=$?
      done
      set ${opipefailVal}o pipefail
    else
      [[ -z ${bGetTagValue} ]] || { for T in "${TAGS[@]}"; do echo "$INPUT" | sed -r '/^[\r\n[:blank:]]*$/ d' | sed -r "s,.*<${T}[^>]+>([^<]*)</${T}>.*,\1,${NthOccurrence}" | grep -v '<'; done; return $?; }
      for T in "${TAGS[@]}"; do
        echo "$INPUT" | sed -r -e '/^[\r\n[:blank:]]*$/ d' -e ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g" | sed -r "s/(<${T} [^>]*>)/${RARE_SQ2}\1${RARE_SQ2}/${NthOccurrence};s/.*${RARE_SQ2}(.*)${RARE_SQ2}.*/\1/g;s/${RARE_SQ1}//g;s/.*<${T}[^>]*${ATTR}\s*=\s*[\"\']([^\"\']*)[\"\'].*/\1/g" | grep -v '<'
      done
      iRc=$?
    fi
  else
    # INPUT is to be read from a file speficied in argument.
    INPUT=$3
    [[ -z ${INPUT} || ! -f ${INPUT} ]] && { echo "Bad Input XML." | STDERR; return 3; } 
    local opipefailVal='+' iRc
    [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
    set -o pipefail
    if useXMLLint; then
      for T in "${TAGS[@]}"; do
        if [[ -z ${bGetTagValue} ]]; then
          if [[ -z $xpathIsExpr ]]; then
            cat "${INPUT}" | xmllint --xpath "(//*/*[name()=\"${T}\"]/@${ATTR})[${NthOccurrence}]" - | cut -d\" -f2
          else
            cat "${INPUT}" | xmllint --xpath "(//*/${T}/@${ATTR})[${NthOccurrence}]" - | cut -d\" -f2
          fi
        else
          cat "${INPUT}" | getXMLTagVal "${T}" ${NthOccurrence}
        fi
        [[ $? -eq 0 ]] || iRc=$?
      done
    else
      [[ -z ${bGetTagValue} ]] || { for T in "${TAGS[@]}"; do cat "$INPUT" | sed -r '/^[\r\n[:blank:]]*$/ d' | sed -r "s,.*<${T}[^>]+>([^<]*)</${T}>.*,\1,${NthOccurrence}" | grep -v '<'; done; return $? ; }
      for T in "${TAGS[@]}"; do
        cat $INPUT | sed -r -e '/^[\r\n[:blank:]]*$/ d' -e ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g" | sed -r "s/(<${T} [^>]*>)/${RARE_SQ2}\1${RARE_SQ2}/${NthOccurrence};s/.*${RARE_SQ2}(.*)${RARE_SQ2}.*/\1/g;s/${RARE_SQ1}//g;s/.*<${T}[^>]*${ATTR}\s*=\s*[\"\']([^\"\']*)[\"\'].*/\1/g" | grep -v '<'
        [[ $? -eq 0 ]] || iRc=$?
      done
    fi
    set ${opipefailVal}o pipefail
  fi
  return $iRc
}
function cacheEnvVar {
  local lRemoveKey
  local lReadVar
  local lForce
  local lAppend
  if [ $# -eq 0 ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [-[-]f,F,p,P (purge/force overwrite cache with all variable references)] [-[-]c,C (comment out variable from cache use)] [-[-]r,R (read variable from cache)] [-[-]h,H (help)] <variable> [value]"
    return 1
  fi
  while [ ! -z "$1" ]
  do
    if [[ ! $1 =~ ^-.* ]]; then
      break
    fi
    if [[ $1 =~ ^[-]+[hH].* ]]; then
      echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [-[-]f,F,p,P (purge/force overwrite cache with all variable references)] [-[-]c,C (comment out variable from cache use)] [-[-]r,R (read variable from cache)] [-[-]h,H (help)] <variable> [value]"
      return 0
    fi
    if [[ $1 =~ ^[-]+[cC].* ]]; then
      lRemoveKey=1
    fi
    if [[ $1 =~ ^[-]+[rR].* ]]; then
      lReadVar=1
    fi
    if [[ $1 =~ ^[-]+[fFpP].* ]]; then
      lForce=1
    fi
    if [[ $1 =~ ^[-]+[aA].* ]]; then
      lAppend=1
    fi
    shift
  done
  if [[ -n ${lAppend} ]]; then
    local v lines=()
    for k in "$@"; do
      v="${!k}"
      [[ -z ${v} ]] || lines+=("export ${k}='${v}'")
    done
    printf "%s\n" "${lines[@]}" >> ~/.before.sh
    return
  fi
  local key=$1
  [[ ! -f ~/.before.sh ]] && touch ~/.before.sh
  if [[ -n ${lReadVar} ]]; then
    local value=$(cat ~/.before.sh | grep -E "^[[:space:]]*export\s+${key}=" | tail -1)
    [[ -z ${value} ]] && unset ${key} && return 1
    [[ $value =~ ([[:space:]]*export[^=]+=[[:space:]]*[\'\"]?)([^\"\']+)([\'\"]?) ]] && declare -g ${key}="${BASH_REMATCH[2]}"
    return 0
  fi
  if [[ -n ${lRemoveKey} ]]; then
    if [[ -n ${lForce} ]]; then
      sed -i -r "/^[[:space:]#]*export\s+${key}=/d" ~/.before.sh
    else
      sed -i -r "s/(^\s*export\s+${key}=)(.*)/#\1\2/g" ~/.before.sh
    fi
    unset ${key}
    return 0
  fi
  local value="${!key}"
  shift
  all_args="$@"
  if [ ! -z "${all_args}" ]; then
    value="${all_args}"
  fi
  if [ ! -z "${value}" ]; then
    # insert key value only if it is not already there.
    # if exact key value is there do not do anything just return
    local escapedValue="$(echo "$value" | sed -r -e 's,\\,\\\\,g' -e 's,\(,\\(,g' -e 's,\),\\),g')"
    cat ~/.before.sh | grep -E "^[[:space:]]*export[[:space:]]+${key}=\"${escapedValue}\"" > /dev/null
    [[ $? -eq 0 ]] && return 0
    # if key value is there but value is different, but force flag is not on, then
    # comment out the key first before inserting new key value pair.
    value=$(echo $value | sed -r 's,[^\\]\\$,\\\\,g')
    export ${key}="${value}"
    cat ~/.before.sh | grep -E "^[[:space:]]*export[[:space:]]+${key}=" > /dev/null
    if [ $? -eq 0 ]; then
      if [[ -n ${lForce} ]]; then
        sed -i -r "s/(^\s*export\s+${key}=)(.*)/\1\"${value}\"/g" ~/.before.sh
      else
        sed -i -r "s/(^\s*export\s+${key}=)(.*)/#\1\2/g" ~/.before.sh
      fi
    else
      echo "export "${key}=\"${value}\" >> ~/.before.sh
    fi
  fi
}
function isWSL { false; }
uname -r | grep -i WSL > /dev/null && function isWSL { true; }
if [[ ${OSTYPE} = "cygwin" ]]; then
  function isCygwin { true; }
else
  [[ -z $TMP ]] && cacheEnvVar TMP /tmp
  export TEMP=${TEMP:=${TMP}}
  function isCygwin { false; }
fi
function isValidXMLName {
  local re='^([_:[:alpha:]][-._:[:alnum:]]?|(?![xX])[_:[:alpha:]][-._:[:alnum:]]{2,}|[_:[:alpha:]](?![mM])[-._:[:alnum:]][-._:[:alnum:]]+|[-._:[:alpha:]][-._:[:alnum:]](?![lL])[-._:[:alnum:]][-._:[:alnum:]]*)$'
  grep -q -P $re <<< $1 > /dev/null
}
function useXMLLint { false; }
function toggleXMLLintUse { false; }
if exec_command_exists xmllint; then
    function useXMLLint { true; }
    function toggleXMLLintUse {
        useXMLLint && function useXMLLint { false; } ||  function useXMLLint { true; }
    }
fi

if ! exec_command_exists d2u; then
  if ! exec_command_exists dos2unix; then
    function dos2unix {
      local if=$(_KEY_HAS_VALUE -f $@)
      [[ ! -z ${if} ]] && { sed -i -r -e 's,\r$,,g' $f; return $?; }
      echo "$([[ -p /dev/stdin ]] && cat - || echo "$@")" | sed -r -e 's,\r$,,g'
    }
  else
    alias d2u=dos2unix
  fi
else
  ! exec_command_exists dos2unix && alias dos2unix=d2u
fi
function getUsersFolder  {
  _CONTAINS -h "$@" || [[ $# -eq 0 ]] && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [users-folder e.g Desktop | Downloads | Favorites | My Music | My Pictures | My Video | Personal e.t.c | ] " && return 1
  if isCygwin; then
    for f in "$@"; do
    local getFolder_Cmd folder
    [[ -z $folder ]] && getFolder_Cmd="Get-ItemPropertyValue -Path \"HKCU:\\\Software\\\Microsoft\\\Windows\\\CurrentVersion\\\Explorer\\\User Shell Folders\" -Name '${f}'" && folder="$(getCmdValue 'wps -Command ${getFolder_Cmd}')" && folder=$(ustyle "${folder}") && [[ ! -d $folder ]] && unset folder
    [[ -z $folder ]] && getFolder_Cmd="Get-ItemPropertyValue -Path \"HKCU:\\\Software\\\Microsoft\\\Windows\\\CurrentVersion\\\Explorer\\\Shell Folders\" -Name ${f}" && folder="$(getCmdValue 'wps -Command ${getFolder_Cmd}')" && folder=$(ustyle "${folder}") && [[ ! -d $folder ]] && unset folder
    [[ -z $folder ]] && folder=$(cygpath -u "${USERPROFILE}\\${f}") && [[ ! -d $folder ]] && unset folder
    echo $folder
    done
  else
    for f in "$@"; do
      case ${f,,} in
        home|personal)
            echo ~
        ;;
        download*)
            echo ~/Downloads
        ;;
        config)
            echo /etc
        ;;
        temp*|tmp*)
            echo /tmp
        ;;
        root)
            echo /
        ;;
        *)
          echo ~/$f
        ;;
      esac
    done
  fi
}

function execute_with_UserInteraction {
  _CONTAINS -h "$@" || [[ $# -lt 2 ]] && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} <cmd> <prompt-to-answer> [answer]" && return 1
  local cmd="$1"
  local prompt=$2
  local answer=$3
  answer=${answer:=${OKTA}}
  if exec_command_exists expect  && [[ -z ${DISABLE_EXPECT} ]]; then
    local exe=${cmd%%[[:space:]]*}
    exe=${exe##*/}
    echo '#!/usr/bin/expect -f' > /tmp/expect.exp
    # echo "spawn -noecho ${cmd}" >> /tmp/expect.exp
    echo "spawn ${cmd}" >> /tmp/expect.exp
    echo "expect -re { ${prompt}} {" >> /tmp/expect.exp
    echo "send \"${answer}\r\";" >> /tmp/expect.exp
    echo "}" >> /tmp/expect.exp
    [[ ! -z ${REMOTE_CMD_OUTPUT_BUFFER} ]] && echo "set timeout -1" >> /tmp/expect.exp
    [[ ${exe} = "scp" ]] || { [[ -z ${REMOTE_CMD_OUTPUT_BUFFER}  ]] || echo "expect eof" >> /tmp/expect.exp; }

    [[ -z ${REMOTE_CMD_OUTPUT_BUFFER}   ]] && echo "interact" >> /tmp/expect.exp && expect /tmp/expect.exp
    [[ ! -z ${REMOTE_CMD_OUTPUT_BUFFER} ]] && expect /tmp/expect.exp | grep -A ${REMOTE_CMD_OUTPUT_BUFFER} "LOG OFF IMMEDIATELY" | grep -E -v "(Connection to|LOG OFF IMMEDIATELY)"
  else
    eval "${cmd}"
  fi
  return $?
}

# First argument is Url, second(optional) argument is output file name.
function download {
  if [ $# -lt 1 -o $# -gt 2 ]; then
        echo "${YELLOW_COL}Usage${RESET_COL}: ${FUNCNAME[0]} <http-url> [dest-file-path]
            http-url          ${YELLOW_COL}Mandatory${RESET_COL} URL to download from.
            dest-file-path    ${GREEN_COL}Optional${RESET_COL}  Local destination file path.
                                                       default destination folder is current folder on local machine
                                                       and file name is as specified in URL" | STDERR
    return 1
  fi
  local destFile=$2;
  [[ ! -z ${destFile} ]] && destFile=$(realpath -m "${destFile}")
  [[ -z ${destFile} ]] && destFile="$PWD/${1##*/}"
  [[ -f ${destFile} ]] && echo "${YELLOW_COL}${destFile}${RESET_COL} already exists..Remove it to download afresh." && return 0
  local iRc=0
  echo "${YELLOW_COL}${1}${RESET_COL} => ${GREEN_COL}${destFile}${RESET_COL} ..."
  if exec_command_exists curl; then
    http_ret_Code=$(curl -L $1 -r 0-512 -s -o /dev/null -w '%{http_code}')
    if [[ $http_ret_Code =~ ^[2,3][[:digit:]]+$ ]]; then
      if isCygwin && [[ $(which curl | cut -d '/' -f2) == "cygdrive" ]]; then
        echo "${YELLOW_COL}Using Windows curl ${RESET_COL}"
        curl -L $1 -o "$(native "${destFile}")"
      else
        curl -L $1 -o ${destFile}
      fi
      iRc=$?
    else
      iRc=$http_ret_Code
    fi
  elif exec_command_exists wget; then
    wget $1 -O ${destFile}
    iRc=$?
  else
    echo   "Oops!!!...You do not  seem to have curl/wget installed on your machine. Please open ${OSTYPE} again after ensuring curl/wget exists and is available in PATH."
    readEx "Closing terminal in " 10 " seconds... Press any other key to prevent terminal from closing." || exit
    iRc=3
  fi
  [[ ! -f ${destFile} ]] && echo "${RED_COL}ALERT:Error ($iRc)${RESET_COL}" && [[ $iRc -eq 0 ]] && iRc=404
  [[ -f ${destFile} ]] && chmod +x ${destFile}
  return $iRc
}
function getPlatformPath {
  local cyg_unix_path
  if [ -z "$1" ]; then
    cyg_unix_path="$PWD"
  else
    cyg_unix_path="$1"
  fi
  if isCygwin; then
    if [ X"${cyg_unix_path:0:2}" = 'X\\' ]; then
      echo "$cyg_unix_path" | sed  's,/,\\,g'
      return
    fi
    cyg_unix_path=$(echo "$cyg_unix_path" | sed 's/\\/\\\\/g')
    cyg_unix_path=$(cygpath -u "$cyg_unix_path")
  fi
  if ! [ -d "$cyg_unix_path" ]; then
    cyg_unix_path=$(readlink -f "$cyg_unix_path")
    cyg_unix_path=$(dirname "$cyg_unix_path")
  fi
  cyg_unix_path=$(readlink -f "$cyg_unix_path")
  if isCygwin; then
    win_path=$(cygpath -w "${cyg_unix_path}/")
    echo "$win_path"
  else
    echo "${cyg_unix_path}/"
  fi
}
[[ -f ~/.git-completion.bash ]]   && . ~/.git-completion.bash && ___git_complete g __git_main
[[ ! -z ${ENABLE_GIT_PS1} ]] && [[ -f ~/.git-prompt.bash ]]   && . ~/.git-prompt.bash
# Available GIT_PS1 options/env vars
# cat ~/.git-prompt.bash | grep GIT_PS1_ | sed -r 's,^\s*#.*,,' | grep -v -E '^$' | sed -r 's,^.*(GIT_PS1_[A-Z_]+).*,\1,' | sort | uniq | sed -r 's,^(.*)$,export \1=,'
# export GIT_PS1_COMPRESSSPARSESTATE=
# export GIT_PS1_DESCRIBE_STYLE=
# export GIT_PS1_HIDE_IF_PWD_IGNORED=
# export GIT_PS1_OMITSPARSESTATE=
# export GIT_PS1_SHOWCOLORHINTS=
# export GIT_PS1_SHOWDIRTYSTATE=
# export GIT_PS1_SHOWSTASHSTATE=
# export GIT_PS1_SHOWUNTRACKEDFILES=
# export GIT_PS1_SHOWUPSTREAM=
# export GIT_PS1_STATESEPARATOR=
# for i in $(cat ~/.git-prompt.bash | grep GIT_PS1_ | sed -r 's,^\s*#.*,,' | grep -v -E '^$' | sed -r 's,^.*(GIT_PS1_[A-Z_]+).*,\1,' | sort | uniq); do varname=$i; declare -g ${i}=1; done
# P.S Above is just illustration not all config vars are [0/1].
# For more info:
# cat ~/.git-prompt.bash | sed -r -n -e '1,/^[^\s*#]/p' | head -n -2
function gitAddAllModified {
  git add $(git status | grep modified | grep -v .npmrc | cut -d ':' -f2 | tr -d ' ')
}
# gam; git commit -m "$(git log -1 --pretty=%B)"; GIT_EDITOR='sed -i -e "2,\$s/^pick/s /"' git rebase -i HEAD~2; git push -f
# (g)it (m)erge (w)ith (l)ast (c)ommit
function gmwlc {
  git stash; git pull; git stash pop; gitAddAllModified; git commit -m "#"; GIT_EDITOR='sed -i -e "2,\$s/^pick/s /"' git rebase -i HEAD~2; git push -f
}
function gitMergeAllCommits2 {
  local curBranch=$(currentBranch)
  local l_MASTER_BRANCH=$(git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//")
  if [[ -z ${l_MASTER_BRANCH} ]]; then
    l_MASTER_BRANCH=$MASTER_BRANCH
  fi
  if [[ ${curBranch} = ${l_MASTER_BRANCH} ]]; then
    echo "${RED_COL}ALERT:${RESET_COL} Merge of commits on ${l_MASTER_BRANCH} is prohibited"
    echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} [your-commit-message]"
    return 1
  fi
  local commitMsg
  ommitMsg="$1"
  if [ $# -gt 1 ]; then
    echo "${RED_COL}Usage:${RESET_COL} ${FUNCNAME[0]} [your-commit-message]"
    return 2
  fi
  if [ -z "$(cb | grep '[Nn][Ee][Oo]-[1-9][0-9][0-9][0-9][0-9]')" ]; then
    echo "${RED_COL}ALERT:${RESET_COL} Skipping merge. Your current branch ${GREEN_COL}"$(currentBranch)"${RESET_COL} does not seem like a branch for PR review."
    return 3
  fi
  if [ -z "$commitMsg" ]; then
    local DEF_COMMIT_MSG="Merge all commits in ${curBranch} into one"
    echo "${YELLOW_COL}WARN:${RESET_COL} No commit message provided Using default commit message: ${YELLOW_COL}${DEF_COMMIT_MSG}${RESET_COL}"
    commitMsg="$DEF_COMMIT_MSG"
  fi
  echo "Try stash of local changes..."
  git stash
  git reset $(git merge-base ${l_MASTER_BRANCH} ${curBranch})
  flushInput
  local yn
  read -p "Do you now wish to see diff (y/[n])?" yn
  yn=${yn:0:1}
  if [ "X${yn,,}" = "Xy" ] ;  then
    git diff --word-diff=color
  fi
  echo "***You will have to manually add files that have been added(and not modified)***"
  flushInput
  read -p "Assuming all changes are correct..Do you wish to continue? ([y]/n) " yn
  yn=${yn:0:1}
  if [ "X${yn,,}" = "Xn" ] ;  then
    echo "${YELLOW_COL}ALERT:${RESET_COL} Aborting merge on branch: " ${curBranch}
    git reset --hard origin/${curBranch}
    git stash apply
    return 4
  fi
  gitAddAllModified  # Or git add --patch # to iterate over all patch diffs and ask for their merge.
  git commit -m "$commitMsg"
  git push -f origin ${curBranch}  # force push your current branch into its origin(remote).
  echo "Apply back local changes to your branch..."
  git stash apply
}
function gitMergeAllCommits {
  local curBranch=$(currentBranch)
  local l_MASTER_BRANCH=$(git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//")
  if [[ -z ${l_MASTER_BRANCH} ]]; then
    l_MASTER_BRANCH=${MASTER_BRANCH}
  fi
  if [[ ${curBranch} = ${l_MASTER_BRANCH} ]]; then
    echo "${RED_COL}ALERT:${RESET_COL} Merge of commits on ${l_MASTER_BRANCH} is prohibited"
    echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} [-f] [your-commit-message]"
    return
  fi
  local commitMsg
  local FORCE=0
  commitMsg="$1"
  if [ "$1" = "-f" ]; then
    commitMsg="$2"
  fi
  if [ $# -gt 2 ]; then
    echo "${RED_COL}Usage:${RESET_COL} ${FUNCNAME[0]} [-f] [your-commit-message]"
    return
  fi
  if [ "$1" = "-f" ] || [ "$2" = "-f" ]; then
    FORCE=1
  fi
  if [ $FORCE -eq 0 ]; then
    if [ $# -eq 2 ]; then
      echo "${RED_COL}Usage:${RESET_COL} ${FUNCNAME[0]} [-f] [your-commit-message]"
      return
    fi
    if [ -z "$(cb | grep '[Nn][Ee][Oo]-[1-9][0-9][0-9][0-9][0-9]')" ]; then
      echo "${RED_COL}ALERT:${RESET_COL} Skipping merge. Your current branch ${GREEN_COL}"${curBranch}"${RESET_COL} does not seem like a branch for PR review."
      echo "${YELLOW_COL}WARN:${RESET_COL} Use -f option to force merge of commits for this branch."
      return
    fi
  fi
  if [ -z "$commitMsg" ]; then
    local DEF_COMMIT_MSG="Merge all commits in ${curBranch} into one"
    echo "${YELLOW_COL}WARN:${RESET_COL} No commit message provided Using default commit message: ${YELLOW_COL}${DEF_COMMIT_MSG}${RESET_COL}"
    commitMsg="$DEF_COMMIT_MSG"
  fi
  echo "Try stash of local changes..."
  git stash
  git checkout ${l_MASTER_BRANCH}
  git pull #update master branch from origin
  git checkout ${curBranch}
  git merge ${l_MASTER_BRANCH} #merge latest state of v6-master
  git reset ${l_MASTER_BRANCH} #reset your current branch as if it is v6-master BUT local files remain untouched
  flushInput
  local yn
  read -p "Do you now wish to see diff (y/[n])?" yn
  yn=${yn:0:1}
  if [ "X${yn,,}" = "Xy" ] ;  then
    git diff --word-diff=color
  fi
  flushInput
  read -p "Assuming all changes are correct..Do you wish to continue? ([y]/n) " yn
  yn=${yn:0:1}
  if [ "X${yn,,}" = "Xn" ] ;  then
    echo "${YELLOW_COL}ALERT:${RESET_COL} Aborting merge on branch: " ${curBranch}
    git stash apply
    return
  fi
  gitAddAllModified  # Or git add --patch # to iterate over all patch diffs and ask for their merge.
  git commit -m "$commitMsg"
  git push -f # force push your current branch into its origin(remote).
  echo "Apply back local/stashed changes to the branch..."
  git stash apply
}
export SCP_OPTS=${SCP_OPTS:='-4 -o PubkeyAcceptedKeyTypes=+ssh-rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ServerAliveInterval=60 -A'}
export SSHR_OPTS=${SSHR_OPTS:="${SCP_OPTS} -t"}
function sConn {
  function createEncConn  {
    local all_args=""
    for i in "$@"; do
      if [ "$i" = "-oForwardAgent=no" ]
      then
        :
      else
        all_args="${all_args} ${i}"
      fi
    done
    ssh ${SSHR_OPTS} ${all_args}
  }
  if ! [ -s ~/scon.pl ]; then
    echo "#!/usr/bin/perl" > ~/scon.pl
    echo "exec '/usr/bin/ssh', '-A', map {\$_ eq '-oForwardAgent=no' ? ( ) : \$_} @ARGV" >> ~/scon.pl
    chmod +x ~/scon.pl
    fi
    if ! [ -s ~/scon.sh ]; then
    echo "#!/bin/bash" > ~/scon.sh
    echo -n "function " >> ~/scon.sh
    declare -f createEncConn >> ~/scon.sh
    echo "createEncConn \"\$@\"" >> ~/scon.sh
    chmod +x ~/scon.sh
  fi
  if ! [ -s ~/scon ]; then
    ln -s ~/scon.sh ~/scon
  fi
  unset -f createEncConn
}
function getOS {
  if [ "${OSTYPE}" = "cygwin" ]; then
    echo "${OSTYPE}"
  else
    echo "$(uname -o | tr [:upper:] [:lower:])"
  fi
}
if isCygwin; then
  function wstyle_step2 {
              [[ $1 =~ \\cygdrive\\(.)\\(.*) ]];
              [[ -z ${BASH_REMATCH[1]} ]] && cygpath -w "$(echo ${1//\\/\/})" && return;
              echo ${BASH_REMATCH[1]^}:\\${BASH_REMATCH[2]}; }
  function wstyle       { wstyle_step2 "$(echo ${1//\//\\})"; }
  function wstyle2      {
              local t="$(echo ${1//\//\\})";
              [[ $t =~ \\cygdrive\\(.)\\(.*) ]];
              [[ -z ${BASH_REMATCH[1]} ]] && cygpath -w "$1" && return;
              echo ${BASH_REMATCH[1]^}:\\${BASH_REMATCH[2]}; }
  function ustyle_step2 {
                [[ $1 =~ ([a-zA-Z]?):/(.*) ]];
                [[ -z ${BASH_REMATCH[1]} ]] && echo $1 && return;
                echo /cygdrive/${BASH_REMATCH[1],}/${BASH_REMATCH[2]}; }
  function ustyle       { ustyle_step2 "$(echo ${1//\\/\/})"; }
  function ustyle2      {
              local t="$(echo ${1//\\/\/})";
              [[ $t =~ ([a-zA-Z]?):/(.*) ]];
              [[ -z ${BASH_REMATCH[1]} ]] && echo $t && return;
              echo /cygdrive/${BASH_REMATCH[1],}/${BASH_REMATCH[2]}; }
  function native2       {
      local isWinPath;
      [[ $(nchars '\\' $1 ) -gt $(nchars / $1 ) ]] && isWinPath=1;
      [[ -z ${isWinPath} ]] && wstyle $1 && return
      echo $1;
    }
  alias native=wstyle
else
  function wstyle_step2 {
              [[ $1 =~ \\mnt\\(.)\\(.*) ]];
              [[ -z ${BASH_REMATCH[1]} ]] && return;
              echo ${BASH_REMATCH[1]^}:\\${BASH_REMATCH[2]}; }
  function wstyle       { wstyle_step2 "$(echo ${1//\//\\})"; }
  function wstyle2      {
              local t="$(echo ${1//\//\\})";
              [[ $t =~ \\mnt\\(.)\\(.*) ]];
              [[ -z ${BASH_REMATCH[1]} ]] && return;
              echo ${BASH_REMATCH[1]^}:\\${BASH_REMATCH[2]}; }
  function ustyle_step2 {
                [[ $1 =~ ([a-zA-Z]?):/(.*) ]];
                [[ -z ${BASH_REMATCH[1]} ]] && echo $1 && return;
                echo /mnt/${BASH_REMATCH[1],}/${BASH_REMATCH[2]}; }
  function ustyle       { ustyle_step2 "$(echo ${1//\\/\/})"; }
  function ustyle2      {
              local t="$(echo ${1//\\/\/})";
              [[ $t =~ ([a-zA-Z]?):/(.*) ]];
              [[ -z ${BASH_REMATCH[1]} ]] && echo $t && return;
              echo /mnt/${BASH_REMATCH[1],}/${BASH_REMATCH[2]}; }
  alias native=ustyle
  function native2       {
    local isWinPath;
    [[ $(nchars '\\' $1 ) -gt $(nchars / $1 ) ]] && isWinPath=1;
    [[ -z ${isWinPath} ]] && echo $1 && return
    ustyle $1
  }
fi
function ustyleall { local TMP_IFS=$IFS; IFS=';'; for i in $1 ; do ustyle "$i"; done ; IFS=$TMP_IFS; }
###############################################################################
# Here onwards, functions declared "may" make platform related/dependent calls.
# Please change them according to target platform if necessary.
# You can use getOS() function or ${OSTYPE} to know the target platform.
###############################################################################
# conversion marker: 1
function getEOL {
  export HOSTS_EOL="\n"
  [[ -z $1 ]] && isCygwin && HOSTS_EOL="\r\n"
  [[ -z $1 ]] && echo ${HOSTS_EOL} && return
  [[ ! -e $1 ]] && return 1
  (head $1 | grep -U $'\r' > /dev/null) && HOSTS_EOL="\r\n"
  echo ${HOSTS_EOL}
  if [ $(tail -c 1 $1 | wc -l) -eq 0 ]; then
    echo -ne "${HOSTS_EOL}" >> ${1}
  fi
}
function getCmdValue {
  local var iRc
  var=$(eval $1)
  iRc=$?
  [ $iRc -ne 0 ] && return $iRc
  if isCygwin; then
    var=${var%$'\r'}
    echo "$var"
  else
    echo "$var"
  fi
}
function wps {
#  echo "Called from ${FUNCNAME[1]} via ${FUNCNAME[2]} as ... $@" > /dev/tty
  if exec_command_exists pwsh; then
    [[ $# -eq 1 ]] && [[ X$1 = "X-i" ]] && export PWSHELL=pwsh && return
    pwsh "$@"
  elif exec_command_exists powershell; then
    [[ $# -eq 1 ]] && [[ X$1 = "X-i" ]] && export PWSHELL=powershell && return
    powershell "$@"
  else
    echo "${RED_COL}ALERT:${RESET_COL}powershell not found. You can install command : ${YELLOW_COL}wcinstall powershell${RESET_COL}"
  fi
}
wps -i
if isCygwin; then
  alias SUDO="cygstart --action=runas"
  alias sudo=eval
  if ! exec_command_exists apt && exec_command_exists apt-cyg; then
    alias aptS=apt-cyg
  fi
# if CAMP_AC_ROOT environment variable is not defined it defaults to
# '/cygdrive/f/campaign/ac'
  if [ -z ${CAMP_AC_ROOT+x} ]
  then
    export CAMP_AC_ROOT='/cygdrive/f/campaign/ac'
  fi
  CAMP_AC_ROOT="$(ustyle "${CAMP_AC_ROOT}")"
else
  function fixresolvConf {
    add2HostsFile $(hostname) $(getIP)
    local rtt nsCount=$(cat /etc/resolv.conf | grep -E "\s*nameserver" | wc -l)
    for h in $(cat /etc/resolv.conf | awk '{print $2;}'); do
      rtt=$(eval timeout 1 ping -c 1 -q $h | grep rtt | awk '{print $4;}' | awk -F'/' '{print $1;}' 2> /dev/null)
      [[ -z $rtt ]] && rtt=10000 && nsCount=$[${nsCount}-1]
      echo $rtt $h
    done | sort -n | awk '{print "nameserver",$2}' > /tmp/resolv.conf
    [[ ${nsCount} -eq 0 ]] || cmp -s /tmp/resolv.conf /etc/resolv.conf && return
    sudo mv /tmp/resolv.conf /etc/resolv.conf
  }

  if ! exec_command_exists aptS && exec_command_exists apt-get; then
    alias aptS='sudo apt-get -y'
  fi
  PATH=$(echo $PATH | sed -r 's,:,\n,g' | grep -v -E '^/mnt/c' | tr '\n' ':')
  [[ -d /opt/mssql-tools/bin ]] && PATH="${PATH}/opt/mssql-tools/bin"
fi
export OPENSSL_BIN=$(which openssl)
isCygwin && [[ ! ${OPENSSL_BIN}  =~ ^/usr/.* ]] && OPENSSL_BIN=/usr/bin/openssl
if ! exec_command_exists ${OPENSSL_BIN}; then
  aptS install openssl
fi
if ! exec_command_exists ${OPENSSL_BIN}; then
    echo "${RED_COL}ALERT:${RESET_COL} ${OPENSSL_BIN} not found !"
   return
fi
function updateUser {
  local USER_PASSWD_FILE="/etc/passwd"
#  alias mkuser='echo ADOBENET+$(mkpasswd -c)'
#  alias mkuser='mkpasswd -c'
#  unalias mkuser
  local cur_user_passwd_entry
  if [ -z "$1" ]; then
    cur_user_passwd_entry="$(mkpasswd -c)"
  else
    cur_user_passwd_entry="$(mkpasswd --domain ADOBENET --username ${1})"
    if [ -z "${cur_user_passwd_entry}" ]; then
      cur_user_passwd_entry="$(mkpasswd -l --username ${1})"
    fi
  fi
  local administratorGroupID=$(mkgroup -L $(hostname --fqdn) -S= -c | grep -E "^Administrators" | cut -d ':' -f3)
  cur_user_passwd_entry="$(echo ${cur_user_passwd_entry} | cut -d ':'  -f-3):${administratorGroupID}:$(echo ${cur_user_passwd_entry} | cut -d ':'  -f5-)"
  echo ${cur_user_passwd_entry} | cut -d ':'  -f-3
  [[ ! -z "${cur_user_passwd_entry}" ]] || { echo "Alert: Invalid User '${1}'." | STDERR || return $?; }
  touch ${USER_PASSWD_FILE}
  local cur_user="$(echo ${cur_user_passwd_entry} | cut -d ':' -f1)"
  local new_user=$(echo ${cur_user} | sed -r 's,^[[:alnum:]]+[^[:alnum:]],,')
  if [ $cur_user = $new_user ]; then
    cat ${USER_PASSWD_FILE} | grep "^${cur_user}:" > /dev/null
    if [ $? -ne 0 ]; then
        echo ${cur_user_passwd_entry} >> ${USER_PASSWD_FILE}
      fi
  else
    cat ${USER_PASSWD_FILE} | grep "^${cur_user}:" > /dev/null
    if [ $? -eq 0 ]; then
      sed -i "s,^${cur_user}:,${new_user}:," ${USER_PASSWD_FILE}
    else
      cat ${USER_PASSWD_FILE} | grep "^${new_user}:" > /dev/null
      if [ $? -ne 0 ]; then
        echo ${cur_user_passwd_entry} | sed "s,^${cur_user}:,${new_user}:," >> ${USER_PASSWD_FILE}
      fi
    fi
  fi
  local user_home_dir="$(cat ${USER_PASSWD_FILE} | grep "^${new_user}:" | cut -d ':' -f6)"
  if ! [ -d ${user_home_dir} ]; then
    mkdir -p ${user_home_dir}/.ssh
    ln -s ${CAMP_AC_ROOT}/../acc-dev/acc-dev-setup/.bashrc ${user_home_dir}/.bashrc
    cp ~/.profile ${user_home_dir}/
    cp ~/.bash_profile ${user_home_dir}/
    echo "CAMP_AC_ROOT=${CAMP_AC_ROOT}" > ${user_home_dir}/.ssh/environment
    chown -R ${new_user} ${user_home_dir}
    chmod -R 600 ${user_home_dir}/.ssh
  else
    [[ -f ${user_home_dir}/.ssh/environment ]]  && cat ${user_home_dir}/.ssh/environment | grep -v -E "^CAMP_AC_ROOT" > /tmp/env
    echo "CAMP_AC_ROOT=${CAMP_AC_ROOT}" >> /tmp/env
    mkdir ${user_home_dir}/.ssh
    mv -f /tmp/env ${user_home_dir}/.ssh/environment
  fi
}
#############################################################
# if exec_command_exists pwsh; then
  # alias wps=pwsh
# elif exec_command_exists powershell; then
  # alias wps=powershell
# else
  # echo "${RED_COL}ALERT:${RESET_COL}powershell not found. You can install command : ${YELLOW_COL}wcinstall powershell${RESET_COL}"
# fi
# PWSHELL=${BASH_ALIASES[wps]}
#############################################################
# wps -Command '$PSVersionTable'
# PWSHELL=$(type wps | sed s/[\`\']//g | rev | cut -d ' ' -f1 | rev)
function check_CAMP_AC_ROOT {
  if [[ ! -d ${CAMP_AC_ROOT} ]]; then
    if ! exec_command_exists rlwrap; then
      aptS install rlwrap
    fi
    CAMP_AC_ROOT=$(rlwrap -S "Enter CAMP_AC_ROOT (directory must exist on disk.You can use auto-complete to navigate filesystem): " -c -o cat)
    if [[ -d $(dirname ${CAMP_AC_ROOT}) ]] && [[ ! -d ${CAMP_AC_ROOT} ]]; then
      local yn
      read -p "${CAMP_AC_ROOT} directory does not exist on disk. Do you want to create new one? (y/[n])" yn
      yn=${yn:0:1}
      [[ "X${yn,,}" = "Xy" ]] && mkdir ${CAMP_AC_ROOT}
    fi
    if [[ ! -d ${CAMP_AC_ROOT} ]]; then
      readEx "${CAMP_AC_ROOT} directory does not exist on disk. Define CAMP_AC_ROOT env variable and ensure that it points to an existing folder.Exit in " 10 " seconds."
      exit
    fi
    cacheEnvVar CAMP_AC_ROOT
  fi
}
check_CAMP_AC_ROOT
function installCygwin {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  pushd $CAMP_AC_ROOT/..
  download https://cygwin.com/setup-x86_64.exe
  # http://download.nus.edu.sg/mirror/cygwin/
  # http://mirror.terrahost.no/cygwin/
    local CYG_ROOT=$(getCmdValue "cygpath -w /") # e.g C:\cygwin64
  local mirrorUrl='http://mirror.terrahost.no/cygwin/'
  echo "Press 'f' to [f]ind out [f]astest mirror.It will take about 1 min. ([d]/f)?"
  readEx "Using default mirror ${mirrorUrl} in " 5 " seconds."
  [ $? -ne 0 ] && response='d'
  response=${response:0:1}
  if [[ "X${response,,}" = "Xf" ]] ;  then
    pushd . > /dev/null
    2envsetup
    python utils.py cygmirror 2>$TMP/fastestmirror.log
    if ! exec_command_exists rlwrap; then
      aptS install rlwrap
    fi
    cat $TMP/fastestmirror.log | grep "://" | sort -u -k 1 | rev | awk '{print $1}' | rev > $TMP/fastestmirror.log.tmp
    local mvCmd="$(which mv) -f "
    ${mvCmd} $TMP/fastestmirror.log.tmp $TMP/fastestmirror.log
    cat $TMP/fastestmirror.log
    local url
    if exec_command_exists rlwrap; then
      url=$(rlwrap -S "Enter mirror URL: " -H $TMP/fastestmirror.log -P $(head -n 1 $TMP/fastestmirror.log) -o cat)
    else
      read -p "Enter mirror URL[${fastest}]: " url
    fi
    [[ ! -z ${url} ]] && { local u=${url##*:\/\/}; u=${u%%/*}; isHostAlive $u; } && echo "Using URL ${url}" && mirrorUrl=${url}
    popd > /dev/null
  fi
  [[ ${mirrorUrl:(-1)} != '/' ]] && mirrorUrl="${mirrorUrl}/"
  echo "${GREEN_COL}INFO:${RESET_COL} Using mirror ${YELLOW_COL}${mirrorUrl}${RESET_COL}"
  echo "Invoking Command line..."
  echo "${YELLOW_COL}setup-x86_64.exe -g -f -v -q -s "${mirrorUrl}cygwin/"  -R '${CYG_ROOT}' -l '${CYG_ROOT}\\repo' -C Admin -C Base -C Net -C Utils -p wget -x nss${RESET_COL}"
  echo "Once the cygwin setup is complete use following command to fetch copy of .bashrc file"
  echo "${YELLOW_COL}cp '${TEAM_SHARE_LOCATION}.bashrc' '${CYG_ROOT}\\home\\$(whoami)\\.bashrc'${RESET_COL}"
  _CONTAINS -h "$@" || _CONTAINS -v "$@" && popd > /dev/null 2>&1 && return
  readEx "Process Ctrl+C to abort Or the script will go ahead and continue with setup in ... " 10 " seconds"
  ATTACH_TO_TERMINAL=0 launch ./setup-x86_64.exe -g -f -v -q -s "${mirrorUrl}cygwin/"  -R "${CYG_ROOT}" -l "${CYG_ROOT}\\repo" -C Admin -C Base -C Net -C Utils -p wget -x nss
  popd > /dev/null 2>&1
  readEx "Press any key to retain this terminal prompt... Else this terminal will Exit in " 5 " seconds."
  [[ $? -ne 0 ]] && exit
  # cp '${TEAM_SHARE_LOCATION}.bashrc' c:\cygwin64\home\$(whoami)\.bashrc
}
function sw2 {
  local MOUNT_ROOT
  local drv=${1,,}
  drv=${drv:0:1}
  isCygwin && [[ -d /cygdrive/${drv} ]] && MOUNT_ROOT=${MOUNT_ROOT:="/cygdrive/${drv}/"}
  [[ -d /mnt/${drv} ]] && MOUNT_ROOT=${MOUNT_ROOT:="/mnt/${drv}/"}
  [[ ! -d $MOUNT_ROOT ]] && { echo "${RED_COL}ALERT:${RESET_COL}  Switch error ${MOUNT_ROOT}." | STDERR || return $(errno ENOENT | tee /dev/tty | cut -d ' ' -f2) ; }
  local newRoot=$(echo ${CAMP_AC_ROOT} | sed -r "s,^/[[:alnum:]]+/[a-z]{1}/(.*),${MOUNT_ROOT}\1,");
  if [[ -d ${newRoot} ]] ; then
    echo "Switch to $1";
    local iRc
    pushd $(echo $PWD | sed -r "s,^/[[:alnum:]]+/[a-z]{1}/(.*),${MOUNT_ROOT}\1,") || pushd ${newRoot}
    iRc=$?
    [[ $iRc != 0 ]] && return $iRc
    [[ ! -e $newRoot/../acc-dev ]] && ln -s $CAMP_AC_ROOT/../acc-dev $newRoot/../acc-dev
    local old_NL_DBG_BIN_DIR=${NL_DBG_BIN_DIR};
    if isCygwin; then
      NL_DBG_BIN_DIR=${CAMP_AC_ROOT}/nl/build/nlserver/Debug
    else
      NL_DBG_BIN_DIR=${CAMP_AC_ROOT}/nl/build/nlserver
    fi
    export PATH=${PATH//:$old_NL_DBG_BIN_DIR:/:$NL_DBG_BIN_DIR:}
    export CAMP_AC_ROOT=${newRoot}
  else
    echo "${RED_COL}ALERT:${RESET_COL}  Switch error New Campaign Root ${YELLOW_COL}${newRoot}${RESET_COL} does not exist...Creating new directory " | STDERR
    mkdir -p ${newRoot}
    return $(errno ENOENT | tee /dev/tty | cut -d ' ' -f2)
  fi
}
function is32 {
    local iRc=0
    for f in "$@"; do
        local wfile=$(native "$(readlink.exe -f $f)")
        if isCygwin && ! exec_command_exists file ; then
            # Hex : 50 45 00 00 4c 01 == 'PE..L.' == 32 bit.
            # Hex : 50 45 00 00 86 64 == 'PE..d†' == 64 bit.
            local isWin32_Cmd="% { Get-Content \"$wfile\" -TotalCount 50 | Select-String -CaseSensitive -Pattern \"PE\\W{2}L\"  -Quiet } | % { Write-Output \"$wfile is 32 bit binary: \$_ \" }"
            wps -Command "$isWin32_Cmd"
            iRc=$?
        elif exec_command_exists file; then
            file $(ustyle ${f})
            iRc=$?
        else
            iRc=$(errno ENOTSUP | tee /dev/tty |cut -d ' ' -f2)
            break
        fi
    done
    return $iRc
}
function getCampRoot { echo $CAMP_AC_ROOT; }
if isCygwin; then
  NL_DBG_BIN_DIR=${CAMP_AC_ROOT}/nl/build/nlserver/Debug
  ACC_WEB_UI=${CAMP_AC_ROOT}/../acc-web-ui
else
  NL_DBG_BIN_DIR=${CAMP_AC_ROOT}/nl/build/nlserver
fi
export PATH="$PATH:${NL_DBG_BIN_DIR}"
function ascii {
  if [ $# -eq 0 ]; then
    echo "${YELLOW_COL}Usage${RESET_COL}: ${FUNCNAME[0]} <input-character-string> [-[a(ll) | b(binary) n(ibble) | [d|l|i](nteger) | o(ctal) | [x|h](ex)]]"
    echo -ne "\t To print special chars like tab e.t.c "
    echo ${YELLOW_COL}'var="$(echo -e " \t\f\r\n ")"; ascii "$var" -a'{RESET_COL}
    return
  fi
  local c
  local idx=0
  local inpS="${1}"
  shift
  if [ $# -gt 0 ]; then
    if _CONTAINS -h "$@" || _CONTAINS -x "$@"; then
      printf "hex:"
      for (( idx=0; idx<${#inpS}; idx++ )); do
        c="${inpS:${idx}:1}"
        printf " %.2x" "'$c"
      done
    elif _CONTAINS -i "$@" || _CONTAINS -l "$@" || _CONTAINS -d "$@"; then
      printf "int:"
      for (( idx=0; idx<${#inpS}; idx++ )); do
        c="${inpS:${idx}:1}"
        printf " %d" "'$c"
      done
    elif _CONTAINS -o "$@" ; then
      printf "oct:"
      for (( idx=0; idx<${#inpS}; idx++ )); do
        c="${inpS:${idx}:1}"
        printf " %.3o" "'$c"
      done
    elif _CONTAINS -b "$@" || _CONTAINS -n "$@" ; then
      if ! exec_command_exists bc; then
        aptS install bc
      fi
      if ! exec_command_exists bc; then
        echo "${RED_COL}ALERT:${RESET_COL}  ${FUNCNAME[0]} ${YELLOW_COL}}bc${RESET_COL} command not found."
        return 1
      fi
      printf "bit:"
      local binary
      local padding
      local iVal
      for (( idx=0; idx<${#inpS}; idx++ )); do
        c="${inpS:${idx}:1}"
        iVal=$(printf " %d" "'$c")
        binary=$(echo -e "obase=2\n${iVal}" | bc)
        padding=$(head -c $(expr 8 - ${#binary}) < /dev/zero | tr '\0' '0')
        binary=${padding}${binary}
        _CONTAINS -n "$@" && binary="$(echo ${binary} | sed -r 's/(.{4})/\1 /')"
        printf " ${binary}"
      done
    else
      if ! exec_command_exists bc; then
        aptS install bc
      fi
      if ! exec_command_exists bc; then
        echo "${RED_COL}ALERT:${RESET_COL}  ${FUNCNAME[0]} ${YELLOW_COL}}bc${RESET_COL} command not found."
        return 1
      fi
      local binary
      local padding
      for (( idx=0; idx<${#inpS}; idx++ )); do
        c="${inpS:${idx}:1}"
        iVal=$(printf " %d" "'$c")
        binary=$(echo -e "obase=2\n${iVal}" | bc)
        padding=$(head -c $(expr 8 - ${#binary}) < /dev/zero | tr '\0' '0')
        binary=${padding}${binary}
        printf "'%c'\t0x%.2x\t%d\t\\%.3o\t${binary}\n" "${c}" "'${c}" "'${c}" "'${c}";
      done
    fi
  else
    for (( idx=0; idx<${#inpS}; idx++ )); do
      c="${inpS:${idx}:1}"
      printf "'%c'\t0x%.2x\t%d\n" "${c}" "'$c" "'$c";
    done
  fi
}
function isHostAlive {
  local l_host=${1%%:*}
  if [ -z "${l_host}" ]; then
    false
    return
  fi
  local h=${l_host%%.*}
  h=${h,,}
  [[ $h = 'localhost' || $l_host =~ ^127\.0\. || $h = "$(hostname)" ]] && true && return
  local PING_BIN
  if isCygwin; then
    PING_BIN=/usr/bin/ping
  else
    PING_BIN=ping
  fi
  if ! exec_command_exists ${PING_BIN}; then
      aptS install ping
  fi
  export PING_RTT=${PING_RTT:=1}
  # 8.8.8.8 is google DNS
  timeout ${PING_RTT} ping -c 1 -q 8.8.8.8 > /dev/null 2>&1;
  if [ $? -eq 0 ]; then
    # Once Confirmed that Internet is reachable try the actual host.
    timeout ${PING_RTT} ${PING_BIN} -c 1 -q ${l_host} > /dev/null 2>&1;
    if [ $? -eq 0 ]; then
      [[ ${PING_RTT} -gt 1 ]] && export PING_RTT=$[${PING_RTT}/2]
      true
      return
    fi
  fi
  [[ ${PING_RTT} -le 1 ]] && export PING_RTT=$[${PING_RTT}*2]
  false
}
function getUUID {
  exec_command_exists uuidgen && uuidgen && return 0
  exec_command_exists uuid && uuid && return 0
  isCygwin && [[ -z $1 ]] && ( aptS install util-linux  > /dev/null 2>&1 ) && getUUID noinstall && return $?
  ! isCygwin && [[ -z $1 ]] && ( aptS install uuid  > /dev/null 2>&1 ) && getUUID noinstall && return $?
  local uuid_12345678_1234_1234_abcd_0123456789ef=$(wps -Command '[guid]::NewGuid().Guid')
  [[ ! -z uuid_12345678_1234_1234_abcd_0123456789ef ]] && echo ${uuid_12345678_1234_1234_abcd_0123456789ef} && return 0
  echo "12345678-1234-1234-abcd-0123456789ef"
}
function isPortListening {
  [[ $# -eq 0 || $# -gt 2 || ${1,,}  =~ ^[-]+h.* ]] && echo "${YELLOW_COL}Usage${RESET_COL}: ${FUNCNAME[0]} <port> [host]" && return 0
  if ! exec_command_exists nc; then
     aptS install nc
    aptS install netcat
  fi
  if ! exec_command_exists nc; then
    echo "${RED_COL}ALERT:${RESET_COL}  ${FUNCNAME[0]} ${YELLOW_COL}nc${RESET_COL} command for port testing not found."
    false
    return 1
  fi
  local startPort=${TUNNEL_PORT:=54321}
  [[ $# -gt 0 ]] && [[ ${1} =~ ^([1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$ ]] && startPort=${1}
  local iRc=0
  local host=${2}
  [[ -z ${host} ]] && host=localhost
  nc -z -w 1 ${host} ${startPort} > /dev/null 2>&1
  iRc=$?
  [[ $iRc -eq 0 ]] && true && return
  false
}
function getNextAvailablePort {
  [[ $# -gt 2 || ${1,,}  =~ ^[-]+h.* ]] && echo "${YELLOW_COL}Usage${RESET_COL}: ${FUNCNAME[0]} <port> [host]" && return 0
  if ! exec_command_exists nc; then
    aptS install nc
    aptS install netcat
  fi
  if ! exec_command_exists nc; then
    echo "${RED_COL}ALERT:${RESET_COL}  ${FUNCNAME[0]} ${YELLOW_COL}nc${RESET_COL} command for port testing not found."
    return 1
  fi
  local startPort=${TUNNEL_PORT:=54321}
  [[ $# -gt 0 ]] && [[ ${1} =~ ^([1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$ ]] && startPort=${1}
  local iRc=0
  local host=${2}
  [[ -z ${host} ]] && host=localhost
  while [ true ]; do
    nc -z -w 1 ${host} ${startPort} > /dev/null 2>&1
    iRc=$?
    [[ ${iRc} -ne 0 ]] && break;
    startPort=$[${startPort}+1]
  done
  echo ${startPort}
}
function host2IPv4 {
  getent ahostsv4 $1 | grep DGRAM | head -n 1 | awk '{ print $1; }'
}
function getIP {
  local l__ip;
  [[ $# -eq 0 || "X${1,,}" = "X-vpn" ]] && [[ -n $_IP ]] && echo $_IP && return
  if [ $# -gt 0 -a "X${1,,}" = "X-pub" ]; then
    curl -s https://ipinfo.io/ip || curl https://ifconfig.me || curl https://ifconfig.me
    return $?
  fi
  if isCygwin; then
    if [ $# -gt 0 -a "X${1,,}" = "X-vpn" ]; then
      l__ip=$(wps -Command "\$i=(Get-NetAdapter | Where-Object { ( (\$_.InterfaceDescription -like 'PANGP*') -or (\$_.InterfaceDescription -like 'TAP*') ) -and (\$_.Status -eq 'Up')}).ifIndex; If (\$i -gt 0) { (Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex \$i).IPAddress } Else {''}")
    elif [ $# -gt 0 -a "X${1,,}" = "X-eth" ]; then
      l__ip=$(wps -Command "\$i=(Get-NetAdapter | Where-Object { (\$_.ifAlias -like 'Ethernet*') -and (\$_.InterfaceDescription -like '*Ethernet*') -and (\$_.InterfaceDescription -notlike '*Virtual*') -and (\$_.Status -eq 'Up') }).ifIndex; If (\$i -gt 0) { (Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex \$i).IPAddress } Else {''}")
    elif [ $# -gt 0 -a "X${1,,}" = "X-wifi" ]; then
      l__ip=$(wps -Command "\$i=(Get-NetAdapter | Where-Object { (\$_.ifAlias -like '*wi*fi*') -and (\$_.InterfaceDescription -notlike '*Virtual*') -and (\$_.Status -eq 'Up') }).ifIndex; If (\$i -gt 0) { (Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex \$i).IPAddress } Else {''}")
    elif [ $# -gt 0 -a "X${1,,}" = "X-host" -o "X${1,,}" = "X-wslhost" ]; then
      l__ip=$(wps -Command "(Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex  (Get-NetAdapter | Where-Object { \$_.Status -eq 'Up'} |  Sort-Object -Descending -Property { (Get-NetAdapterStatistics | Where InterfaceAlias -eq \$_.InterfaceAlias).SentBytes } | Select-Object -Index 0 ).ifIndex).IPv4Address")
    else
#      l__ip=$(wps  -Command "(Get-NetIPAddress -AddressFamily IPv4 -AddressState Preferred -PrefixOrigin Manual,Dhcp -InterfaceIndex (Get-NetAdapter | Where-Object { \$_.Status -eq 'Up' -and \$_.InterfaceDescription -notlike '*Hyper-V*' }).ifIndex |  Sort-Object -Property @{Expression = { \$ad=Get-NetAdapter -Name \$_.InterfaceAlias; if (\$ad.LinkSpeed.ToString().ToLower().Contains('gb')) { [uint64](\$ad.LinkSpeed.Split()[0]) * 1024 } Else { [uint64](\$ad.LinkSpeed.Split()[0]) } }} -Descending | Select-Object -Index 0).IPv4Address")
       l__ip=$(wps  -Command "(Get-NetIPAddress -AddressFamily IPv4 -AddressState Preferred -PrefixOrigin Manual,Dhcp -InterfaceIndex (Get-NetAdapter | Where-Object { \$_.Status -eq 'Up' -and \$_.InterfaceDescription -notlike '*Hyper-V*' }).ifIndex |  Sort-Object -Property @{Expression = { (Get-NetAdapter -Name \$_.InterfaceAlias).Speed; }} -Descending | Select-Object -Index 0).IPv4Address")
    fi
  else
    local l_ifName;
    if [ $# -gt 0 -a "X${1,,}" = "X-vpn" ]; then
      l_ifName=$(ip -o link show up | awk '{print $2}' | grep tun | sed 's,:.*,,')
      [[ ! -z ${l_ifName} ]] && l__ip=$(ip -4 -f inet -o addr show up ${l_ifName} |  awk '{print $4}' | sed 's,/.*,,')
    elif [ $# -gt 0 -a "X${1,,}" = "X-eth" ]; then
      l_ifName=$(ip -o link show up | awk '{print $2}' | grep eth | sed 's,:.*,,')
      [[ ! -z ${l_ifName} ]] && l__ip=$(ip -4 -f inet -o addr show up ${l_ifName} |  awk '{print $4}' | sed 's,/.*,,')
    elif [ $# -gt 0 -a "X${1,,}" = "X-host" -o "X${1,,}" = "X-wslhost" ]; then
      l_ifName=$(ip -o link show up | awk '{print $2}' | grep eth | sed 's,:.*,,')
      if [[ ! -z ${l_ifName} ]] ; then
        l__ip=$(ip -4 -f inet -o addr show up ${l_ifName} |  awk '{print $4}')
        local maskBits=$(echo ${l__ip} | sed -r 's,^.*/,,')
        l__ip=$(echo ${l__ip}  | sed 's,/.*,,')
        local l_ipBinary
        for i in $(echo ${l__ip} | sed 's,\., ,g'); do
          l_ipBinary=${l_ipBinary}$(echo "obase=2;$i" | bc | awk '{printf "%08.f", $0}')
        done
        local l_ipPadding=$(head -c $[32-1-${maskBits}] < /dev/zero | tr '\0' '0')1
        l_ipBinary=$(echo ${l_ipBinary} | sed -r "s,(.{${maskBits}}).*,\1${l_ipPadding},")
        l__ip=''
        for i in $(echo $l_ipBinary | sed -r 's,(.{8}),\1 ,g'); do
          l__ip="${l__ip}.$(echo "$((2#$i))")"
        done
        l__ip=$(echo ${l__ip} | sed -r 's,^\.+,,')
      fi
    else
      l__ip=$(hostname --all-ip-addresses | rev | awk '{print $1}'  | rev)
    fi
  fi
  [[ $# -eq 0 || "X${1,,}" = "X-vpn" ]] && export _IP=$(getCmdValue "echo ${l__ip}") && echo $_IP && return
  echo $(getCmdValue "echo ${l__ip}")
}
function getCampaignInstance {
  local numInstances=1
  if [ ! -z "${1}" ] ; then
    numInstances=$1
  fi
  [[ -d $(getCampRoot)/nl/build/ncs/conf/ ]] && find $(getCampRoot)/nl/build/ncs/conf/ -maxdepth 1 -iname "config-*.xml" -exec ls -1S "{}" + | grep -v default | head -${numInstances} | rev | cut -d '/' -f1 | rev | sed -r 's/^config-//g' | sed -E 's/\.xml$//g' | grep -E --color=never "[[:alnum:]]"
  return $?
}
alias getCampInstances='getCampaignInstance 10'
function getCampaignDatabase {
  local numInstances=1
  local iRc=1
  local instanceName='*'
  if [[ $1 =~ [1-9][0-9]? ]] ; then
    numInstances=$1
  elif [[ ! -z $1 ]]; then
    instanceName=$1
  fi
  for inst in $(find $(getCampRoot)/nl/build/ncs/conf -maxdepth 1 -iname "config-${instanceName}.xml" -exec ls -1S "{}" + | grep -v default | head -10); do
    local dbInfo=$(getXMLAttrVal dbcnx login $inst)
    [[ -z ${dbInfo} ]] && continue
    numInstances=$[${numInstances}-1]
    echo ${dbInfo##*:}
    iRc=$?
    [[ $numInstances -lt 1 ]] && break
  done
  return $iRc
}

function getBackupLocation {
    [[ $# -eq 0 ]]  &&  echo "${YELLOW_COL}Usage${RESET_COL}: ${FUNCNAME[0]} <file-prefix> [extension]" && return 0
    TEMP=${TEMP:='/tmp'}
    local prefix=$1
    [[ ! -z ${prefix} ]] && prefix="${prefix}-"
    which nlserver > /dev/null 2>&1
    [[ $? -eq 0 ]] && prefix=${prefix}$(nlserver config -version | awk -F "[()]" '{printf("%s_%s_",$2,$3);}' | tr -d ' ')
    prefix=$(trim ${prefix})
    local ext=$2
    [[ ! -z ${ext} ]] && ext=".${ext}"
    local caller=${FUNCNAME[1]}
    [[ ! -z ${caller} ]] && caller="_${caller}"
    [[ -f ${TEMP}/bkp ]] && rm -f ${TEMP}/bkp
    [[ -d ${TEMP}/bkp ]] || mkdir ${TEMP}/bkp
    echo ${TEMP}/bkp/${prefix}$(getCampaignInstance)${caller}_$(date '+%d%b%Y_%H_%M_%S_%s')${ext}
}
function findW {
  if [ $# -lt 1 -o $# -gt 5 ]; then
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [OPTION] <binary-file-name>
          -h,h,help,--help,?,/?      This help documentation.
          -i,--hint  <hint-expr>     String which can be used to uniquely identify path of executable.
          -u,--update                Update windows (user) path to include executable location for further searches.
          -v, --verbose              Print verbose messages during search.
          binary-file-name           Mandatory last argument.Name of the binary you want to locate.
          " | STDERR
  return 0
  fi
  local updateSysPath=0
  local __identifier=""
  local __exeFileName=""
  local verbose
  while test $# -gt 0
  do
    local larg=${1,,}
    case "$larg" in
      '' | '-h' | '--help' | '-?' | '/?')
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [OPTION] <binary-file-name>
          -h,--help,/?               This help documentation.
          -i,--hint  <hint-expr>     String which can be used to uniquely identify path of executable.
          -u,--update                Update windows (user) path to include executable location for further searches.
          -v, --verbose              Print verbose messages during search.
          binary-file-name           Mandatory last argument.Name of the binary you want to locate.
          " | STDERR
        return 0
    ;;
    -i|--hint)
      shift
      __identifier="$1"
    ;;
    -u|--update)
      updateSysPath=1
    ;;
    -v|--verbose)
      verbose=1
    ;;
    *)
      __exeFileName="$1"
    ;;
    esac
    shift
  done
  [[ -z $verbose ]] || echo "Finding $__exeFileName in $(getOS) path ..."
  local retVal="$(which ${__exeFileName} 2>/dev/null | grep -i "${__identifier}" )"
  if [ -n "$retVal" ]; then
    echo "$retVal"
    return 0
  fi
  if ! isCygwin; then
    return 1
  fi
  [[ -z $verbose ]] || echo "Finding $__exeFileName using windows where command ..."
  retVal="$(where ${__exeFileName} 2>/dev/null | grep -i "${__identifier}" )"
  if [ -n "$retVal" ]; then
    echo $(getCmdValue "cygpath -u \"$retVal\" | rev | cut -d '.' -f2- | rev")
    return 0
  fi
  local NthLine=1
  local iRc
  [[ -z $verbose ]] || echo "Finding $__exeFileName in windows ${PROGRAMFILES} folder."
  local l_locations iRc=1
  l_locations="$(where /R "${PROGRAMFILES}" ${__exeFileName} 2>/dev/null)" && iRc=0
  if [ $iRc -eq 0 ]; then
    retVal="$(echo "${l_locations%$'\r'}" | grep -i "${__identifier}" | sort -r | head -n $NthLine | tail -n 1)"
    if [ -n "${retVal}" ]; then
      local dirPath="$(dirname "$retVal")"
      if int2bool $updateSysPath; then
        wps -Command "[Environment]::SetEnvironmentVariable('Path', [System.Environment]::GetEnvironmentVariable('Path','Machine') + \";${dirPath}\\\", 'Machine')"
      fi
      echo "$(ustyle "${retVal}")"
      return 0
    fi
  fi
  [[ -z $verbose ]] || echo "Finding $__exeFileName in windows ${PROGRAMFILES} (x86) folder."
  if [ $iRc -eq 0 ]; then
    iRc=1
  fi
  l_locations="$(where /R "${PROGRAMFILES} (x86)" ${__exeFileName} 2>/dev/null)" && iRc=0
  if [ $iRc -eq 0 ]; then
    retVal="$(echo "${l_locations%$'\r'}" | grep -i "${__identifier}" | sort -r | head -n $NthLine | tail -n 1)"
    if [ -n "${retVal}" ]; then
      local dirPath="$(dirname "$retVal")"
      if int2bool $updateSysPath; then
        wps -Command "[Environment]::SetEnvironmentVariable('Path', [System.Environment]::GetEnvironmentVariable('Path','Machine') + \";${dirPath}\\\", 'Machine')"
      fi
      echo "$(ustyle "${retVal}")"
      return 0
    fi
  fi
  if [ $iRc -eq 0 ]; then
    iRc=1
  fi
  return $iRc
}
# https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-ver16
function mssql {
  if ! exec_command_exists sqlcmd; then
    if [ -n "$(findW -u sqlcmd)" ]; then
      readEx "Found sqlcmd and updated system path.Please restart ${OSTYPE}. Closing terminal in." 10 " seconds..."
      openTerm &
      exit
    else
      echo "sqlcmd client not found. Please install sqlcmd and ensure that it is available in PATH." | STDERR
      echo "A typical path for sqlcmd(on windows) when MSSQL sql server is installed on your machine is:" | STDERR
      echo "${YELLOW_COL}C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe${RESET_COL}" | STDWARN
      echo "You can also install it using: ${YELLOW_COL}wcinstall sqlcmd${RESET_COL}"
      return 2 # $(errno ENOENT | cut -d ' ' -f2)
    fi
  fi
  local l_dbHost
  [[ ${DB_SERVER} =~  ([^:]+)[:]?(.*) ]] && l_dbHost=${BASH_REMATCH[1]//[[:space:]]/}
  local posN=1
  local skipNextArg=0
  local showInfo=1
  local ADDITIONAL_SQL_QUERY_STR
  for i in "$@"; do
    if [ ${skipNextArg} != 0 ]; then
      skipNextArg=0
      continue
    fi
    case "${i}" in
      -S | -server | --host | -host )
        local posNext=$[${posN}+1]
        local _host="${!posNext}"
        export PGHOST=${_host:=${l_dbHost}}
        # remove  this argument and the one following it to be removed from arglist
        set -- "${@:1:posN-1}" "${@:posN+2}"
        skipNextArg=1
      ;;
      -p | --port | -port)
        local posNext=$[${posN}+1]
        local _port="${!posNext}"
        export PGPORT=${_port:=1433}
        set -- "${@:1:posN-1}" "${@:posN+2}"
        skipNextArg=1
      ;;
      -f | -i | -o )
        local opt='-i'
        [[ ${i} = '-o' ]] && opt='-o'
        local posNext=$[${posN}+1]
        local file="${!posNext}"
        file="$(native ${file})"
        set -- "${@:1:posN-1}" ${opt} ""${file}"" "${@:posN+2}"
        skipNextArg=1
        posN=$[${posN}+2]
      ;;
      --host=*)
        local _host=$(echo "${!posN}" | cut -d '=' -f2)
        export PGHOST=${_host:=${l_dbHost}}
        # remove  this argument removed from arglist
        set -- "${@:1:posN-1}" "${@:posN+1}"
      ;;
      -d | --dbname | -database | --database | -db | --db)
        local posNext=$[${posN}+1]
        local _db="${!posNext}"
        # if it not database name, but a connection string..pass it as is to psql.
        if [[ "${_db}" =~ =+ ]]; then
          posN=${posNext}
        else
          export PGDATABASE=${_db:=$(getCampaignDatabase)}
          set -- "${@:1:posN-1}" "${@:posN+2}"
          skipNextArg=1
        fi
      ;;
      --dbname=*)
        local _db=$(echo "${!posN}"| cut -d '=' -f2)
        # if it not database name, but a connection string..pass it as is to psql.
        if [[ "${_db}" =~ ^.+=.+$ ]]; then
          posN=$[${posN}+1]
        else
          export PGDATABASE=${_db:=$(getCampaignDatabase)}
          set -- "${@:1:posN-1}" "${@:posN+1}"
        fi
      ;;
      -U | -u | --username | -username | --user | -user)
        local posNext=$[${posN}+1]
        local _user="${!posNext}"
        export PGUSER=${_user:="sa")}
        set -- "${@:1:posN-1}" "${@:posN+2}"
        skipNextArg=1
      ;;
      --username=*)
        local _user=$(echo "${!posN}" | cut -d '=' -f2)
        export PGUSER=${_user:="sa")}
        set -- "${@:1:posN-1}" "${@:posN+1}"
      ;;
      -p | -P | --pass | -pass | --passwd | -passwd | --password | -password)
        local posNext=$[${posN}+1]
        local _passwd="${!posNext}"
        # if next argument is not a password, pass the argument as is to psql.
        if [[ "${_passwd}" =~ ^[[:space:]]*-+ ]]; then
          posN=${posNext}
        else
          export PGPASSWORD=${_passwd:=DEFAULT_PASSWORD)}
          set -- "${@:1:posN-1}" "${@:posN+2}"
          skipNextArg=1
        fi
      ;;
      --password=*)
        local _passwd=$(echo "${!posN}" | cut -d '=' -f2)
        export PGPASSWORD=${_passwd:=DEFAULT_PASSWORD)}
        set -- "${@:1:posN-1}" "${@:posN+1}"
      ;;
      -q | -Q | --Query | -query | -c | -C | -Command)
        local posNext=$[${posN}+1]
        local queryString="${ADDITIONAL_SQL_QUERY_STR}${!posNext}"
        set -- "${@:1:posN-1}" -Q "${queryString}" "${@:posN+2}"
        posN=${posNext}
        showInfo=0
        skipNextArg=1
      ;;
      -t | --no-headers | -raw | --raw | -data | --data-only)
        set -- "${@:1:posN-1}" -h "${@:posN+1}"
        set -- "${@:1:posN}" -1 -s '|' "${@:posN+1}"
        posN=$[${posN}+4]
        ADDITIONAL_SQL_QUERY_STR="SET NOCOUNT ON; "
        showInfo=0
      ;;
      -exp*)
        ADDITIONAL_SQL_QUERY_STR="EXPLAIN FORMAT=TREE  "
        set -- "${@:1:posN-1}" "${@:posN+1}"
        showInfo=0
      ;;
      -time* | --time*)
        ADDITIONAL_SQL_QUERY_STR="SET STATISTICS TIME ON; "
        set -- "${@:1:posN-1}" "${@:posN+1}"
        showInfo=0
        posN=$[${posN}+1]
      ;;
      *)
#        local args_with_out_quote="${!posN}"
#        if [[ "${args_with_out_quote}" =~ [[:space:]]+ ]]; then
          # set -- "${@:1:posN-1}" "\"${args_with_out_quote}\"" "${@:posN+1}"
#        fi
        showInfo=0
        posN=$[${posN}+1]
      ;;
    esac
  done
#  echo $@
  export PGHOST=${PGHOST:=${l_dbHost}}
  export PGDATABASE=${PGDATABASE:=$(getCampaignDatabase)}
  export PGDATABASE=${PGDATABASE:="master"}
  export PGUSER=${PGUSER:="sa"}
  export PGPASSWORD=${PGPASSWORD:=${DEFAULT_PASSWORD}}
  local __serverInstance __database __user __password
  [[ ! -z ${PGHOST} ]]     && __serverInstance="-S ${PGHOST}"
  # https://www.mssqltips.com/sqlservertip/5133/different-ways-to-connect-to-sql-server-using-sqlcmd/
  [[ ! -z ${PORT} ]]      && __serverInstance="-S tcp:${PGHOST},${PORT} "
  [[ ! -z ${PGDATABASE} ]]   && __database="-d ${PGDATABASE}"
  [[ ! -z ${PGUSER} ]]     && __user="-U ${PGUSER}"
  [[ ! -z ${PGUSER} ]]     && [[ ! -z ${PGPASSWORD} ]]   && __password="-P ${PGPASSWORD}"
  local iRc=0
  if [[ "$@" =~ "-V" ]]; then
    local mssqlclientVersion="$(getCmdValue 'sqlcmd -? | grep Version')"
    iRc=$?
    echo "${GREEN_COL}INFO:${RESET_COL} Using MSSQL client: ${mssqlclientVersion} for connecting to database on SQL Server ${YELLOW_COL}${PGHOST}:${PGPORT:=1433}${RESET_COL}" | STDINFO
    if [ ${iRc} -eq 0 ]; then
      [[ ! -z ${PGHOST} ]] || { echo "${RED_COL}ALERT:${RESET_COL} No Database host specified" | STDERR || iRc=3; }
      isHostAlive ${PGHOST} || { echo "${RED_COL}ALERT:${RESET_COL} Database ${YELLOW_COL}${PGHOST}${RESET_COL} seems down." | STDERR || iRc=4; }
      if [[ ${iRc} -eq 0 ]]; then
        local wait_time=$(date '+%s')
        local defaultdb=${PGDATABASE:='master'}
        local mssqlServerVersion=$(sqlcmd ${__serverInstance} -d ${defaultdb} ${__user} ${__password} -W -Q "SELECT SERVERPROPERTY('productversion')" | grep -E '^[.[:digit:]]+')
        mssqlServerVersion=$(getCmdValue "echo ${mssqlServerVersion}")
        if [[ -z ${mssqlServerVersion} ]]; then
          iRc=5
        else
          wait_time=$[$(date '+%s')-${wait_time}]
          [[ ${wait_time} -gt 3 ]] && echo "${YELLOW_COL}WARN:${RESET_COL} Your DB connection is slow...it took ${wait_time} seconds to connect to it" | STDWARN
          echo ${mssqlServerVersion}
        fi
      fi
    fi
    [[ $iRc -ne 0 ]] && unset PGHOST PGDATABASE PGUSER PGPORT
    return ${iRc}
  fi
  if [[ ${showInfo} -ne 0 ]]; then
    echo "${GREEN_COL}INFO:${RESET_COL} Using ${YELLOW_COL}SQL Server=(${__serverInstance}), Database=(${__database}), User=(${__user})${RESET_COL}" | STDINFO
  fi
  sqlcmd ${__serverInstance} ${__database} ${__user} ${__password} "$@"
  return $?
}
# https://www.postgresql.org/docs/current/app-psql.html
function pgsql {
  if ! exec_command_exists psql; then
    if [ -n "$(findW -u psql)" ]; then
      readEx "Found psql and updated system path.Please restart ${OSTYPE}. Closing terminal in." 10 " seconds..."
      openTerm &
      exit
    else
      echo "psql client not found. Please install and ensure that it is available in PATH." | STDERR
      echo "A typical path for psql(on windows) when postgres sql server is installed on your machine is:" | STDERR
      echo "${YELLOW_COL}C:\Program Files\PostgreSQL\9.4\bin\psql.exe${RESET_COL}" | STDWARN
      return $(errno ENOENT | cut -d ' ' -f2)
    fi
  fi
  local l_dbHost
  [[ ${DB_SERVER} =~  ([^:]+)[:]?(.*) ]] && l_dbHost=${BASH_REMATCH[1]//[[:space:]]/}
  local posN=1
  local skipNextArg=0
  local showInfo=1
  for i in "$@"; do
    if [ ${skipNextArg} != 0 ]; then
      skipNextArg=0
      continue
    fi
    case "$i" in
      -h | --host | -host)
        local posNext=$[${posN}+1]
        local pg_host="${!posNext}"
        export PGHOST=${pg_host:=${l_dbHost}}
        set -- "${@:1:posN-1}" "${@:posN+2}"
        skipNextArg=1
      ;;
      -p | --port | -port)
        local posNext=$[${posN}+1]
        local pg_port="${!posNext}"
        export PGPORT=${pg_port:=5432}
        set -- "${@:1:posN-1}" "${@:posN+2}"
        skipNextArg=1
      ;;
      -f | -i | -o )
        local opt='-f'
        [[ ${i} = '-o' ]] && opt='-o'
        local posNext=$[${posN}+1]
        local file="${!posNext}"
        file="$(ustyle ${file})"
        set -- "${@:1:posN-1}" ${opt} "${file}" "${@:posN+2}"
        skipNextArg=1
        posN=$[${posN}+2]
      ;;
      --host=*)
        local pg_host=$(echo "${!posN}" | cut -d '=' -f2)
        export PGHOST=${pg_host:=${l_dbHost}}
        set -- "${@:1:posN-1}" "${@:posN+1}"
      ;;
      -d | --dbname | -database | --database | -db | --db)
        local posNext=$[${posN}+1]
        local pg_db="${!posNext}"
        # if it not database name, but a connection string..pass it as is to psql.
        if [[ "${pg_db}" =~ =+ ]]; then
          posN=${posNext}
        else
          export PGDATABASE=${pg_db:=$(getCampaignDatabase)}
          set -- "${@:1:posN-1}" "${@:posN+2}"
          skipNextArg=1
        fi
      ;;
      --dbname=*)
        local pg_db=$(echo "${!posN}"| cut -d '=' -f2)
        # if it not database name, but a connection string..pass it as is to psql.
        if [[ "${pg_db}" =~ ^.+=.+$ ]]; then
          posN=$[${posN}+1]
        else
          export PGDATABASE=${pg_db:=$(getCampaignDatabase)}
          set -- "${@:1:posN-1}" "${@:posN+1}"
        fi
      ;;
      -U | -u | --username | -username | --user | -user)
        local posNext=$[${posN}+1]
        local pg_user="${!posNext}"
        export PGUSER=${pg_user:="postgres")}
        set -- "${@:1:posN-1}" "${@:posN+2}"
        skipNextArg=1
      ;;
      --username=*)
        local pg_user=$(echo "${!posN}" | cut -d '=' -f2)
        export PGUSER=${pg_user:="postgres")}
        set -- "${@:1:posN-1}" "${@:posN+1}"
      ;;
      -w | -W | --pass | -pass | --passwd | -passwd | --password | -password)
        local posNext=$[${posN}+1]
        local pg_passwd="${!posNext}"
        # if next argument is not a password, pass the argument as is to psql.
        if [[ "${pg_passwd}" =~ ^[[:space:]]*-+ ]]; then
          posN=${posNext}
        else
          export PGPASSWORD=${pg_passwd:=DEFAULT_PASSWORD)}
          set -- "${@:1:posN-1}" "${@:posN+2}"
          skipNextArg=1
        fi
      ;;
      --password=*)
        local pg_passwd=$(echo "${!posN}" | cut -d '=' -f2)
        export PGPASSWORD=${pg_passwd:=DEFAULT_PASSWORD)}
        set -- "${@:1:posN-1}" "${@:posN+1}"
      ;;
      -q | -Q | --Query | -query | -c | -C | -Command)
        local posNext=$[${posN}+1]
        local queryString="${ADDITIONAL_SQL_QUERY_STR}${!posNext}"
        set -- "${@:1:posN-1}" "-c" "\"${queryString}\"" "${@:posN+2}"
        posN=$[${posNext}+1]
        showInfo=0
        skipNextArg=1
      ;;
      -t | --no-headers | -raw | --raw | -data | --data-only)
        set -- "${@:1:posN-1}" -t "${@:posN+1}"
        posN=$[${posN}+1]
        showInfo=0
      ;;
      -exp*)
        ADDITIONAL_SQL_QUERY_STR="EXPLAIN ANALYZE  "
        set -- "${@:1:posN-1}" "${@:posN+1}"
        showInfo=0
      ;;
      -time* | --time*)
        set -- "${@:1:posN-1}" -c '\timing' "${@:posN+1}"
        posN=$[${posN}+2]
        showInfo=0
      ;;
      *)
#        local args_with_out_quote="${!posN}"
#        if [[ "${args_with_out_quote}" =~ [[:space:]]+ ]]; then
          # set -- "${@:1:posN-1}" "\"${args_with_out_quote}\"" "${@:posN+1}"
#        fi
        showInfo=0
        posN=$[${posN}+1]
      ;;
    esac
  done
  export PGHOST=${PGHOST:=${l_dbHost}}
  export PGDATABASE=${PGDATABASE:=$(getCampaignDatabase)}
  export PGDATABASE=${PGDATABASE:="postgres"}
  export PGUSER=${PGUSER:="postgres"}
  export PGPASSWORD=${PGPASSWORD:=${DEFAULT_PASSWORD}}
#  export PGPORT=${PGPORT:=5432}
  local iRc=0
  if [[ "$@" =~ "-V" ]]; then
    local psqlclientVersion="$(getCmdValue "psql -V")"
    iRc=$?
    echo "${GREEN_COL}INFO:${RESET_COL} Using postgres client: ${psqlclientVersion} for connecting to database on ${YELLOW_COL}${PGHOST}:${PGPORT:=5432}${RESET_COL}" | STDINFO
    if [ ${iRc} -eq 0 ]; then
      [[ ! -z ${PGHOST} ]]  || { echo "${RED_COL}ALERT:${RESET_COL} No Database host specified" | STDERR || iRc=3; }
      isHostAlive ${PGHOST} || { echo "${RED_COL}ALERT:${RESET_COL} Database ${YELLOW_COL}${PGHOST}${RESET_COL} seems down." | STDERR || iRc=4; }
      if [[ ${iRc} -eq 0 ]]; then
        local wait_time=$(date '+%s')
        local defaultdb=${PGDATABASE:='template1'}
        local pgServerVersion=$(psql -Atq --pset=pager=off -d "dbname=${defaultdb} connect_timeout=10" -c 'SELECT version();' 2>&1 | grep -i --color=never postgres)
        if [[ -z ${pgServerVersion} ]]; then
          iRc=5
        else
          wait_time=$[$(date '+%s')-${wait_time}]
          [[ ${wait_time} -gt 3 ]] && echo "${YELLOW_COL}WARN:${RESET_COL} Your DB connection is slow...it took ${wait_time} seconds to connect to it" | STDWARN
          echo ${pgServerVersion}
        fi
      fi
    fi
    [[ $iRc -ne 0 ]] && unset PGHOST PGDATABASE PGUSER PGPORT
    return ${iRc}
  fi
  if [[ ${showInfo} -ne 0 ]]; then
    echo "${GREEN_COL}INFO:${RESET_COL} Using ${YELLOW_COL}Host(-h)=${PGHOST}, Port(-p)=${PGPORT}, Database(-d)=${PGDATABASE}, User(-U)=${PGUSER}${RESET_COL}" | STDINFO
    echo "${GREEN_COL}INFO:${RESET_COL} Use ${YELLOW_COL}double quotes(\" \")${RESET_COL} to enclose query strings passed on command line.Any ${YELLOW_COL}single quotes(')${RESET_COL} which are part of the SQL are allowed within those ${YELLOW_COL}double quotes(\" \")${RESET_COL}${RESET_COL}.${RESET_COL}" | STDINFO
  fi
  eval "psql $@"
  return $?
}

function sfsql {
  exec_command_exists snowsql || { echo "${RED_COL}ALERT:${RESET_COL} snowsql does not exists. Please use ${YELLOW_COL}wcinstall snowflake${RESET_COL} or ${YELLOW_COL}installSnowflakeClient${RESET_COL} to install it"; return 1; }
  _CONTAINS -h "$@" || [[ $# -eq 0 ]] && { echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <snow-flake-vault-name e.g sf_tractorsupply_prod2_mkt> [snowSQL options]"; return 1; }
  _CONTAINS -v "$@" && snowsql -v && return 0
  _CONTAINS -? "$@" || _CONTAINS --help "$@" && { snowsql --help; return 2; }
  local VAULT_LDAP
  isCygwin || VAULT_LDAP=1
  getVaultCreds -s $1 > ${FUNCNAME[0]}_vcreds.txt
  shift
  local sf_user=$(cat ${FUNCNAME[0]}_vcreds.txt | grep -E -i '^User' | awk '{print $2;}')
  local sf_password=$(cat ${FUNCNAME[0]}_vcreds.txt| grep -E -i '^Pass' | awk '{print $2;}')
  local sf_url=$(cat ${FUNCNAME[0]}_vcreds.txt | grep -E -i '^URL' | awk '{print $2;}')
  rm -f ${FUNCNAME[0]}_vcreds.txt
  sf_url=${sf_url#*:\/\/}
  local sf_account=${sf_url%%.*}
  echo "Connecting to snowFlake account: ${YELLOW_COL}${sf_account}${RESET_COL} with user: ${YELLOW_COL}${sf_user}${RESET_COL} ..."
  SNOWSQL_PWD=${sf_password} snowsql -a ${sf_account} -u ${sf_user} "$@"
  return $?
}

function long_pending_queries_2 {
  local iRc
  type _CONTAINS > /dev/null 2>&1
  iRc=$?
  [[ $iRc -eq 0 ]] && _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [n -- max number-of-queries] [-h -- help] [-d -- detailed info] " && return 1
  local tmp_file=query_out.txt
  local q_Info='mean_exec_time, query' count=5
  export DBMS_VERSION=${DBMS_VERSION:="$(pgsql -Atq -c 'select version()')"}
  local majVer=${DBMS_VERSION%%,*}
  majVer=${majVer#* }
  majVer=${majVer%%.*}
  [[ $iRc -eq 0 ]] && _CONTAINS -d "$@" && q_Info='mean_exec_time, total_exec_time, min_exec_time, max_exec_time, calls, rows, query'
  [[ $majVer -le 12 ]] && q_Info=${q_Info//_exec_/_}
  [[ $# -ne 0 ]] && [[ $1 =~ [1-9] ]] && count=$1
  pgsql -o ${tmp_file} -c "SELECT ${q_Info} FROM pg_stat_statements ORDER BY $(cut -d, -f1 <<< ${q_Info}) DESC LIMIT ${count}"
  iRc=$?
  [[ $iRc -ne 0 ]] && pgsql -c 'CREATE EXTENSION IF NOT EXISTS pg_stat_statements' && pgsql -o ${tmp_file} -c "SELECT ${q_Info} FROM pg_stat_statements ORDER BY $(cut -d, -f1 <<< ${q_Info}) DESC LIMIT ${count}"
  [[ $iRc -ne 0 ]] && return $iRc
  local outf="/tmp/long_pending_queries_$(date '+%d%b%Y_%H_%M_%S_%s_%z').txt"
  cat ${tmp_file} | tee -a ${outf} && rm -f ${tmp_file}
  echo "${GREEN_COL}INFO:${RESET_COL}Output to ${YELLOW_COL}${outf}${RESET_COL} @ $(date -u '+%d%b%Y_%H_%M_%S_%s_%z')"
  echo "Database Server time: $(pgsql -Atq -c 'select now()')"
}

function long_pending_queries {
  local count=5 tmp_file="query_out.txt" iRc
  [[ $# -ne 0 ]] && [[ $1 =~ [1-9] ]] && count=$1
  local duration='(now() - pg_stat_activity.query_start)'
  pgsql -o ${tmp_file} -c "SELECT ${duration} As Duration, query As Query
  FROM pg_stat_activity
  where ${duration} > interval '5 minutes' and state='active'
  ORDER BY duration DESC LIMIT ${count}"
  iRc=$?
  [[ $iRc -ne 0 ]] && return $iRc
  local outf="/tmp/long_pending_queries_$(date '+%d%b%Y_%H_%M_%S_%s_%z').txt"
  cat ${tmp_file} | tee -a ${outf} && rm -f ${tmp_file}
  echo "${GREEN_COL}INFO:${RESET_COL}Output to ${YELLOW_COL}${outf}${RESET_COL} @ $(date -u '+%d%b%Y_%H_%M_%S_%s_%z')"
  echo "Database Server time: $(pgsql -Atq -c 'select now()')"
}

# \pset pager off   # Pager usage is off.
# \a                # Output format is unaligned.
# \pset tuples_only # Showing only tuples.
export PGCLIENTENCODING=UTF8
export DEFAULT_PASSWORD=${DEFAULT_PASSWORD:='123456'}
# tries to guess the database type from DB_SERVER
function getDatabaseType {
# _TS ${FUNCNAME[0]}
  local l_host l_port dbType dbkey
  if [[ -z ${DB_SERVER} ]]; then
    export DB_SERVER=$(hostname --fqdn)
    dbkey='DB_SERVER|'
  fi
  [[ ${DB_SERVER} =~ ([^:]+)[:]?(.*) ]] && l_host=${BASH_REMATCH[1]//[[:space:]]/} && l_port=${BASH_REMATCH[2]//[[:space:]]/}
  unset DBMS_TYPE
# _TE ${FUNCNAME[0]} $LINENO
  isHostAlive ${l_host} || return $?
  unset PGHOST PGPORT
#  _TE ${FUNCNAME[0]} $LINENO
  local l_curDB=${PGDATABASE}
  if [[ -z ${l_port} ]]; then
    [[ -z ${dbType} ]]  && isPortListening 5432 ${l_host} &&  export PGDATABASE=postgres && DBMS_VERSION="$(pgsql -host ${l_host} -V)"  && dbType="PostgreSQL" && PGHOST=${l_host}
    [[ -z ${dbType} ]]  && isPortListening 1433 ${l_host} &&  export PGDATABASE=master && DBMS_VERSION="$(mssql -host ${l_host} -V)"  && dbType="MSSQL" && PGHOST=${l_host}
  else
    [[ -z ${dbType} ]] &&  isPortListening ${l_port} ${l_host}  && export PGDATABASE=postgres &&  DBMS_VERSION="$(pgsql --host ${l_host} -p ${l_port} -V)" && dbType="PostgreSQL" && PGHOST=${l_host} && PGPORT=${l_port}
    [[ -z ${dbType} ]] &&  isPortListening ${l_port} ${l_host}  &&  export PGDATABASE=master && DBMS_VERSION="$(mssql --host ${l_host} -p ${l_port} -V)" && dbType="MSSQL" && PGHOST=${l_host}  && PGPORT=${l_port}
  fi
#  _TE ${FUNCNAME[0]} $LINENO
  export PGDATABASE=${l_curDB}
  [[ -z ${dbType} ]] && return 1
  unset PGUSER # let calls from respective sql clients decide on default user to use.
  export DBMS_TYPE=${dbType}
  export DBMS_VERSION="$(trim $(echo "${DBMS_VERSION}"))"
  sed -r -i "/${dbkey}DBMS_VERSION|DBMS_TYPE|PGPORT|PGHOST/d" ~/.before.sh
  cacheEnvVar -a DBMS_VERSION DBMS_TYPE PGPORT PGHOST ${dbkey/|/}
#  _TE ${FUNCNAME[0]} $LINENO
}
function redir2WSLHost {
  local openTermCmd="$@"
  ssh -4 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $(whoami)@$(getIP -wslhost) "\${PWSHELL} -Command \"Start-Process \${PWSHELL} -ArgumentList \\\"-Command ${openTermCmd}\\\"  -Verb RunAs\""
}
function redir2CygwinOnWSLHost {
  ssh -4 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $(whoami)@$(getIP -wslhost) "$@"
}
function launch {
  function __delay { [[ -z ${DELAY_LAUNCH} ]] || sleep ${DELAY_LAUNCH}; }
  function __report {
    [[ $? -eq 0 ]] && status="${GREEN_COL}Success${RESET_COL}"
    local status=${status:="${RED_COL}${BOLD}Failures${RESET_COL}"}
    local startTimeVar="LAST_LAUNCH_PID_${BASHPID}"
    cacheEnvVar -r ${startTimeVar}
    echo "$@ Reported ${status}..Took $[$(date '+%s')-${!startTimeVar}] seconds"
    cacheEnvVar -f -c ${startTimeVar}
  }
  if [[ "$(sed 's/.*/\U&/' <<< X${ATTACH_TO_TERMINAL:0:1})" =~ X[Y1T] ]]; then
    ({ __delay; "$@" ; __report "$@"; } & cacheEnvVar LAST_LAUNCH_PID_$! $(date '+%s'))
  elif isCygwin; then
    ({ __delay; cygstart "$@"; } &)
  else
    ({ __delay; nohup "$@"; __report "$@"; } & cacheEnvVar LAST_LAUNCH_PID_$! $(date '+%s'))
  fi
  # unset -f __delay __report
}
function jumpBox {
  local balabit_ShellControlBoxes
  readarray -td' ' balabit_ShellControlBoxes <<< 'scb.dmz.mai1.adobe.net scb.dmz.or1.adobe.net scb.dmz.ut1.adobe.net scb.global.adobe.net'
  # declare -p balabit_ShellControlBoxes
  local idx=$1
  [[ ! $1 -gt 0 ]] && idx=0
#  local attempt=${#balabit_ShellControlBoxes[@]}
#  while [ $attempt -ne 0 ]
  while [ true ]
  do
    if isHostAlive ${balabit_ShellControlBoxes[${idx}]}; then
      local __JUMPHOST='jh-euc1.camp-infra.adobe.net'
      [[ ! -z ${ADB_DATACENTER_JUMPHOST} ]] && __JUMPHOST='campaign-jumpbox-fra5.adobe.net'
# ssh -tt -A hparmar@jh-euc1.camp-infra.adobe.net@scb.dmz.ut1.adobe.net ssh hparmar@handm-mkt-prod2.campaign.adobe.com
      echo "${__JUMPHOST}@${balabit_ShellControlBoxes[${idx}]}"
      return 0
    else
      unset 'balabit_ShellControlBoxes[idx]'
      balabit_ShellControlBoxes=("${balabit_ShellControlBoxes[@]}")
      if [[ ${#balabit_ShellControlBoxes[@]} -eq 0 ]]; then
        echo "No jumphost available/reachable." | STDERR
        return 1
      fi
      idx=$(expr $RANDOM % ${#balabit_ShellControlBoxes[@]})
      # local deleteme=${balabit_ShellControlBoxes[${idx}]}
      # balabit_ShellControlBoxes=( "${balabit_ShellControlBoxes[@]/$deleteme}" )
      # local remainingJumpHosts="$(echo "${balabit_ShellControlBoxes[@]}" | sed -r 's/^\s+//g')"
      # echo ${balabit_ShellControlBoxes[@]}
    fi
#    attempt=$[${attempt}-1]
  done
}
alias getJumpHost=jumpBox
function createShortCut {
  ! isCygwin && ssh -4 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $(getIP -wslhost) ${FUNCNAME[0]} ${WSL_DISTRO_NAME}
  ! isCygwin && return 0
  local CYG_ROOT=$(getCmdValue "cygpath -w /") # e.g C:\cygwin64
  if [[ -z $1 ]]; then
    if ! exec_command_exists unix2dos; then
      aptS install dos2unix
    fi
    if exec_command_exists unix2dos; then
      pushd / > /dev/null 2>&1
      unix2dos Cygwin.bat
      popd > /dev/null 2>&1
    else
      echo "Please ensure ${YELLOW_COL}'${CYG_ROOT}\Cygwin.bat'${RESET_COL} has windows line endings."
    fi
    local update_CygwinBat_Cmd="(Get-Content '${CYG_ROOT}\Cygwin.bat' -Encoding ASCII) -replace '^setlocal.*$', \"$&\`r\`nset CYGWIN=binmode ntsec nodosfilewarning\" | Out-File -FilePath  '${CYG_ROOT}\Cygwin_new.bat' -Encoding ASCII"
    wps -Command "${update_CygwinBat_Cmd}"
    # Create a ShortCut to batch file. Assign it a proper icon. Set the flag "Run as Administrator(on order to allow cygwin to install, configure and run sshd demon...Allow ssh from other machine to this machine.)
    local createShortCut_Cmd="\$Shortcut=(New-Object -ComObject ('WScript.Shell')).CreateShortCut(\"\$env:USERPROFILE\Desktop\ACC_Server.lnk\"); \$Shortcut.IconLocation = '${CYG_ROOT}\\Cygwin.ico,0'; \$Shortcut.TargetPath = '${CYG_ROOT}\\cygwin_new.bat'; \$Shortcut.Save(); \$bytes = [System.IO.File]::ReadAllBytes(\"\$env:USERPROFILE\\Desktop\\ACC_Server.lnk\"); \$bytes[0x15] = \$bytes[0x15] -bor 0x20; [System.IO.File]::WriteAllBytes(\"\$env:USERPROFILE\\Desktop\\ACC_Server.lnk\", \$bytes)"
    local createShortCut_Cmd2="\$desktop_loc=Get-ItemPropertyValue -Path \"HKCU:\\\Software\\\Microsoft\\\Windows\\\CurrentVersion\\\Explorer\\\User Shell Folders\" -Name Desktop;\$Shortcut=(New-Object -ComObject ('WScript.Shell')).CreateShortCut(\"\$desktop_loc\ACC_Server.lnk\"); \$Shortcut.IconLocation = '${CYG_ROOT}\\Cygwin.ico,0'; \$Shortcut.TargetPath = '${CYG_ROOT}\\cygwin_new.bat'; \$Shortcut.Save(); \$bytes = [System.IO.File]::ReadAllBytes(\"\$desktop_loc\ACC_Server.lnk\"); \$bytes[0x15] = \$bytes[0x15] -bor 0x20; [System.IO.File]::WriteAllBytes(\"\$desktop_loc\ACC_Server.lnk\", \$bytes)"
    wps -Command "${createShortCut_Cmd2}"
  fi
  local UseWindowsPowerShell='-UseWindowsPowerShell'
  [[ $PWSHELL_VERSION =~ ^5 ]] && UseWindowsPowerShell=''
  local getPkgFamilyName_Cmd='Import-Module -Name Appx '${UseWindowsPowerShell}' -WarningAction SilentlyContinue; (Get-AppxPackage | Where-Object { $_.PackageFullName -like "Microsoft.WindowsTerminal*" })[-1].PackageFamilyName'
  local WindowsTerminal_PkgFamilyName="$(wps -Command ${getPkgFamilyName_Cmd})"
  WindowsTerminal_PkgFamilyName=$(getCmdValue "echo ${WindowsTerminal_PkgFamilyName}") # trim any white spaces and \r.
  [[ ! -z ${WindowsTerminal_PkgFamilyName} ]] || { echo "Windows Terminal/ Preview not installed.Please  install via Microsoft Store App" | STDERR || return 1; }
  local uuid="{$(getUUID)}"
  local IconPath
  local source
  local name
  local osName
  if [[ -z $1 ]]; then
    osName=Cygwin
    CYG_ROOT="$(echo "${CYG_ROOT}" | sed 's,\\,\\\\\\\\,g')"
    IconPath='"icon" : "'${CYG_ROOT}'\\\\Cygwin.ico",'
    source='"commandline" : "'${CYG_ROOT}'\\\\cygwin_new.bat",'
    name='"name" : "Cygwin",'
  else
    osName=${1}
    local getIconPath_Cmd='(Get-ChildItem "C:\Program Files\WindowsApps" | Where-Object { $_.BaseName -like "*'"${1}"'*x64*" } | Get-ChildItem | Where-Object { $_.BaseName -like "Assets" } | Get-ChildItem | Where-Object { $_ -like "*-32.png" } )[-1].FullName'
    IconPath="$(wps -Command ${getIconPath_Cmd})"
    IconPath="$(echo ${IconPath} | sed 's,\\,\\\\,g')"
    IconPath="$(getCmdValue "echo ${IconPath}")"
    IconPath="$(echo ${IconPath} | sed 's,\\,\\\\\\\\,g')"
    IconPath='"icon" : "'"${IconPath}"'",'
    source='"source" : "Windows.Terminal.Wsl",'
    name='"name" : "'"${1}"'",'
  fi
  local tabColor='"tabColor" : "'"#$(ascii $osName -x | cut -d ' ' -f2-4 | tr -d ' ')"'",'
  local guid='"guid" : "'${uuid}'",'
  local WindowsTerminalEntry='{
  "colorScheme": "Campbell",
  "font":
  {
    "face": "Cascadia Mono"
  },
  "elevate": true,
  "hidden": false,'
  WindowsTerminalEntry+="\n\t${guid}"
  WindowsTerminalEntry+="\n\t${IconPath}"
  WindowsTerminalEntry+="\n\t${source}"
  WindowsTerminalEntry+="\n\t${name}"
  WindowsTerminalEntry+="\n\t${tabColor}"
  # this being last entry remove trailing comma.
  WindowsTerminalEntry=${WindowsTerminalEntry%*,}
  WindowsTerminalEntry+='\n}\n'
  echo -ne "${WindowsTerminalEntry}" > /tmp/additional_settings.json
  local cpCmd="$(which cp) -f"
  local settings_file=${USERPROFILE}'\AppData\Local\Packages\'${WindowsTerminalPreview_PkgFamilyName}'\LocalState\settings.json'
  ${cpCmd} ${settings_file} /tmp/orignal_settings.json
  if [[ $? -eq 0 ]]; then
    jq --arg jqName ${osName} '. | del( .profiles.list[] | select(."name" == $jqName ))' /tmp/orignal_settings.json > /tmp/modified.json
    [[ $? -eq 0 ]] && jq --argfile add /tmp/additional_settings.json '.profiles.list[-1] |= . + $add'  /tmp/modified.json > /tmp/modified2.json
    [[ $? -eq 0 ]] && jq --arg jqName ${osName} '. | del ( (.profiles.list[] | select(."name" == $jqName)).source)' /tmp/modified2.json > /tmp/modified.json
    [[ $? -eq 0 ]] && jq --arg jqUUID ${uuid} '.defaultProfile = $jqUUID'  /tmp/modified.json > /tmp/modified2.json
    [[ $? -eq 0 ]] && ${cpCmd} /tmp/modified2.json ${settings_file}
  else
    echo "Could not access ${WindowsTerminalPreview_PkgFamilyName} config file ${settings_file}" | STDERR
  fi
  return $?
}
function openTerm {
  local restart=0  clean=0 quite=0
  local distro cmd
  if isCygwin; then
    distro=cygwin
  else
    distro=${WSL_DISTRO_NAME:=Debian}
  fi
  while [ ! -z "$1" ]
  do
    if [[ $1 =~ ^[-]+[hH].* ]]; then
      echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [-[-]r,R (restart)] [-[-]x,X (clean)] [-[-]h,H (help)] [-[-]c,C <cmd> (command to execute)]"
      return 0
    elif [[ $1 =~ ^[-]+[rR].* ]]; then
      restart=1
    elif [[ $1 =~ ^[-]+[dD].* ]]; then
      shift
      distro=$1
    elif [[ $1 =~ ^[-]+[xX].* ]]; then
      clean=1
    elif [[ $1 =~ ^[-]+[cC].* ]]; then
      shift
      cmd=$1
    elif [[ $1 =~ ^[-]+[qQfF].* ]]; then
      quite=1
    else
      echo "${RED_COL}ALERT:${RESET_COL}  ${FUNCNAME[0]} Unknown command line option"
      echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [-[-]r,R (restart)] [-[-]x,X (clean)] [-[-]h,H (help)] [-[-]c,C <cmd> (command to execute)]"
      return 1
    fi
    shift
  done
  if [[ ${quite} -eq 1 ]]; then
      local CUR_BOOT_OPTIONS=${BOOT_OPTIONS}
      cacheEnvVar -r BOOT_OPTIONS
      [[ -z ${cmd} ]] && cmd="true";
      [[ -z ${BOOT_OPTIONS} ]] && cacheEnvVar -f EXEC_RUN_ONCE_BEGIN "cacheEnvVar -f -c BOOT_OPTIONS && export BOOT_OPTIONS=0 && ${cmd}" || cacheEnvVar -f EXEC_RUN_ONCE_BEGIN "cacheEnvVar -f BOOT_OPTIONS ${BOOT_OPTIONS} && export BOOT_OPTIONS=0 && ${cmd}"
      cacheEnvVar -f BOOT_OPTIONS 0
      export BOOT_OPTIONS=${CUR_BOOT_OPTIONS} # restore BOOT OPTIONS to its current value for this session.
  elif [[ ! -z ${cmd} ]]; then
    cacheEnvVar -f EXEC_RUN_ONCE_BEGIN "${cmd}"
  fi
  if [[ ${clean} -eq 1 ]]; then
    history2 -c
    cat ~/.hosts | grep -E ".*${ADOBE_DOMAIN}$" > /tmp/.hosts && mv -f /tmp/.hosts ~/.hosts
    sudo rm -rf "/tmp/!(.|..|bkp)"  # requires shopt -s extglob
    local this_bash_pid=${BASHPID}
    this_bash_pid=$(ps -p ${this_bash_pid} | tail -n 1 | tr -s ' ' | cut -d ' ' -f5)
    isCygwin && taskkill /F /FI "IMAGENAME eq bash.exe" /FI "PID ne ${this_bash_pid}"
  fi
  local openTermCmd
  if [[ "X${distro}" = "Xcygwin" ]]; then
    local start_cygwin_cmd_1="\$sh = New-Object -COM WScript.Shell; Invoke-Item (Get-ChildItem | Where-Object { \$_.Extension -Like \\\".lnk\\\" } | Where-Object { \$sh.CreateShortcut(\$_.FullName).TargetPath -Like \\\"*cygwin*.bat\\\"}).Name"
    local start_cygwin_cmd_2="Get-ItemPropertyValue -Path \\\"HKCU:\\\Software\\\Microsoft\\\Windows\\\CurrentVersion\\\Explorer\\\User Shell Folders\\\" -Name Desktop | Push-Location; \$sh = New-Object -COM WScript.Shell; $pwd; sleep 3; explorer (Get-ChildItem | Where-Object { \$_.Extension -Like \\\".lnk\\\" } | Where-Object { \$sh.CreateShortcut(\$_.FullName).TargetPath -Like \\\"*cygwin*.bat\\\"}).Name"
    openTermCmd=${start_cygwin_cmd_2}
    wps -Command "Start-Process -WindowStyle Hidden $PWSHELL  -ArgumentList '-Command \"${openTermCmd}\"' -Verb RunAs"
  else
    if isCygwin; then
      if [[ $(wsl -l --running | wc -l) -lt 2 ]]; then
        local restart_WSL_VM_Services_Cmd='Restart-Service vmms; Restart-Service vmcompute;'
        # Get-Service vm* | Where-Object { $_.Status -cne 'Running' }
        wps -Command "Start-Process $PWSHELL  -ArgumentList '-Command \"${restart_WSL_VM_Services_Cmd}\"' -Verb RunAs"
      fi
      openTermCmd="wsl -d ${distro}"
      wps -Command "Start-Process $PWSHELL  -ArgumentList '-Command \"${openTermCmd}\"' -Verb RunAs"
    else
      openTermCmd="wsl -d ${distro}"
      ssh -4 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $(getIP -wslhost) "\${PWSHELL} -Command \"Start-Process \${PWSHELL} -ArgumentList \\\"-Command ${openTermCmd}\\\"  -Verb RunAs\""
      # ssh -4 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $(getIP -wslhost) ${FUNCNAME[0]} -d ${WSL_DISTRO_NAME:=Debian}
    fi
  fi
  [[ ${restart} -eq 1 ]] && exit
}
function add2HostsFile {
  [[ $# -lt 2 ]] && { echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  <hostname> < <ip> | <alias-name> >" | STDERR; return; }
  local l_hostname=$1
  local l_ip l_alias=$2
  shift
  shift
  local l_hosts_file='/etc/hosts'
  local __MARKER
  [[ -e "${!#}" ]] && l_hosts_file="${!#}" && set -- "${@:1:$#-1}" && unset HOSTS_EOL SYS_HOSTS_FILE && export SYS_HOSTS_FILE="$(readlink -f ${l_hosts_file})" && __MARKER="# $@"
  export SYS_HOSTS_FILE=${SYS_HOSTS_FILE:=$(readlink -f ${l_hosts_file})}
  [[ ${l_alias} =~ ^(25[0-5]|2[0-4][0-9]|1[0-9]?[0-9]?|[1-9][0-9]?|[1-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9]?[0-9]?|[1-9][0-9]?|[0-9])){3}$ ]] && l_ip=${l_alias} && unset l_alias
  export HOSTS_EOL=${HOSTS_EOL:=$(getEOL ${SYS_HOSTS_FILE})}
  local mvCmd="$(which mv) -f " cpCmd="$(which cp) -f "
  local bang='!' iRc=0
  if [[ ! -z ${l_alias} ]]; then
    grep -E "[^#]+\s+${l_hostname}" ${SYS_HOSTS_FILE} | grep -Pe "^(?=.*\s+ ${l_hostname}\s)(?${bang}.*\s+${l_alias}\s+)" > /dev/null && { ${cpCmd} ${SYS_HOSTS_FILE} /tmp/hosts; sed -i -r "s,(.*)(\s${l_hostname}\s)(.*),\1\2 ${l_alias} \3,g" /tmp/hosts; sudo ${mvCmd} /tmp/hosts ${SYS_HOSTS_FILE}; }
    iRc=${PIPESTATUS[0]}
  fi
  [[ $iRc -eq 0 ]] || return $iRc
  iRc=0
  if [[ ! -z ${l_ip} ]]; then
    grep -E "[^#]+\s+${l_hostname}" ${SYS_HOSTS_FILE} | grep -Pe "^(?${bang}.*${l_ip})(?=.*\s+${l_hostname})" > /dev/null && { ${cpCmd} ${SYS_HOSTS_FILE} /tmp/hosts; sed -i -r "s,^[0-9\.]+(\s+)(.*${l_hostname}.*)$,${l_ip}\1\2,g" /tmp/hosts; sudo ${mvCmd} /tmp/hosts ${SYS_HOSTS_FILE}; }
    iRc=${PIPESTATUS[0]}
  fi
  if [[ $iRc -ne 0 ]]; then
    local padding_ip padding_hostname
    __MARKER=${__MARKER:="# Added by ${FUNCNAME[0]} :: $@"}
    [[ ${#l_ip} -le 15 ]] && padding_ip="$(head -c $(expr 15 - ${#l_ip}) < /dev/zero | tr '\0' ' ')"
    [[ ${#l_hostname} -le 40 ]] && padding_hostname="$(head -c $(expr 40 - ${#l_hostname}) < /dev/zero | tr '\0' ' ')"
    local permissions="$(ls -l $SYS_HOSTS_FILE  | awk '{print $3":"$4}')"
    isCygwin || sudo chown $(id -u):$(id -g) "${SYS_HOSTS_FILE}"
    echo -ne "${l_ip} ${padding_ip} ${l_hostname} ${padding_hostname} ${__MARKER}${HOSTS_EOL}" | tee -a ${SYS_HOSTS_FILE} > /dev/null
    sudo chown "${permissions}" "${SYS_HOSTS_FILE}"
  fi
}
function addCustomHosts {
  [[ $# -ne 0 ]] && [[ $# -ne 2 ]] && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [<ip> <hostname>]" && return 1
  if isHostAlive ${TEAM_SHARE_SERVER}; then
    local momentumserverIP=$(nslookup sj1010010254089.${ADOBE_CORP_DOMAIN} | sed -r '1,/Name.*/d' | cut -d ':' -f2 |  sed -r 's/^\s*([^\s]*)\s*$/\1/g')
    local pathSep='/'
    isCygwin && pathSep='\'
    local remoteHostsFile="$(readlink -f "${TEAM_SHARE_CACHE}hosts.txt")"
    local mtime=$(date '+%d%b%Y_%H_%M_%S_%s')
    local l_SYS_HOSTS_FILE=$SYS_HOSTS_FILE
    [[ ! -z $1 ]] && [[ ! -z $2 ]] && add2HostsFile $2 $1 "mtime=${mtime} @ $(whoami)" "$remoteHostsFile"
    add2HostsFile momentum-dev.${ADOBE_CORP_DOMAIN} ${momentumserverIP} "mtime=${mtime} @ $(whoami)" "$remoteHostsFile"
    add2HostsFile momentum.${ADOBE_CORP_DOMAIN} ${momentumserverIP} "mtime=${mtime} @ $(whoami)" "$remoteHostsFile"
    SYS_HOSTS_FILE="${l_SYS_HOSTS_FILE}"
  else
    echo "${TEAM_SHARE_SERVER} not reachable" | STDERR
  fi
  return $?
}
function setupVault {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | -f(force install) | -s <orgname to start next processing from> ] -- Sets up vault for access to credentials of hosted instances." && return
  if ! exec_command_exists vault || [ "X${1,,}" = "X-f" ]; then
    pushd /tmp > /dev/null 2>&1
    local vaultVersion='1.14.0'
    echo "Downloading vault(${vaultVersion}) ..."
    local iRc
    if isCygwin; then
      download https://releases.hashicorp.com/vault/${vaultVersion}/vault_${vaultVersion}_windows_amd64.zip
      iRc=$?
      [[ $iRc -ne 0 ]] && popd && return $iRc
      /usr/bin/unzip -o vault_${vaultVersion}_windows_amd64.zip -d /usr/local/bin
    else
      download https://releases.hashicorp.com/vault/${vaultVersion}/vault_${vaultVersion}_linux_amd64.zip
      iRc=$?
      [[ $iRc -ne 0 ]] && popd && return $iRc
      sudo /usr/bin/unzip -o vault_${vaultVersion}_linux_amd64.zip -d /usr/local/bin
    fi
    sudo chmod +x /usr/local/bin/vault
    popd > /dev/null 2>&1
  fi
  local cpCmd="$(which cp) -f -p -r"
  local mvCmd="$(which mv) -f"
  local iRc
  local pathSep='/'
  isCygwin && pathSep='\'
    local server_vault_host_cache_file="${TEAM_SHARE_CACHE}vault_hosts.txt"
  if [[ $(stat -c '%s' $(readlink -f ~/.bashrc )) -lt 1024 ]]; then
    rm -f ~/.vault_hosts
    ${cpCmd} "${TEAM_SHARE_CACHE}vault_hosts.txt" ~/.vault_hosts
  fi
  if [[ ! -e ~/.vault_hosts || $(stat -c '%s' $(readlink -f ~/.vault_hosts )) -lt 1024 ]]; then
    echo "ALERT: Invalid ~/.vault_hosts cache file. " | STDERR
    rm -f ~/.vault_hosts
    ${cpCmd} "${TEAM_SHARE_CACHE}vault_hosts.txt" ~/.vault_hosts
    local isCacheFileonServerBad
    [[ $(stat -c '%s' $(readlink -f "${TEAM_SHARE_CACHE}vault_hosts.txt" )) -lt 1024 ]] && isCacheFileonServerBad=1
    if [[  ! -e ~/.vault_hosts || $(stat -c '%s' $(readlink -f ~/.vault_hosts )) -lt 1024 ]]; then
      echo "You may also want to check if you have permission to valid/existing ${YELLOW_COL}${server_vault_host_cache_file}${RESET_COL} and check with hparmar@${ADOBE_DOMAIN}"
      [[ -z ${isCacheFileonServerBad} ]] && return $(errno ENOENT | cut -d ' ' -f2)
    fi
  fi
  if [[ -e ~/.vault_hosts && ! -z "$(head -1 ~/.vault_hosts | grep -E '^#\s*mtime')" ]]; then
    local file_mtime=$(head -1 ~/.vault_hosts | sed -r 's,^#\s*mtime\s*=\s*,,')
    local cur_time=$(date '+%s')
    if [ $(expr $(date '+%s') - ${file_mtime} - 90 \* 24 \* 60 \* 60) -lt 0 ]; then
      echo "${GREEN_COL}INFO:${RESET_COL}Your copy of ~/.vault_hosts is quite recent ${YELLOW_COL}$(date --date=@${file_mtime})${RESET_COL}. No need to fetch afresh from vault."
      echo "if you still want to fetch new one(takes about 45 mins), you are advised to remove ${YELLOW_COL}~/.vault_hosts${RESET_COL} and also older copy from ${YELLOW_COL}${TEAM_SHARE_CACHE}vault_hosts.txt${RESET_COL}"
      return
    else
      ${cpCmd} "${TEAM_SHARE_CACHE}vault_hosts.txt" ~/.vault_hosts
      if [[ -e ~/.vault_hosts && ! -z "$(head -1 ~/.vault_hosts | grep -E '^#\s*mtime')" ]]; then
        local file_mtime=$(head -1 ~/.vault_hosts | sed -r 's,^#\s*mtime\s*=\s*,,')
        local cur_time=$(date '+%s')
        if [ $(expr $(date '+%s') - ${file_mtime} - 90 \* 24 \* 60 \* 60) -lt 0 ]; then
          echo "${GREEN_COL}INFO:${RESET_COL}Your copy of ~/.vault_hosts is quite recent ${YELLOW_COL}$(date --date=@${file_mtime})${RESET_COL}. No need to fetch afresh from vault."
          echo "if you still want to fetch new one(takes about 45 mins), you are advised to remove ${YELLOW_COL}~/.vault_hosts${RESET_COL} and also older copy from ${YELLOW_COL}${TEAM_SHARE_CACHE}vault_hosts.txt${RESET_COL}"
          return
        fi
      fi
    fi
  fi
  vault token lookup | grep ttl > /dev/null 2>&1
  iRc=$?
  if [ $iRc -ne 0 ]; then
    vault login -address=${VAULT_ADDR} -method=oidc
    iRc=$?
    if [ $iRc -ne 0 ]; then
      echo "${RED_COL}ALERT:${RESET_COL}oidc Login unsuccessful..Trying login to vault with your LDAP credentials(and OTP):"
      vault login -address=${VAULT_ADDR}  -method=ldap  username=$(whoami)
    fi
    vault token lookup | grep ttl
    iRc=$?
  fi
  local orgs="$(vault list -address=${VAULT_ADDR} ${VAULT_CAMP_PATH} | sed -r -e '1,/----/d')"
  local start_org_id
  start_org_id=$(_KEY_HAS_VALUE -s $@)
  if [ $? -eq 0 ]; then
    # Filter out those orgs which according to user provided hint(-s option value) have already been fetched earlier.
    orgs="{ echo "${orgs}" | sed -r -n -e "1,/^${start_org_id}.*/p" | grep --color=never -E "^${start_org_id}.*"; echo "${orgs}" | sed -r -e "0,/^${start_org_id}.*/d"; }"
  fi
  orgs="$(echo "${orgs}" | xargs)"
  echo ${GREEN_COL}INFO:${RESET_COL} $(date '+%H:%M:%S %p : ') Fetching entire server list from vault takes about 45 minutes.
  readEx "Do you want to continue?. Waiting for  " 10 " seconds. Press Enter to continue or else vault refresh shall abort"
  iRc=$?
  if [ $iRc -ne 0 ]; then
    echo ${YELLOW_COL}WARN:${RESET_COL} $(date '+%H:%M:%S %p : ') Skipping Server list vault refresh!... It was last refreshed on $(stat -c '%y' ~/.vault_hosts)
    return ${iRc}
  fi
  echo "" > /tmp/.vault_hosts
  echo ${GREEN_COL}INFO:${RESET_COL} $(date '+%H:%M:%S %p : ') Found ${YELLOW_COL}$(nchars / ${orgs})${RESET_COL} organizations in vault.
  local sCount=0
  local failCount=0
  for _org_id in ${orgs}; do
    local server_list=''
    server_list="$(vault list -address=${VAULT_ADDR} ${VAULT_CAMP_PATH}/${_org_id} | sed -r -e '1,/----/d')"
    iRc=$?
    if [[ $iRc -ne 0 ]] || [[ -z "${server_list}" ]]; then
      vault login -address=${VAULT_ADDR} -method=oidc
      iRc=$?
      if [ $iRc -ne 0 ]; then
        echo "${RED_COL}ALERT:${RESET_COL}oidc Login unsuccessful..Trying login to vault with your LDAP credentials(and OTP):"
        vault login -address=${VAULT_ADDR}  -method=ldap  username=$(whoami)
        iRc=$?
      fi
      vault token lookup | grep ttl
      iRc=$?
      [[ $iRc -ne 0 ]] || server_list="$(vault list -address=${VAULT_ADDR} ${VAULT_CAMP_PATH}/${_org_id} | sed -r -e '1,/----/d')"
    fi
    if [[ $iRc -ne 0 ]] || [[ -z "${server_list}" ]]; then
      echo ${RED_COL}ALERT:${RESET_COL} $(date '+%H:%M:%S %p : ') Could not fetch serverlist for org ${_org_id}
      failCount=$[${failCount}+1];
      if [ $(expr ${failCount} % 5 ) -eq 0 ]; then
        echo ${YELLOW_COL}WARN:${RESET_COL} $(date '+%H:%M:%S %p : ') "Too many( ${failCount} ) failures..." Skipping Server list vault refresh.It was last refreshed on $(stat -c '%y' ~/.vault_hosts)
        readEx "Do you want to continue?. Waiting for  " 10 " seconds. Press Enter to continue or else vault refresh shall abort"
        iRc=$?
        if [ $iRc -ne 0 ]; then
          echo ${YELLOW_COL}WARN:${RESET_COL} $(date '+%H:%M:%S %p : ') Too many failures...Skipped Server list vault refresh!... It was last refreshed on $(stat -c '%y' ~/.vault_hosts)
          return ${iRc}
        fi
      fi
    fi
    for server_key in ${server_list}; do
      # cache server in your local file.
      echo ${_org_id}${server_key} >> /tmp/.vault_hosts
      sCount=$[${sCount}+1]
      if [ $(expr $sCount % 50 ) -eq 0 ]; then
        printf "\r${GREEN_COL}INFO:${RESET_COL} $(date '+%H:%M:%S %p : ')Processed ${YELLOW_COL} %5d ${RESET_COL} servers ...Last org: ${_org_id} [ $(_indexof ${_org_id} ${orgs}) / $(nchars / ${orgs}) ]                                                " $sCount
      fi
    done
  done
  # merge new(sorted) records with old(sorted) records.
  { echo -ne "# mtime=$(date '+%s')"; [[ -e ~/.vault_hosts ]] && cat ~/.vault_hosts | sed -r -e "0,/^#\s+mtime/d" | grep --color=never -E -v "^${start_org_id}.*"; cat /tmp/.vault_hosts; } > /tmp/.vault_hosts.new
  ${mvCmd} /tmp/.vault_hosts.new ~/.vault_hosts
  echo ""; echo "Uploading new vault information to shared location."
  ${cpCmd} ~/.vault_hosts "${TEAM_SHARE_CACHE}vault_hosts.txt"
  return 0
}
function getVaultCreds {
  if ! exec_command_exists vault; then
    wcinstall vault
  fi
  if [ $# -lt 1 -o $# -gt 5 ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] [-o] <org> [-s] <server>"
    return 1
  fi
  if _CONTAINS -h "$@" ; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] [-o] <org> [-s] <server>"
    return 0
  fi
  if [[ ! -e ~/.vault_hosts || $(stat -c '%s' $(readlink -f ~/.vault_hosts )) -lt 1024 ]]; then
    echo "ALERT: Invalid ~/.vault_hosts cache file. " | STDERR
    wcinstall vault
    [[ ! -e ~/.vault_hosts || $(stat -c '%s' $(readlink -f ~/.vault_hosts )) -lt 1024 ]] && return $(errno ENOENT | cut -d ' ' -f2);
  fi
  local l_Org
  local l_Server
  if _CONTAINS -o "$@"; then
    l_Org=$(_KEY_HAS_VALUE -o $@)
    if _CONTAINS -s "$@"; then
      l_Server=$(_KEY_HAS_VALUE -s $@)
    else
      l_Server=$1
      if [[ X${l_Server,,} = X"-o" ]]; then
        l_Server=""
        shift
        shift
      fi
    fi
  else
    l_Org=$1
    if _CONTAINS -s "$@"; then
      l_Server=$(_KEY_HAS_VALUE -s $@)
    fi
    if [[ X${l_Org,,} = X"-s" ]]; then
      shift
      shift
      l_Org=$1
    else
      shift
    fi
  fi
  if [ -z ${l_Server} ]; then
    if _CONTAINS -s "$@"; then
      l_Server=$(_KEY_HAS_VALUE -s $@)
    else
      l_Server=$1
    fi
  fi
  l_Server=${l_Server%%.*}
  l_Server=${l_Server##*/}
  l_Org=$(echo ${l_Org} | sed -r 's,/$,,')
  local l_ServerRefInVault=${l_Server}
  [[ -z $l_Org ]] && { l_Org=$(cat ~/.vault_hosts | grep -E "$(echo $l_Server | awk -F "[_-]" '{ printf($1);for(i=2; i<=NF; i++) { printf("[_-]%s",$i); }}')"); l_ServerRefInVault=${l_Org#*/}; l_Org=${l_Org%/*} ; echo "${GREEN_COL}INFO:${RESET_COL}Using Org ${YELLOW_COL}${l_Org}${RESET_COL} with instance ${YELLOW_COL}${l_ServerRefInVault}${RESET_COL}" ; }
  [[ -z $l_Org ]] && { echo "Could not find org in vault for this server. You can use -o to specify org explicitly." | STDERR || return 2; }
  local iRc
  vault token lookup | grep ttl > /dev/null 2>&1
  iRc=$?
  if [ $iRc -ne 0 ]; then
    [[ -z ${VAULT_LDAP} ]] && vault login -address=${VAULT_ADDR} -method=oidc
    iRc=$?
    if [ $iRc -ne 0 ]; then
      echo "${RED_COL}ALERT:${RESET_COL} Skipping oidc(Microsoft) Authentication for vault Login...Trying login to vault with your LDAP credentials(and OTP):"
      vault login -address=${VAULT_ADDR} -method=ldap  username=$(whoami)
    fi
    vault token lookup | grep ttl
    iRc=$?
  fi
  if [ $iRc -ne 0 ]; then
    echo "${RED_COL}ALERT:${RESET_COL}Failed to authenticate against vault"
    return ${iRc}
  fi
  vault read -address=${VAULT_ADDR} ${VAULT_CAMP_PATH}$(echo "${l_Org}/${l_ServerRefInVault}" |  sed -r 's,\s+,,g')
  [[ $? -eq 0 ]] && echo "${l_Server}.${HOSTED_CAMPAIGN_DOMAIN}" >> ~/.hosts
}
function cleanPaths {
  local varname=$1
  local _paths="${!varname}"
  if [[ -z ${_paths} ]]; then
    return
  fi
  local sep=':' isPathTypeWindows=0
  [[ $(nchars ';' ${_paths}) -gt $(nchars : ${_paths}) ]] && sep=';'
  [[ $(nchars '\\' ${_paths}) -gt $(nchars / ${_paths}) ]] && isPathTypeWindows=1
  readarray  path_array <<< $(echo "${_paths}" | sed "s/${sep}/\n/g")
  declare -g ${varname}
  local new_value;
  for p in "${path_array[@]}"
  do
    local l_upath="$(ustyle "${p}")"
    if [[ -d "${l_upath}" ]]; then
      if [ ${isPathTypeWindows} -eq 1 ]; then
        new_value="${new_value}${sep}$(cygpath -w "${l_upath}")"
      else
        new_value="${new_value}${sep}${l_upath}"
      fi
    fi
  done
  declare -g ${varname}="${new_value:1:${#new_value}}"
}
function getUserInfo {
  if [ $# -ne 1 ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <-f[ullname] | -o[rg]>"
    return 0
  fi
  local infoType=${1,,}
  if isCygwin; then
    local ci=$(getCmdValue "wps  -Command '\$ci=Get-ComputerInfo; \$ci.CsPrimaryOwnerName; \$ci.WindowsRegisteredOrganization'")
    if [[ X${infoType:0:2} = X"-f" ]]; then
      local l_userFullName;
      l_userFullName=$(echo "$ci" | head -1)
      if [[ $l_userFullName =~ ^[[:space:]]*$ ]]; then
        l_userFullName=$(whoami)
      fi
      echo "${l_userFullName}";
    else
      local l_ORG_NAME=$(echo "$ci" | tail -1)
      if [[ $l_ORG_NAME =~ ^[[:space:]]*$ ]]; then
        l_ORG_NAME="Adobe Systems India Pvt Ltd"
      fi
      echo "${l_ORG_NAME}"
    fi
  else
    if [[ X${infoType:0:2} = X"-f" ]]; then
      local l_userFullName="$(finger $(whoami) | grep "Name:" | sed -r 's,.*Name:\s+,,' | sed -r 's,\t.*,,')"
      if [[ $l_userFullName =~ ^[[:space:]]*$ ]]; then
        l_userFullName=$(whoami)
      fi
      echo "${l_userFullName}"
      # local h=$(finger -s hparmar | head -1)
      # local start=$(echo "$h" | sed -r 's,(.*\s+Name)\s+.*,\1,' | wc -c)
      # local end=$(echo "$h" | sed -r 's,(.*\s+Name\s+).*,\1,' | wc -c)
      # local l_userFullName=$(finger -s hparmar | tail -1 | cut -b $[${start}-4]-$[${end}-4])
      # if [[ $l_userFullName =~ ^[[:space:]]*$ ]]; then
        # l_userFullName=$(whoami)
      # fi
    else
      local l_ORG_NAME="$(finger $(whoami) | grep "Office:" | sed -r 's,.*Office:\s+,,' | sed -r 's,\t.*,,')"
      if [[ $l_ORG_NAME =~ ^[[:space:]]*$ ]]; then
        l_ORG_NAME="Adobe Systems India Pvt Ltd"
      fi
      echo "${l_ORG_NAME}"
    fi
  fi
  return 0
}
function getbashrc {
  [[ -f $(readlink -f ~/.bashrc) && $[($(date '+%s') - $(stat -c '%Y' $(readlink -f ~/.bashrc)))/86400] -gt 7 ]] || _CONTAINS -f "$@" || return;
  pushd ${CAMP_AC_ROOT}/../acc-dev/acc-dev-setup > /dev/null
  if isHostAlive $(git config --get remote.origin.url | sed -r 's,^.*@,,' | sed -r 's,:.*$,,'); then
    git remote show origin | grep "local out of date" > /dev/null
    if [ $? -eq 0 ]; then
      local yn='y'
      # Ask only if it is called from within interactive shell.
      if [[ $- =~ .*s.* ]]; then
        flushInput
        read -p "${RED_COL}ALERT:${RESET_COL} You do not have latest .bashrc. Do you want to pull latest from git? ([y]/n) " yn
      else
        echo "${GREEN_COL}INFO:${RESET_COL} Pulling latest .bashrc from git ..."
      fi
      yn=${yn:0:1}
      if [[ "X${yn,,}" =~ X[n0f] ]];  then
        echo "...Skipping pull. You are however advised to be on the latest."
      else
        local backUpFile="$(getBackupLocation bashrc)"
        local changelog="$(getBackupLocation bashrc changelog)"
        echo -ne "Backup..."
        cp -f -v ~/.bashrc "$backUpFile"
        # local remote_latest_commit=$(git ls-remote $(git config --get remote.origin.url) | grep refs/heads/$(currentBranch) | cut -f1)
        local local_head_commit=$(git rev-parse HEAD)
        echo "Stashing your local changes(if any). In case new bashrc does not work restore from above mentioned backup copy."
        ( git stash; git reset --hard HEAD~10; git checkout -f ; git pull origin master ) > /dev/null 2>&1
        local remote_latest_commit=$(git rev-parse HEAD)
        echo "${GREEN_COL}${BOLD}Change Log:${RESET_COL}"
        git log --pretty=short ${local_head_commit}..${remote_latest_commit} | grep -v -E "^[commit|Author]" | uniq | tee -a ${changelog}
        #git stash apply
        # Ask only if it is called from within interactive shell.
        if [[ $- =~ .*s.* ]]; then
          echo "New bashrc available. Change log is also available at ${changelog} . Please restart ${OSTYPE}."
          echo "Press Ctrl+C to abort OrElse Press any other key to exit this session immediately."readEx "Restarting terminal in " 10 " seconds..."
          openTerm -r "$@"
        else
          echo "New bashrc available. Change log is also available at ${changelog}. Restart ${OSTYPE} to apply new changes."
#          readEx "Restarting terminal in " 5 " seconds..."
#          isCygwin && openTerm &
#          ! isCygwin && openTerm
          # https://linuxhandbook.com/find-process-id/
          #kill -TERM $PPID
#          kill -TERM $$
        fi
      fi
    fi
  fi
  popd > /dev/null
}
function soap {
  local l_proto l_host l_port
  export SOAP_HOST=${SOAP_HOST:="https://$(hostname --fqdn)"}
  [[ ${SOAP_HOST} =~ ([^:/]+)[:/]{2,} ]] && l_proto=${BASH_REMATCH[1]}
  [[ ${SOAP_HOST} =~ ${l_proto}[:/]*([^:/]+) ]] && l_host=${BASH_REMATCH[1]}
  local soapAction=$1; shift
  local soapURL="${SOAP_HOST}/nl/jsp/soaprouter.jsp"
  [[ ${soapAction} =~ [Nn][Oo][Nn][Ee] || ${soapAction} =~ [Nn][Uu][Ll][Ll] || ${soapAction} =~ [Nn][Ii][Ll] || ${soapAction} =~ 0 ]] && soapURL="${SOAP_HOST}/${1}"
  curl -s --connect-timeout 1 -X POST \
  --header "Content-Type: application/soap+xml; action=${soapAction}; charset=utf-8" \
  --header 'Accept-Language: en' \
  --header "SOAPAction: ${soapAction}" \
  --header "Cookie: __sessiontoken=${SESSION_TOKEN}" \
  --header "X-Security-Token:${SECURITY_TOKEN}" \
  --header 'X-Query-Source: nlclient' \
  --header "Host: ${l_host}" \
  --header 'Connection: keep-alive' \
  --data-raw "$@" --location "${soapURL}"
}
function urlencode {
    local string="${1}"
    echo -n "${string}" | perl -MURI::Escape -ne 'print uri_escape($_)'
}
function jssp {
  [[ $# -eq 0 ]] && echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <path-to-jssp> [<key1> <value1>] [<key2> <value2>] ..." && return
  local l_proto l_host l_port
  export SOAP_HOST=${SOAP_HOST:="https://$(hostname --fqdn)"}
  [[ ${SOAP_HOST} =~ ([^:/]+)[:/]{2,} ]] && l_proto=${BASH_REMATCH[1]}
  [[ ${SOAP_HOST} =~ ${l_proto}[:/]*([^:/]+) ]] && l_host=${BASH_REMATCH[1]}

  local url="${SOAP_HOST}/${1}"
  shift
  local data="--data-urlencode \"${1}"
  shift
  local isKey=0
  for args in "$@"; do
    [[ ${isKey} -eq 1 ]] && data="${data}\" --data-urlencode \"${args}" && isKey=0 && continue
    [[ -z $args ]] || data="${data}=${args}"
    isKey=1
  done
  data="${data}\""
  curl -s  --connect-timeout 1 -X POST \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --header "Cookie: __sessiontoken=${SESSION_TOKEN}" \
  --header "X-Security-Token:${SECURITY_TOKEN}" \
  --header 'X-Query-Source: nlclient' \
  --header "Host: ${l_host}" \
  --header 'Connection: keep-alive' $(xargs <<< $data) --location ${url}
}
function soap_rtest {
  if _CONTAINS -h "$@" ; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] [[-s] <server-url>]"
    return
  fi
  local host=$1
  if [[ X${host,,} = "X-s" ]] ; then
    shift
    host=$1
        # if host does not have domain name specified in it add campaign.adobe.com as domain,
        # as it is assumed that in which case it was supplied by autocomplete from _get_vault_completions.
    [[ ! -z ${host} && X${host/.*/} = X${host} ]] && host="${host}.${HOSTED_CAMPAIGN_DOMAIN}"
  fi
  host=${host:=${SOAP_HOST}}
  host=${host:=$(hostname --fqdn)}
  SOAP_HOST=${SOAP_HOST:=${host}}
  local l_proto l_host l_port
  [[ $host =~ ([^:/]+)[:/]{2,} ]] && l_proto=${BASH_REMATCH[1]}
  [[ $host =~ ${l_proto}[:/]*([^:/]+) ]] && l_host=${BASH_REMATCH[1]}
  [[ $host =~ ${l_proto}[:/]*[^:]+[:]?([[:digit:]]*) ]] && l_port=${BASH_REMATCH[1]}
  l_proto=${l_proto:="https"}
  [[ ! -z ${l_port} ]] && l_host=${l_host}:${l_port}
  shift

  l_port=${l_port:=$([[ ${l_proto} = "https" ]] && echo 443 || echo 80)}
  isHostAlive ${l_host} || isPortListening ${l_port} ${l_host} || { echo "${l_host} is unreachable" | STDERR ; return 1; }
  isPortListening ${l_port} ${l_host} || { echo "Apache is down"; return 2; }
  local opipefailVal='+'
  [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
  set -o pipefail

  curl -s "$@" --connect-timeout 5 --request POST "${l_proto}://${l_host}/r/test" \
  --header "Content-Type: application/soap+xml; action=${soapAction}; charset=utf-8" \
  --header 'Accept-Language: en' \
  --header 'X-Query-Source: nlclient' \
  --header "Host: ${l_host}" | tee /tmp/soap_rtest
  iRc=$?
  if [[ $iRc -ne 0 ]]; then
    if [[ ${l_proto} = "https" ]]; then
      local iRc1
      curl -s "$@" --connect-timeout 5 --request POST "http://${l_host}/r/test" \
      --header "Content-Type: application/soap+xml; action=${soapAction}; charset=utf-8" \
      --header 'Accept-Language: en' \
      --header 'X-Query-Source: nlclient' \
      --header "Host: ${l_host}" > /dev/null 2>&1
      iRc1=$?
      [[ $iRc1 -eq 0 ]] && { echo "It looks like you may have SSL certificate issues, as http on ${l_host} seem to be working fine." | STDWARN; }
    fi
  fi

  set ${opipefailVal}o pipefail

  [[ $iRc -eq 0 ]] && [[ $(cat /tmp/soap_rtest | xmlize | getXMLAttrVal redir build) -gt 10000 ]] && echo "${YELLOW_COL}WARN:${RESET_COL} ACS instance."
  rm -f /tmp/soap_rtest
  return $iRc
}

function soapLogOutAPI {
  unset SESSION_TOKEN SECURITY_TOKEN
  _CONTAINS -f $@ && unset SOAP_HOST
  true
}

function soapLogOnAPI {
  if _CONTAINS -h "$@" ; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] [[-s] <server-url>] [<username>] [<password>]"
    return
  fi
  local host=$1
  if [[ X${host,,} = "X-s" ]] ; then
    shift
    host=$1
        # if host does not have domain name specified in it add campaign.adobe.com as domain,
        # as it is assumed that in which case it was supplied by autocomplete from _get_vault_completions.
    [[ ! -z ${host} && X${host/.*/} = X${host} ]] && host="${host}.${HOSTED_CAMPAIGN_DOMAIN}"
  fi
  host=${host:=${SOAP_HOST}}
  host=${host:=$(hostname --fqdn)}
  local l_proto l_host l_port
  [[ $host =~ ([^:/]+)[:/]{2,} ]] && l_proto=${BASH_REMATCH[1]}
  [[ $host =~ ${l_proto}[:/]*([^:/]+) ]] && l_host=${BASH_REMATCH[1]}
  [[ $host =~ ${l_proto}[:/]*[^:]+[:]?([[:digit:]]*) ]] && l_port=${BASH_REMATCH[1]}
  l_proto=${l_proto:="https"}
  [[ ! -z ${l_port} ]] && l_host=${l_host}:${l_port}
  export SOAP_HOST="${l_proto}://${l_host}"
  local campUser=$2
  if [ -z ${campUser} ]; then
    campUser='admin'
  fi
  local campPassword=$3
  if [ -z ${campPassword} ]; then
    [[ X${SOAP_HOST#*.} = X${HOSTED_CAMPAIGN_DOMAIN} ]] && campPassword=$(getVaultCreds -s ${SOAP_HOST} | grep ${campUser} | tr -s '[:blank:]' | cut -d ' ' -f2)
    campPassword=${campPassword:=${DEFAULT_PASSWORD}}
  fi
  echo "Attempting to Login into ${YELLOW_COL}${SOAP_HOST}${RESET_COL}"
  local APISoapBody="<?xml version='1.0'?><SOAP-ENV:Envelope xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:ns='urn:xtk:session' xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'><SOAP-ENV:Body><Logon xmlns='urn:xtk:session' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><__sessiontoken xsi:type='xsd:string'></__sessiontoken><strLogin xsi:type='xsd:string'>${campUser}</strLogin><strPassword xsi:type='xsd:string'>${campPassword}</strPassword><elemParameters xsi:type='ns:Element' SOAP-ENV:encodingStyle='http://xml.apache.org/xml-soap/literalxml'><client build=\"${BUILD_NUMBER}\"/></elemParameters></Logon></SOAP-ENV:Body></SOAP-ENV:Envelope>"
  local iRc=0
  useXMLLint && { echo "${APISoapBody}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -eq 0 ] || { echo "${RED_COL}ALERT:${RESET_COL} Bad XML request body"; return $iRc; }
  soapLogOutAPI
  local dynVar=SESSION_TOKEN
  soap  xtk:session#Logon "${APISoapBody}" > /tmp/soapout.txt
  iRc=$?
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Logon SOAP API Failed. Try again." | STDERR || return $iRc; }
  unset SESSION_TOKEN SECURITY_TOKEN
  for tk in $(cat /tmp/soapout.txt | getXMLAttrVal pstrSessionToken,pstrSecurityToken NULL); do
    declare -g ${dynVar}=${tk}
    dynVar=SECURITY_TOKEN
  done
  [[ ! -z ${SESSION_TOKEN} ]] || { echo "${RED_COL}ALERT:${RESET_COL} Logon API Bad return value." | STDERR || return $(errno EIO | cut -d ' ' -f2); }
  echo "${GREEN_COL}INFO:${RESET_COL} Logon to ${YELLOW_COL}${SOAP_HOST}${RESET_COL} Successful."
}
function soapGetWSDL {
  if _CONTAINS -h "$@" || [ $# -ne 1 ] || [[ ! ${1} =~ [^:]+:[^:]+ ]]; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] <namespace:schema>"
    return
  fi
  [[ -z ${SESSION_TOKEN} ]] && soapLogOnAPI
  soap none "nl/jsp/schemawsdl.jsp?schema=${1}"
}
function soapEncryptAPI {
  local iRc=0
  if _CONTAINS -h "$@" ; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] [<string-to-encrypt>]"
    return
  fi
  [[ -z ${SESSION_TOKEN} ]] && soapLogOnAPI
  iRc=$?
  [[ -z ${SESSION_TOKEN} ]] && return $iRc
  local stringToEncrypt="$1"
  if [ -z ${stringToEncrypt} ]; then
    stringToEncrypt=${DEFAULT_PASSWORD}
  fi
    local APISoapBody="<?xml version='1.0'?><SOAP-ENV:Envelope xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:ns='urn:xtk:session' xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'><SOAP-ENV:Body><Encrypt xmlns='urn:xtk:session' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><__sessiontoken xsi:type='xsd:string'></__sessiontoken><strDecrypted xsi:type='xsd:string'>${stringToEncrypt}</strDecrypted></Encrypt></SOAP-ENV:Body></SOAP-ENV:Envelope>"
  useXMLLint && { echo "${APISoapBody}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -ne 0 ] && echo "${RED_COL}ALERT:${RESET_COL} Bad XML request body" && return $iRc
  local opipefailVal='+'
  [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
  set -o pipefail
  soap xtk:session#Encrypt "${APISoapBody}" | getXMLAttrVal pstrEncrypted NULL
  iRc=$?
  set ${opipefailVal}o pipefail
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} EncryptAPI Failed." | STDERR || return $iRc; }
}
function soapCreateTrackingInstanceShellAPI {
  local iRc=0
  if _CONTAINS -h "$@" ; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] [-f (force create)] [<tracking-instance-name>] [<tracking-instance-web-url>]  [<tracking-instance-hostmask>] [<tracking-password>] [<instance-internal-password>]"
    return
  fi
  local forceCreate
  _CONTAINS -f "$@" && shift && forceCreate=1
  [[ -z ${SESSION_TOKEN} ]] && soapLogOnAPI
  iRc=$?
  [[ -z ${SESSION_TOKEN} ]] && return $iRc
  local isRemote
  [[ $(soap_rtest 2>/dev/null | xmlize | getXMLAttrVal redir sourceIP) != $(getIP) ]] && isRemote=1
  local TRK_INST_NAME=$1 TRK_INST_URL=$2 TRK_INST_HOST_MASK=$3 TRK_PASSWORD=$4 INTERNAL_PASSWORD=$5
  TRK_INST_NAME=${TRK_INST_NAME:=trk-inst}
  TRK_INST_URL=${TRK_INST_URL:=$(echo https://${TRK_INST_NAME}-$(hostname --fqdn))}
  TRK_INST_URL=$(grep -E "^\s*(http://|https://|[[:alnum:]])[[:alnum:]][.[:alnum:]-]+[[:alnum:]](:([1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5]))?\s*$" <<< ${TRK_INST_URL})
  TRK_INST_URL="$(trim ${TRK_INST_URL})"  # trim spaces
  if [ -z "${TRK_INST_URL}" ]; then
    echo "Bad Trcking instance URL ! " | STDERR
    return 1
  fi
  local host=${TRK_INST_URL##*//}
  host=${host##:*}
  if [[ ! -z $isRemote ]]; then
    soapUpdateTrackingInfo ' ' ' ' ' ' 'none'
    echo "Remote host is another machine. Please ensure that ${host} is accseesible/DNS resolvable from remote machine too. Login to remote machine and and edit its hosts file to create a entry for ${host}"
    [[ ! -z ${forceCreate} ]] && echo "Stop campaign server. Remove/backup tracking instance config file.Restart server."
    read -p "Once done come back here and Press any key to continue..." yn
    isHostAlive ${host} || add2HostsFile ${SOAP_HOST} ${host} ${FUNCNAME[0]}
  else
    if [[ ! -z ${forceCreate} && -f $(getCampRoot)/nl/build/ncs/conf/config-${TRK_INST_NAME}.xml ]]; then
        soapUpdateTrackingInfo ' ' ' ' ' ' 'none'
        local backUpDir=$(getBackupLocation '')
        pushd .
        2conf
        echo "${GREEN_COL}INFO:${RESET_COL} Back-up tracking instance config file to ${backUpDir} folder."
        mkdir -p ${backUpDir}
        cp -p -v -i $(getCampRoot)/nl/build/ncs/conf/config-${TRK_INST_NAME}.xml ${backUpDir}/
        rm -f $(getCampRoot)/nl/build/ncs/conf/config-${TRK_INST_NAME}.xml
        nls config -reload
        popd
    fi
    isHostAlive ${host} || add2HostsFile $(hostname --fqdn) ${host} ${FUNCNAME[0]}
  fi
  isHostAlive ${host} || { echo "Tracking URL ${YELLOW_COL}${host##:*}${RESET_COL} not reachable !" | STDERR || return $(errno ENONET | cut -d ' ' -f2); }
# [[ ! -z ${TRK_INST_HOST_MASK} ]]  || { TRK_INST_HOST_MASK=${TRK_INST_URL##*//}; TRK_INST_HOST_MASK="${TRK_INST_HOST_MASK%%.*}*"; }
  [[ ! -z ${TRK_INST_HOST_MASK} ]] || TRK_INST_HOST_MASK="${TRK_INST_NAME}*"
  TRK_PASSWORD=${TRK_PASSWORD:=$(soapEncryptAPI)}
  INTERNAL_PASSWORD=${INTERNAL_PASSWORD:=$(soapEncryptAPI)}
  local APISoapBody="<?xml version='1.0'?><SOAP-ENV:Envelope xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:ns='urn:nms:trackingUrl' xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'><SOAP-ENV:Body><CreateTrackingInstanceShell xmlns='urn:nms:trackingUrl' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><__sessiontoken xsi:type='xsd:string'></__sessiontoken><param xsi:type='xsd:string'>${INTERNAL_PASSWORD}</param><param xsi:type='xsd:string'>${TRK_INST_URL}</param><param xsi:type='xsd:string'>${TRK_INST_NAME}</param><param xsi:type='xsd:string'>${TRK_PASSWORD}</param><param xsi:type='xsd:string'>${TRK_INST_HOST_MASK}</param></CreateTrackingInstanceShell></SOAP-ENV:Body></SOAP-ENV:Envelope>"
  echo $APISoapBody
  useXMLLint && { echo "${APISoapBody}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -ne 0 ] && echo "${RED_COL}ALERT:${RESET_COL} Bad XML request body" && return $iRc
  local opipefailVal='+'
  [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
  set -o pipefail
  soap nms:trackingUrl#CreateTrackingInstanceShell "${APISoapBody}"
  iRc=$?
  set ${opipefailVal}o pipefail
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Failed." | STDERR || return $iRc; }
  echo "Commit tracking info into database ... "
  soapUpdateTrackingInfo $TRK_INST_NAME $TRK_PASSWORD $TRK_INST_URL tracking
  iRc=$?
  [[ $iRc -eq 0 ]] && [[ -z $isRemote ]] && nls config -reload
}
function soapRegisterExternalInstanceAPI {
  local iRc=0
  if _CONTAINS -h "$@" ; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)]  [<tracking-server-instance-name>] [<extAccount-mid-internal-name>] [<0/1>]..The api is called on mkt-server host/url on which tracking is to be enabled. In UI it is done when you click on 'Enable the tracking instance' button"
    return
  fi
  local MKT_INST_NAME=$1 ROUTING_MID_EXTACC_INTERNALNAME=$2
  [[ -z $MKT_INST_NAME ]] && { echo "Please specify mkt instance name on which to enable tracking." | STDERR || return 11; }
  getCampInstances | grep ${MKT_INST_NAME} > /dev/null
  [[ $? -eq 0 ]] || { echo "Not a valid mkt instance name." | STDERR || return 12; }
  ROUTING_MID_EXTACC_INTERNALNAME=${ROUTING_MID_EXTACC_INTERNALNAME:=defaultEmailMid}
  local queryDef="<queryDef operation='select' schema='nms:extAccount' xtkschema='xtk:queryDef'> \
    <select> \
      <node expr='@id'/> \
      <node expr='@label'/> \
    </select> \
    <where> \
      <condition expr='@name = \"${ROUTING_MID_EXTACC_INTERNALNAME}\"'/> \
    </where> \
  </queryDef>"
  local accountId=$(soapExecuteQueryAPI "${queryDef}" | getXMLAttrVal extAccount id)
  [[ ${accountId} -gt 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Bad external account." | STDERR || return 1; }
  local APISoapBody="<?xml version='1.0'?><SOAP-ENV:Envelope xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:ns='urn:nms:trackingUrl' xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'><SOAP-ENV:Body><RegisterExternalInstance xmlns='urn:nms:trackingUrl' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><__sessiontoken xsi:type='xsd:string'></__sessiontoken><param xsi:type='xsd:string'>${ROUTING_MID_EXTACC_INTERNALNAME}</param><param xsi:type='xsd:string'>${MKT_INST_NAME}</param><param xsi:type='xsd:string'></param><param xsi:type='xsd:boolean'>0</param></RegisterExternalInstance></SOAP-ENV:Body></SOAP-ENV:Envelope>"
  echo $APISoapBody
  useXMLLint && { echo "${APISoapBody}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -ne 0 ] && echo "${RED_COL}ALERT:${RESET_COL} Bad XML request body" && return $iRc
  local opipefailVal='+'
  [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
  set -o pipefail
  soap nms:trackingUrl#RegisterExternalInstance "${APISoapBody}"
  iRc=$?
  set ${opipefailVal}o pipefail
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Failed." | STDERR || return $iRc; }
  [[ $iRc -eq 0 ]] && nls config -reload
}
function soapCreateTrackingInstanceAPI {
  local iRc=0
  if _CONTAINS -h "$@" ; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] [<tracking-instance-web-url>] [<tracking-instance-web-secure-url>] [<tracking-instance-name-as-on-tracking-server>] [<tracking-password>] [<instance-internal-password>] [<tracking-server-url-list>] [<host>]"
    return
  fi
  [[ -z ${SESSION_TOKEN} ]] && soapLogOnAPI
  iRc=$?
  [[ -z ${SESSION_TOKEN} ]] && return $iRc
  local TRK_INST_URL=$1 TRK_INST_SURL=$2 TRK_INST_NAME=$3 TRK_PASSWORD=$4 INTERNAL_PASSWORD=$5 TRK_SERVER_URL_LIST=$6 T_HOST=$7
  TRK_INST_URL=${TRK_INST_URL:=$(echo https://trk-inst-$(hostname --fqdn))}
  TRK_INST_URL=$(grep -E "^\s*(http://|https://|[[:alnum:]])[[:alnum:]][.[:alnum:]-]+[[:alnum:]](:([1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5]))?\s*$" <<< ${TRK_INST_URL})
  TRK_INST_URL="$(sed -r 's/^\s+//' <<< ${TRK_INST_URL} | sed -r 's/\s+$//')"  # trim spaces
  if [ -z "${TRK_INST_URL}" ]; then
    echo "Bad Tracking instance URL ! " | STDERR
    return 1
  fi
  TRK_INST_SURL=${TRK_INST_SURL:=$(echo https://trk-inst-$(hostname --fqdn))}
  TRK_INST_SURL=$(grep -E "^\s*(https://|[[:alnum:]])[[:alnum:]][.[:alnum:]-]+[[:alnum:]](:([1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5]))?\s*$" <<< ${TRK_INST_SURL})
  TRK_INST_SURL="$(sed -r 's/^\s+//' <<< ${TRK_INST_SURL} | sed -r 's/\s+$//')"  # trim spaces
  if [ -z "${TRK_INST_SURL}" ]; then
    echo "Bad Tracking instance secure URL ! " | STDERR
    return 1
  fi
  TRK_INST_NAME=${TRK_INST_NAME:=trk-inst}
  TRK_PASSWORD=${TRK_PASSWORD:=$(soapEncryptAPI)}
  INTERNAL_PASSWORD=${INTERNAL_PASSWORD:=$(soapEncryptAPI)}
  local APISoapBody="<?xml version='1.0'?><SOAP-ENV:Envelope xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:ns='urn:nms:trackingUrl' xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'><SOAP-ENV:Body><CreateTrackingInstance xmlns='urn:nms:trackingUrl' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><__sessiontoken xsi:type='xsd:string'></__sessiontoken><strInternalPwd xsi:type='xsd:string'>${INTERNAL_PASSWORD}</strInternalPwd><strServerUrl xsi:type='xsd:string'>${TRK_INST_URL}</strServerUrl><strSecureServerUrl xsi:type='xsd:string'>${TRK_INST_SURL}</strSecureServerUrl><strServerUrlList xsi:type='xsd:string'>${TRK_SERVER_URL_LIST}</strServerUrlList><strInstanceName xsi:type='xsd:string'>${TRK_INST_NAME}</strInstanceName><strCryptedPassword xsi:type='xsd:string'>${TRK_PASSWORD}</strCryptedPassword><strHost xsi:type='xsd:string'>${T_HOST}</strHost></CreateTrackingInstance></SOAP-ENV:Body></SOAP-ENV:Envelope>"
  echo $APISoapBody
  useXMLLint && { echo "${APISoapBody}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -ne 0 ] && echo "${RED_COL}ALERT:${RESET_COL} Bad XML request body" && return $iRc
  local opipefailVal='+'
  [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
  set -o pipefail
  soap nms:trackingUrl#CreateTrackingInstance "${APISoapBody}"
  iRc=$?
  set ${opipefailVal}o pipefail
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Failed." | STDERR || return $iRc; }
  [[ $iRc -eq 0 ]] && nls config -reload
}
function soapWriteApi
{
  local iRc=0
  if _CONTAINS -h "$@" ; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] [<xml-dom-to-write>]"
    return
  fi
  [[ -z ${SESSION_TOKEN} ]] && soapLogOnAPI
  iRc=$?
  [[ -z ${SESSION_TOKEN} ]] && return $iRc
  local domdoc=$1
  local APISoapBody="<?xml version='1.0'?><SOAP-ENV:Envelope xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:ns='urn:xtk:persist' xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'><SOAP-ENV:Body><Write xmlns='urn:xtk:persist' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><__sessiontoken xsi:type='xsd:string'></__sessiontoken>${domdoc}</Write></SOAP-ENV:Body></SOAP-ENV:Envelope>"
  useXMLLint && { echo "${APISoapBody}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -ne 0 ] && echo "${RED_COL}ALERT:${RESET_COL} Bad XML request body" && return $iRc
  local opipefailVal='+'
  [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
  set -o pipefail
  soap xtk:persist#Write "${APISoapBody}"
  iRc=$?
  set ${opipefailVal}o pipefail
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Failed." | STDERR || return $iRc; }
}
function soapExecuteQueryAPI {
  local iRc=0
  if _CONTAINS -h "$@"; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] <queryDef-xml-Dom>"
    return
  fi
  local queryDef="$@"
  if [[ $# -eq 0 && ! -t 0 ]]; then
      queryDef=$(cat)
  fi
  useXMLLint && { echo "${queryDef}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -ne 0 ] && echo "${RED_COL}ALERT:${RESET_COL} Bad queryDef xml Dom" && return $iRc
  [[ -z ${SESSION_TOKEN} ]] && { soapLogOnAPI | STDERR; }
  iRc=$?
  [[ -z ${SESSION_TOKEN} ]] && return $iRc
  local queryDef_Sample="<queryDef operation='select' schema='xtk:operator' xtkschema='xtk:queryDef'> \
    <select> \
      <node expr='@id'/> \
    </select> \
    <where> \
      <condition expr='@name = \"mid\"'/> \
    </where> \
  </queryDef>"
  local APISoapBody="<?xml version='1.0'?><SOAP-ENV:Envelope xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:ns='urn:xtk:queryDef' xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'><SOAP-ENV:Body><ExecuteQuery xmlns='urn:xtk:queryDef' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><__sessiontoken xsi:type='xsd:string'></__sessiontoken><entity xsi:type='ns:Element' SOAP-ENV:encodingStyle='http://xml.apache.org/xml-soap/literalxml'>${queryDef}</entity></ExecuteQuery></SOAP-ENV:Body></SOAP-ENV:Envelope>"
  useXMLLint && { echo "${APISoapBody}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -ne 0 ] && echo "${RED_COL}ALERT:${RESET_COL} Bad XML request body" && return $iRc
  local opipefailVal='+'
  [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
  set -o pipefail
  soap xtk:queryDef#ExecuteQuery "${APISoapBody}"
  iRc=$?
  set ${opipefailVal}o pipefail
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Failed." | STDERR || return $iRc; }
}
function soapGetSchema {
  if _CONTAINS -h "$@" || [ $# -ne 1 ] || [[ ! ${1} =~ [^:]+:[^:]+ ]]; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] <namespace:schema>"
    return
  fi
  [[ -z ${SESSION_TOKEN} ]] && soapLogOnAPI | STDINFO

  local namespace=${1%%:*}
  local schema=${1##*:}
  [[ "${namespace}" = "${schema}" ]] && [[ ! "${namespace}" = '*' ]]  && namespace=xtk
  namespace=${namespace//\*/\%}
  namespace=${namespace,,}

  schema=${schema//\*/\%}
  schema=${schema,,} # convert it to lower case for comparison below.
  local queryDef="<queryDef operation='select' schema='xtk:entity' xtkschema='xtk:queryDef'> \
    <select> \
      <node expr='[data]'/> \
    </select> \
    <where> \
      <condition expr='@entitySchema = \"xtk:schema\"'/> \
      <condition expr='Lower(@namespace) like \"${namespace}\"'/> \
      <condition expr='Lower(@name) like \"${schema}\"'/> \
    </where> \
  </queryDef>"
  echo $queryDef
  local iRc
  local schemaCount=0
  echo "<?xml version='1.0'?>" > ${TMP}/${FUNCNAME[0]}
  soapExecuteQueryAPI "${queryDef}" | xmllint --xpath '/*[local-name()="Envelope"]/*[local-name()="Body"]/*[name()="ExecuteQueryResponse"]/*[name()="pdomOutput"]/*[name()="entity-collection"]' - | sed -e 's,<entity ,<schema ,g' -e 's,</entity>,</schema>,g' >> ${TMP}/${FUNCNAME[0]}
  iRc=$?
  [[ $iRc -eq 0 ]] && schemaCount=$(xmllint --xpath '//entity-collection/schema/@namespace|//entity-collection/schema/@name' ${TMP}/${FUNCNAME[0]} | cut -f2 -d\" | awk 'NR%2{line=$0} !(NR%2){printf("%s:%s\n",$0,line)}' | tee ${TMP}/${FUNCNAME[0]}.1 | wc -l)
  [[ $schemaCount -lt 2 ]] && sed -i -e 's,<entity-collection>,,g' -e 's,</entity-collection>,,g' ${TMP}/${FUNCNAME[0]}
  xmllint --format ${TMP}/${FUNCNAME[0]} && [[ ${schemaCount} -gt 0 ]]
  [[ ${schemaCount} -gt 1 ]] && { cat ${TMP}/${FUNCNAME[0]}.1 | nl | STDINFO; }
  rm -f ${TMP}/${FUNCNAME[0]} ${TMP}/${FUNCNAME[0]}.1
  return $iRc
}

function soapUpdateTrackingInfo {
  local iRc=0
  [[ -z ${SESSION_TOKEN} ]] && soapLogOnAPI
  iRc=$?
  [[ -z ${SESSION_TOKEN} ]] && return $iRc
  local TRK_INST_NAME=$1 TRK_PASSWORD=$2 TRK_INST_URL=$3 IMG_PUBLISH_METHOD=$4 OPERATOR=$5
  TRK_INST_NAME=${TRK_INST_NAME:=trk-inst}
  TRK_PASSWORD=${TRK_PASSWORD:=${DEFAULT_PASSWORD}}
  TRK_INST_URL=${TRK_INST_URL:=$(echo https://${TRK_INST_NAME}-$(hostname --fqdn))}
  IMG_PUBLISH_METHOD=${IMG_PUBLISH_METHOD:="tracking"}
  OPERATOR=${OPERATOR:="mid"}
#  local operatorId=$(csql -t -c "select ioperatorid from xtkoperator where sname='${OPERATOR}'" | sed -r 's/^\s*([^\s]*).*$/\1/g')
  local queryDef="<queryDef operation='select' schema='xtk:operator' xtkschema='xtk:queryDef'> \
    <select> \
      <node expr='@id'/> \
    </select> \
    <where> \
      <condition expr='@name = \"${OPERATOR}\"'/> \
    </where> \
  </queryDef>"
  local operatorId=$(soapExecuteQueryAPI "${queryDef}" | getXMLAttrVal operator id)
  local domdoc="<domDoc xsi:type='ns:Element' SOAP-ENV:encodingStyle='http://xml.apache.org/xml-soap/literalxml'><operator _operation='update' _unicityCheck='false' id='${operatorId}' xtkschema='xtk:operator'><tracking instance='${TRK_INST_NAME}' password='${TRK_PASSWORD}' servers='${TRK_INST_URL}'/><imagePublishing method='${IMG_PUBLISH_METHOD}'/></operator></domDoc>"
  soapWriteApi "${domdoc}"
}
function soapGetXtkOption {
  local optName=$1
  local l_host=$2
  local iRc=0
  [[ -z ${SESSION_TOKEN} ]] && { soapLogOnAPI ${l_host} | STDERR; iRc=$?; }
  [[ -z ${SESSION_TOKEN} ]] && return $iRc
  function __getType {
    [ $1 -eq 12 ] && echo "memoValue/xml/long text/"               && return
    [ $1 -eq 7 ]  && echo "@timeStampValue/timestamp/datetime/"    && return
    [ $1 -eq 6 ]  && echo "@stringValue/string/text/varchar(255)"  && return
    [ $1 -eq 5 ]  && echo "@doubleValue/double/float/"             && return
    [ $1 -eq 3 ]  && echo "@longValue/long/integer/"               && return
    echo "@stringValue/string/text/varchar(255)"
  }
  local getTypeQueryDef="<queryDef operation='select' schema='xtk:option' xtkschema='xtk:queryDef'> \
    <select> \
      <node expr='@dataType'/> \
    </select> \
    <where> \
      <condition expr='@name = \"${optName}\"'/> \
    </where> \
  </queryDef>"
  local optionDataType=$(soapExecuteQueryAPI "${getTypeQueryDef}" | getXMLAttrVal option dataType)
  [[ -z ${optionDataType} ]] && { echo "${RED_COL}Alert:${RESET_COL} Option ${YELLOW_COL}${optName}${RESET_COL} not found" | STDERR; return $(errno ENOENT | cut -d ' ' -f2); }
  optionDataType=$(__getType ${optionDataType}) # Get all alternatives of a given type.
  optionDataType=${optionDataType%%/*}          # Get First valueType among alternatives.
  unset -f __getType
  local getValueQueryDef="<queryDef operation='select' schema='xtk:option' xtkschema='xtk:queryDef'> \
    <select> \
      <node expr='${optionDataType}'/> \
    </select> \
    <where> \
      <condition expr='@name = \"${optName}\"'/> \
    </where> \
  </queryDef>"
  soapExecuteQueryAPI "${getValueQueryDef}" | getXMLTagVal ${optionDataType##@}
}

function soapGetTrackingLogs {
  local iRc=0
  if _CONTAINS -h "$@"; then
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]}  [-[h|H] (help)] <mid-host> <mkt-host> [total number of logs to fetech] [TRACKING POINTER]"
    return
  fi
  local iRc
  local l_MidTrkhost=$1
  local l_MktTrkhost=$2
  local logCount=$3
  shift; shift; shift;
  local TRK_PTR="$@"
  soap_rtest -s ${l_MktTrkhost} || { echo "Mkt Host ${l_MktTrkhost} unreachable" | STDERR; return 2; }
  soapLogOutAPI
  soapLogOnAPI -s ${l_MktTrkhost}
  local TRK_INST_NAME=$(soapGetXtkOption NmsTracking_Instance)
  local MKT_DATABASE_ID=$(soapGetXtkOption XtkDatabaseId )
  TRK_PTR=${TRK_PTR:=$(soapGetXtkOption NmsTracking_Pointer)}
  TRK_PTR="$(echo ${TRK_PTR} | sed -r -e '/^[\r\n[:blank:]]*$/ d' -e ":a;N;\$!ba;s,[\r]?\n,,g" | sed -e 's,<,\&lt\;,g'  -e 's,>,\&gt\;,g' -e "s,',\&#39\;,g" -e 's,\",\&quot\;,g')"
  local nTrackingServers=$(expr $(echo "${TRK_PTR}" | grep -o lastMsgId | wc -l) - 1)
  [[ ${nTrackingServers} -gt 1 ]] || { echo "${YELLOW_COL}WARN:${RESET_COL} No tracking servers found in tracking pointer." | STDWARN; }
  logCount=${logCount:=$[${nTrackingServers}*9999]}
  local APISoapBody="<?xml version='1.0'?><SOAP-ENV:Envelope xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:ns='urn:nms:remoteTracking' xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'><SOAP-ENV:Body><GetTrackingLogs xmlns='urn:nms:remoteTracking' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><__sessiontoken xsi:type='xsd:string'></__sessiontoken><strInstance xsi:type='xsd:string'>${TRK_INST_NAME}</strInstance><strDbId xsi:type='xsd:string'>${MKT_DATABASE_ID}</strDbId><lVersion xsi:type='xsd:int'>6</lVersion><strPointer xsi:type='xsd:string'>${TRK_PTR}</strPointer><lLogCount xsi:type='xsd:int'>${logCount}</lLogCount></GetTrackingLogs></SOAP-ENV:Body></SOAP-ENV:Envelope>"
  useXMLLint && { echo "${APISoapBody}" > /tmp/api.xml; xmllint --noout /tmp/api.xml > /dev/null 2>&1; iRc=$?; }
  [ $iRc -ne 0 ] && { echo "${RED_COL}ALERT:${RESET_COL} Bad XML request body"; return $iRc; }
  echo "${APISoapBody}"
  soap_rtest -s ${l_MidTrkhost} || { echo "Mid Host ${l_MidTrkhost} unreachable" | STDERR; return 1; }
  soapLogOutAPI
  soapLogOnAPI -s ${l_MidTrkhost}
  iRc=$?
  [[ -z ${SESSION_TOKEN} ]] && return $iRc
  local opipefailVal='+'
  [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
  set -o pipefail
  soap nms:remoteTracking#GetTrackingLogs "${APISoapBody}"
  iRc=$?
  set ${opipefailVal}o pipefail
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Failed." | STDERR || return $iRc; }
}
function sendDelivery {
    local instance_param posN=1
    for arg in "$@"; do
      if [[ $arg =~ ^-instance:.+$ ]]; then
        getCampInstances | grep -E "^${arg#-instance:}$" > /dev/null
        [[ $? -ne 0 ]] && echo "Instance ${YELLOW_COL}${arg#-instance:}${RESET_COL} not available !." && return 1;
        instance_param=$arg
        set -- "${@:1:posN-1}" "${@:posN+1}"
        break
      fi
      if [[ $arg =~ ^[-/][-]?[hH?].*$ ]]; then
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [internal_name] [recepients_qualifier] [-instance:<instance_name>]
          -h,-H,-Help,--help,/?      This help documentation.
          internal_name              String Optional. of the template which will be used for this delivery.'mail' is default.
          recepients_qualifier       String Optional(max 64 alnum, !#$%&*+-/=?^_'.{|}~. Matches email's local part of the recipient you want to send the delivery to.'+' is default.
          instance_name              String Optional. of the instance via which you want to send delivery.
          " | STDERR
          return $(errno ECANCELED | cut -d ' ' -f2)
      fi
      posN=$[${posN}+1]
    done
    pushd .
    2conf
    local smtpRelayServer=$(cat *.xml | xmlize | getXMLAttrVal relay address)
    local smtpRelayPort=$(cat *.xml | xmlize | getXMLAttrVal relay port)
    popd > /dev/null
    [[ -z $smtpRelayPort ]] || [[ -z $smtpRelayServer ]] || ! isPortListening $smtpRelayPort $smtpRelayServer && { echo "Mailserver not configured. There may be issues sending deliveries." | STDERR; read -p "Press any key to continue...Press Ctrl+C to abort" yn; [[ $? -eq 0 ]] && runFakeSmtpServer; }
    local trackingIsConfigured=false
    [[ $(getXtkOption NmsTracking_Available) -eq 1 ]] && trackingIsConfigured=true

    local sendDeliveryJS="
    // #!/usr/local/bin/nljs
    // it is assumed that  from/Replyto/subject and Body fields of the template already populated via UI.
    loadLibrary('xtk:shared/nl.js');
    function replaceAll(s, array_of_pattern_replacement_pairs, reverse, ignorecase) {
        if (typeof(reverse) === 'undefined') { reverse = false; }
        if (typeof(reverse) === 'undefined') { ignorecase = false; }
        for ( var pat in array_of_pattern_replacement_pairs) {
            var p=pat, r=array_of_pattern_replacement_pairs[p], q='g';
            if(reverse)
                r = [p, p = r][0];
            if(ignorecase)
                q+='i';
            s=s.replace(new RegExp(p, q), r);
        }
        return s;
    }
    // Handle <%, <%==, %>, <%=, <%@, %>
    var uuid;
    // uuid=$(getUUID);
    var dict = [];
    dict['<%=='] = '__SCRIPT_ENCODE2;'    + uuid;
    dict['<%=' ] = '__SCRIPT_ENCODE1;'    + uuid;
    dict['<%@' ] = '__SCRIPT_ENCODE_ALL;' + uuid;
    dict['<%'  ] = '__BEGIN_SCRIPT;'      + uuid;
    dict['%>'  ] = '__END_SCRIPT;'        + uuid;

    var cmd_args = application.arg.split(',')
    if ( cmd_args[0] === '' ) { cmd_args[0]='mail'; }
    if ( cmd_args[1] === '' ) { cmd_args[1]='+';    }
    var email_template_internal_name=cmd_args[0];
    var email_name_filter=cmd_args[1]
    logInfo('using delivery template \\'' + email_template_internal_name + '\\' and recipient email localpart name filter \\'' + email_name_filter + '\\'');
    logInfo('Ensure that the email template has all relevant fields(except for recipeint) filled in...');
    var qry = xtk.queryDef.create(<queryDef schema='nms:delivery' operation='getIfExists'>
        <where>
          <condition expr={ \"@isModel = 1 and @internalName = '\" + email_template_internal_name + \"'\"}/>
        </where>
      </queryDef>);
    qry.SelectAll(true);
    var delivery=qry.GetInstanceFromModel('nms:delivery')
    delivery.@label=email_name_filter;
    delivery.scheduling.@validationMode= 'auto';
    delivery.mailParameters.senderAddress='rlycin@${ADOBE_DOMAIN}';
    delivery.mailParameters.replyAddress='$(whoami)@${ADOBE_DOMAIN}';
    delivery.mailParameters.senderName='rlycin';
    delivery.mailParameters.replyName='$(whoami)';
    delivery.mailParameters.subject='With mkt id: ' + delivery.@id + ', mkt internal name: ' + delivery.@internalName + ' , internal name: <%= delivery.internalName %>, id: <%= delivery.id %>:' + delivery.mailParameters.subject;
    var whereCondition=\"@email LIKE '%' + '\" + email_name_filter + \"' + '%'\"
    var s=String(delivery.content.html.source);
    if( s.length === 0 )
        s='<html><head/><body/></html>'
    else
        s=String(delivery.content.html.source).replace(new RegExp('<!DOCTYPE [^>]+>\\\s*','i'),'');
    s=replaceAll(s,dict);
    var xmlsrc = new XML(s);
    var subjectStr=replaceAll(String(delivery.mailParameters.subject), dict);
    if( xmlsrc.body.toXMLString().length && xmlsrc.body.children()[0] ) {
        xmlsrc.body.insertChildBefore(xmlsrc.body.children()[0], <p>{subjectStr}</p>); }
    else
        xmlsrc.body.appendChild(<p>{subjectStr}</p>);
    s=xmlsrc.toString();
    s=replaceAll(s,dict, true);
    delivery.content.html.source=s;

    delivery.targets.deliveryTarget.targetPart.where.condition.@expr = whereCondition;
    logInfo(delivery.targets.deliveryTarget.targetPart.where.toXMLString());
    delivery.execution.@maxRetry=10;
    delivery.execution.@retryPeriod=60;
    if ( ! ${trackingIsConfigured}  ) {
        delivery.tracking.@enabled=false;
        delivery.tracking.@openEnabled=false;
    }
    nms.delivery.SubmitDelivery(email_template_internal_name, delivery);
    "
    local jsFile=${TEMP}/${FUNCNAME[0]}_$(date '+%s').js
    echo "${sendDeliveryJS}" > ${jsFile}
    nls javascript ${instance_param}  -arg:$1,$2 -file "$(native ${jsFile})"
    rm -f ${jsFile}
}
function organize {
  if _CONTAINS -h "$@" || _CONTAINS -H "$@"  || _CONTAINS -? "$@"; then
    echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [-h,-H,-?] [folder_to_organize -- default current folder ] [split_duration -- default 60min ]
    " | STDERR
    return $(errno ECANCELED | cut -d ' ' -f2)
  fi
  local dir_2_organize=${1} duration_in_mins=${2}
  dir_2_organize=${dir_2_organize:='.'}
  dir_2_organize="$(readlink -f ${dir_2_organize})"
  duration_in_mins=${duration_in_mins:=60}
  while [ true ]
    do
      local dest=$(getBackupLocation $(basename ${dir_2_organize})_upto)
      mkdir ${dest}
      local startTime=$(date '+%s')
      if isCygwin; then
        wps -Command "\$d=(Get-Date).AddMinutes(-${duration_in_mins}); \$files=Get-ChildItem -Path '$(native ${dir_2_organize/})' | Where-Object { \$_.CreationTime.Date -gt \$d } ; Move-Item \$files -Destination $(native $dest/)"
      else
        find ${dir_2_organize} -maxdepth 1 -type f -mmin +${duration_in_mins} -exec mv ${dest} {} \;
      fi
      local endTime=$(date '+%s')
      sleep $(expr 1 + ${duration_in_mins} - \( ${endTime} - ${startTime}  / 60 \) )
      # if [[ $(find ${dir_2_organize}  -maxdepth 0 -empty | wc -l) -eq 0 ]]; then
        # [[ ${duration_in_mins} -gt 1 ]] && duration_in_mins=$(( duration_in_mins >> 1 ))
      # else
        # # Directory is empty.
        # duration_in_mins=${2}
        # duration_in_mins=${duration_in_mins:=60}
    done
}

function getXtkOption {
    local instance_param posN=1 db verbose=false
    [[ $# -eq 0 ]] && { exec_command_exists nlserver && db=$(getCampaignDatabase) && complete -W "$(csql -Atq --pset=pager=off -d ${db} -c 'select sname from xtkoption' | xargs)" ${FUNCNAME[0]}; echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [-h(elp)] [-instance:<instance_name>] <xtkoption-1> <xtkoption-2> ...
          -h,-H,-Help,--help,/?      This help documentation.
          -v,-V,--verbose            Prints the data type of option.
          xtkoption-n                String Ateast one is Mandatory.
          instance_name              String Optional. Campaign instance you want to query for.
          "; return $(errno EINVAL | cut -d ' ' -f2) ; }
    for arg in "$@"; do
      if [[ $arg =~ ^-instance:.+$ ]]; then
        getCampInstances | grep -E "^${arg#-instance:}$" > /dev/null
        [[ $? -ne 0 ]] && echo "Instance ${YELLOW_COL}${arg#-instance:}${RESET_COL} not available !." && return 1;
        instance_param=$arg
        db=$(getCampaignDatabase ${arg#-instance:}) && complete -W "$(csql -Atq --pset=pager=off -d ${db} -c 'select sname from xtkoption' | xargs)" ${FUNCNAME[0]}
        set -- "${@:1:posN-1}" "${@:posN+1}"
        break
      fi
      if [[ $arg =~ ^[-/][-]?[hH?].*$ ]]; then
        db=$(getCampaignDatabase) && complete -W "$(csql -Atq --pset=pager=off -d ${db} -c 'select sname from xtkoption' | xargs)" ${FUNCNAME[0]}
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [-h(elp)] [-instance:<instance_name>] <xtkoption-1> <xtkoption-2> ...
          -h,-H,-Help,--help,/?      This help documentation.
          xtkoption-n                String Ateast one is Mandatory.
          instance_name              String Optional. Campaign instance you want to query for.
          ";
          return $(errno ECANCELED | cut -d ' ' -f2)
      fi
      if [[ $arg =~ ^[-/][-]?[vV?].*$ ]]; then
        verbose=true
        set -- "${@:1:posN-1}" "${@:posN+1}"
      fi
      posN=$[${posN}+1]
    done
    local getOptionJS="
    // #!/usr/local/bin/nljs
    loadLibrary('xtk:shared/nl.js');
    var cmd_args = application.arg.split(',');
    for each(var xtkoption in cmd_args) {
        var val=getOption(xtkoption);
        if( ${verbose} )
          logInfo(val + ' (JS data type is ' + typeof val + ')');
        else
          logInfo(val);
    }
    "
    local jsFile=${TEMP}/${FUNCNAME[0]}_$(date '+%s').js
    echo "${getOptionJS}" > ${jsFile}
    local opts=$@
    # nls javascript ${instance_param}  -arg:${opts// /,} -file "$(native ${jsFile})" 2>/dev/null | awk 'f;/.*Executing JavaScript.*/{f=1}' | awk -v m="\x01" -v N="3" '{$N=m$N; print substr($0,index($0,m)+1)}' | tr -d '\r'
    nls javascript ${instance_param}  -arg:${opts// /,} -file "$(native ${jsFile})" 2>/dev/null | awk 'f;/.*Executing JavaScript.*/{f=1}' | sed -r -e 's,^[:[:digit:]]+\s+>\s+,,g' -e 's,\r$,,g'
    rm -f ${jsFile}
}
function setXtkOption {
    local instance_param posN=1 db optionType skipNextArg=0 force delete xtkOptID iRc=0
    exec_command_exists nlserver && db=$(getCampaignDatabase)
    [[ $# -eq 0 ]] && { complete -W "$(csql -Atq --pset=pager=off -d ${db} -c 'select sname from xtkoption' | xargs)" ${FUNCNAME[0]}; echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [-h(elp)] [-[-]type <option_type>] [-[-]force] [-instance:<instance_name>] <xtkOptionName> <xtkOptionValue> ...
          xtkOptionName              String Mandatory. Name of the option you want to update/create.
          xtkOptionValue             String Mandatory. Value of the option you want to update/create.
          instance_name              String Optional.  Campaign instance you want to query for. Default: $(getCampaignDatabase)
          -t,--type,/type            String Optional . Option Type: Can be int, float,string,date,xml/longtext
          -f,--force,/force          String Optional . Force create option by first deleting it.
          -d,--delete,/delete        String Optional . Delete given XtOption. <xtkOptionValue> not reqd.
          -h,-H,-Help,--help,/?      This help documentation.
          "; return $(errno EINVAL | cut -d ' ' -f2) ; }
    function __getType {
      [ $1 -eq 12 ] && echo "memoValue/xml/long text/"               && return # memoValue is element and not an attribute.
      [ $1 -eq 7 ]  && echo "@timeStampValue/timestamp/datetime/"    && return
      [ $1 -eq 6 ]  && echo "@stringValue/string/text/varchar(255)"  && return
      [ $1 -eq 5 ]  && echo "@doubleValue/double/float/"             && return
      [ $1 -eq 3 ]  && echo "@longValue/long/integer/"               && return
      echo "stringValue/string/text/varchar(255)"
    }
    for arg in "$@"; do
        if [ ${skipNextArg} != 0 ]; then
            skipNextArg=0
        continue
      fi
      if [[ $arg =~ ^-instance:.+$ ]]; then
        getCampInstances | grep -E "^${arg#-instance:}$" > /dev/null
        [[ $? -ne 0 ]] && echo "Instance ${YELLOW_COL}${arg#-instance:}${RESET_COL} not available !." && iRc=1 && break;
        instance_param=$arg
        db=$(getCampaignDatabase ${arg#-instance:}) && complete -W "$(csql -Atq --pset=pager=off -d ${db} -c 'select sname from xtkoption' | xargs)" ${FUNCNAME[0]}
        set -- "${@:1:posN-1}" "${@:posN+1}"
        posN=$[${posN}-1]
      fi
      if [[ $arg =~ ^[-/][-]?[hH?].*$ ]]; then
        db=$(getCampaignDatabase) && complete -W "$(csql -Atq --pset=pager=off -d ${db} -c 'select sname from xtkoption' | xargs)" ${FUNCNAME[0]}
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [-h(elp)] [-[-]type <option_type>] [-[-]force] [-instance:<instance_name>] <xtkOptionName> <xtkOptionValue> ...
          xtkOptionName              String Mandatory. Name of the option you want to update/create.
          xtkOptionValue             String Mandatory. Value of the option you want to update/create.
          instance_name              String Optional . Campaign instance you want to query for. Default: $(getCampaignDatabase)
          -t,--type,/type            String Optional . Option Type: Can be int, float,string,date,xml/longtext
          -f,--force,/force          String Optional . Force create option by first deleting it.
          -d,--delete,/delete        String Optional . Delete given XtOption.
          -h,-H,-Help,--help,/?      This help documentation.
          "; iRc=$(errno ECANCELED | cut -d ' ' -f2); break
      fi
      if [[ $arg =~ ^[-/][-]?[fF].*$ ]]; then
        force=1
        set -- "${@:1:posN-1}" "${@:posN+1}"
        posN=$[${posN}-1]
      fi
      if [[ $arg =~ ^[-/][-]?[dD].*$ ]]; then
        delete=1
        force=1
        set -- "${@:1:posN-1}" "${@:posN+1}"
        posN=$[${posN}-1]
      fi
      if [[ $arg =~ ^[-/][-]?[tT].*$ ]]; then
        set -- "${@:1:posN-1}" "${@:posN+1}"
        optionType="${!posN}"
        if [[ ! -z ${optionType} ]]; then
            set -- "${@:1:posN-1}" "${@:posN+1}"
            local dataType=6
            case ${optionType,,} in
               longtext|m*|r*|x*)   dataType=12  ;;
               date|time|da*|time*) dataType=7   ;;
               string|s*|t*)        dataType=6   ;;
               float|f*|do*)        dataType=5   ;;
               int|i*|l*|n*)        dataType=3   ;;
               *) echo -ne "Default to "         ;;
            esac
            optionType=${dataType}
            echo "Using datatype $(__getType $optionType)"
        fi
        posN=$[${posN}-1]
        skipNextArg=1
      fi
      posN=$[${posN}+1]
    done
    [[ $iRc -ne 0 ]] && { unset -f __getType; return $iRc; }
    [[ -z ${db} ]]      && { unset -f __getType; echo "No configured database found" | STDERR || return 2; }
    [[ -z ${1} ]]       && { unset -f __getType; echo "No xtkoption specified." | STDERR || return $(errno EINVAL | cut -d ' ' -f2); }
    [[ ! -z ${force} ]] && { csql -d ${db} -c "delete from xtkoption where sname='$1'"; local iRc=$?; [[ ! -z ${delete} ]] && unset -f __getType && return $iRc; }
    [[ -z $2 ]]         && { unset -f __getType; echo "No xtkoption value specified." | STDERR || return $(errno EINVAL | cut -d ' ' -f2); }
    local existingDataType=$(csql -d ${db} -Atq -c "select idatatype from xtkoption where sname='$1'")
    [[ ! -z ${existingDataType} && ! -z ${optionType} && ${existingDataType} -ne ${optionType} ]] && echo "${RED_COL}ALERT:${RESET_COL} Can not change type from $(__getType ${existingDataType}) to $(__getType ${optionType}) of an existing xtkoption..Use -f command line option to force create this xtkoption." && unset -f __getType && return 2
    unset -f __getType
    [[ ! -z ${optionType} ]] && xtkOptID=$(csql -d ${db} -Atq -c 'select ioptionid from xtkoption order by ioptionid desc limit 1') && xtkOptID=$[${xtkOptID}+100] && csql -d ${db} -c "insert into xtkoption(sname,idatatype,ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('$1', ${optionType}, ${xtkOptID},now(),now(),now())" > /dev/null 2>&1 # dulicate id constraints if option is aleady present.
    local value="'$2'"
    [[ $2 =~ ^[[:digit:]]*(\.[[:digit:]]*)?$ ]] && [[ -z ${optionType} || ${optionType} -le 5 ]] && value=$2
    local setOptionJS="
    loadLibrary('xtk:shared/nl.js');
    logInfo('${1} Old Value: ' + getOption('${1}'));
    setOption('${1}',${value});
    logInfo('${1} New Value: ' + getOption('${1}'));
    "
    local jsFile=${TEMP}/${FUNCNAME[0]}_$(date '+%s').js
    echo "${setOptionJS}" > ${jsFile}
    local opts=$@
    # nls javascript ${instance_param}  -arg:${opts// /,} -file "$(native ${jsFile})" 2>/dev/null | awk 'f;/.*Executing JavaScript.*/{f=1}' | awk -v m="\x01" -v N="3" '{$N=m$N; print substr($0,index($0,m)+1)}' | tr -d '\r'
    nls javascript ${instance_param}  -file "$(native ${jsFile})"
    rm -f ${jsFile}
}
function getChangePasswordJS {
local campUser="$1"
if [ -z ${campUser} ]; then
  campUser='admin'
fi
changePasswordJS="
/*https://wiki.${ADOBE_CORP_DOMAIN}/pages/viewpage.action?spaceKey=neolane&title=How+to+change+admin+password+on+ACC*/
/* var password = application.arg ;*/
var password = \"${DEFAULT_PASSWORD}\" ;
xtk.session.Write(
  <operator xtkschema=\"xtk:operator\" _key=\"@name\" name=\"$campUser\">
    <access password={unreversibleCrypt(password)}/>
  </operator>);
"
echo "${changePasswordJS}";
}
function createFDAAccountOnMidJS {
  local FDA_DB_Name=$1
  local FDA_label="FDA_LOCAL"
  local FDA_internalName="FDA_LOCAL"
  local FDA_DB_Server
  [[ ${DB_SERVER} =~  ([^:]+)[:]?(.*) ]] && FDA_DB_Server=${BASH_REMATCH[1]//[[:space:]]/}
  local FDA_DB_Account="postgres"
  local FDA_DB_Account_Password=${PGPASSWORD}
  local Ext_Account_Type=7
  local tz="_server_"
  local email=$(whoami | cut -d '\' -f2)@${ADOBE_DOMAIN}
local FDAAccountOnMidJS=" /* var password = application.arg ;*/
var password = \"${FDA_DB_Account_Password}\";
xtk.session.Write(
  <extAccount xtkschema=\"nms:extAccount\" _key=\"@name\" name=\"${FDA_internalName}\" dbName=\"${FDA_DB_Name}\" account=\"${FDA_DB_Account}\" server=\"${FDA_DB_Server}\" active=\"true\" timezone=\"${tz}\" type=\"${Ext_Account_Type}\" label=\"${FDA_label}\" deliveryMode=\"1\" unicodeData=\"1\" provider=\"PostgreSQL\" packageAutoExport=\"0\" mobileConnector=\"127\" httpRelayTarget=\"true\" password={NLWS.xtkSession.EncryptPassword(password)}>
  </extAccount>);
xtk.session.Write(
  <group xtkschema=\"xtk:group\" _key=\"@name\" name=\"nms:extAccount:${FDA_internalName}\" label=\"nms:extAccount:${FDA_label}\">
  </group>);
var password = \"${DEFAULT_PASSWORD}\" ;
xtk.session.Write(
  <operator xtkschema=\"xtk:operator\" _key=\"@name\" name=\"fdahttps\" label=\"FDA over HTTPS\" email=\"${email}\">
    <access password={unreversibleCrypt(password)}/>
  </operator>);
"
  echo "${FDAAccountOnMidJS}";
}
function getUpdateSMPPConnectorJS {
  local SMPP_Host="127.0.0.1"
  local SMPP_Port="2775"
  local SMPP_User="smppclient"
  local SMPP_Password="${DEFAULT_PASSWORD}"
  if [ -n "$1" ]; then
    SMPPHost="$1"
  fi
local updateSMPPConnectorJS="/*https://wiki.${ADOBE_CORP_DOMAIN}/pages/viewpage.action?spaceKey=neolane&title=How+to+change+admin+password+on+ACC*/
/* var password = application.arg ;*/
var password = \"${SMPP_Password}\";
xtk.session.Write(
  <extAccount xtkschema=\"nms:extAccount\" _key=\"@name\" name=\"defaultSmsBulk\" account=\"${SMPP_User}\" server=\"${SMPP_Host}\" active=\"true\" activationMode=\"2\" messageType=\"1\" mobileConnector=\"127\" type=\"3\" port=\"${SMPP_Port}\" label=\"Fake/Test SMPP server\" password={NLWS.xtkSession.EncryptPassword(password)}>
  </extAccount>);
"
  echo "${updateSMPPConnectorJS}";
}
function getUpdateAAMConfig {
  if [ $# -gt 3 ]; then
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [dataSourceId] [destinationId]}>
          -h,h,help,-help,--help,?,/?   This help documentation.
          " | STDERR
    return
  fi
  local dataSourceId destinationId
  while test $# -gt 0
  do
    local larg=${1,,}
    case "$larg" in
      'h' | '-h' | 'help' | '-help' |'--help' | '?' | '/?')
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [dataSourceId] [destinationId]}>
          -h,h,help,-help,--help,?,/?   This help documentation.
          " | STDERR
        return
    ;;
    *)
      if [[ $1 =~ ^[0-9]*$ ]]; then
        if [ -z "${dataSourceId}" ]; then
          dataSourceId="$1"
        else
          destinationId="$1"
        fi
      else
        echo "dataSourceId and destinationId if specified must be integer" | STDERR
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [dataSourceId] [destinationId]}>
          -h,h,help,--help,?,/?      This help documentation.
          " | STDERR
          return
      fi
    ;;
    esac
    shift
  done
  dataSourceId=${dataSourceId:='0'}
  destinationId=${destinationId:='0'}
  local userFullName="$(getUserInfo -fullname)"
  local ORG_NAME="$(getUserInfo -org)"
  local updateAMCJS="
xtk.session.Write(
  <amcDataSource xtkschema=\"nms:amcDataSource\" _key=\"@name\" name=\"defaultDataSource\" termsAccepted=\"true\" termsAcceptedName=\"${userFullName}\" termsAcceptedTitle=\"${ORG_UNIT_NAME}\" termsAcceptedCompany=\"${ORG_NAME}\" dataSourceId=\"${dataSourceId}\" destinationId=\"${destinationId}\" >
  </amcDataSource>);
"
  echo "${updateAMCJS}";
}
function getUpdateIMSAccountJS {
  local IMS_CallbackServer IMS_env
  if [ $# -gt 4 ]; then
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [-i | --ims-env] <stage | prod> [-c | --callback-server] <$(hostname --fqdn)}>
          -h,h,help,-help,--help,?,/? This help documentation.
          -i,--ims-env  <ims env>     IMS Environment name e.g stage, prod... [default: stage]
          -c,--callback-server        The server which is acting as client to IMS. Is usually the  hostname of machine running campaign server.
          " | STDERR
        return
  fi
  while test $# -gt 0
  do
    local larg=${1,,}
    case "$larg" in
      'h' | '-h' | 'help' | '-help' |'--help' | '?' | '/?')
        echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [-i | --ims-env] <stage | prod> [-c | --callback-server] <$(hostname --fqdn)>
          -h,h,help,-help,--help,?,/? This help documentation.
          -i,--ims-env  <ims env>     IMS Environment name e.g stage, prod... [default: stage]
          -c,--callback-server        The server which is acting as client to IMS. Is usually the  hostname of machine running campaign server.
          " | STDERR
        return
    ;;
    -i|--ims-env)
      shift
      IMS_env=${1,,}
    ;;
    -c|--callback-server)
      shift
      IMS_CallbackServer="https://$(echo $1 | sed -r 's,^.*://,,')"
    ;;
    *)
      if [ -z "${IMS_env}" ]; then
        IMS_env="$larg"
      else
        IMS_CallbackServer="https://$(echo $1 | sed -r 's,^.*://,,')"
      fi
    ;;
    esac
    shift
  done
  IMS_env=${IMS_env:="stage"}
  IMS_CallbackServer=${IMS_CallbackServer:="https://$(hostname --fqdn)"}
  local IMS_UserScope IMS_ClientId
  local Mkt_Server IMS_Server IMS_OrgId IMS_RightMask IMS_Tenet IMS_ProductContext IMS_Secret
  local encrypted_stag_secret encrypted_prod_secret;
  IMS_UserScope="openid,avatar,audiencemanager_api,read_organizations,update_profile.first_name,update_profile.last_name,update_profile.phoneNumber,update_profile.job_function,additional_info.job_function,session,additional_info.projectedProductContext,AdobeID,dam-read"
  IMS_ClientId="Campaign1"
  encrypted_stag_secret='h4m7Ui0XnGNFyYDYYMIK/TBd1qwuRzKL/XQevR7QI0wdVQI7aDz4FZBS5+R20+vT' # 2d...de
  encrypted_prod_secret='tCj8I6AZUdj3XsRY23ffQBsvKybzBj4As+fX3bpWoKLh+qFWdNwrLYBE4BNgR+/q' # 63...da
  [[  ${DEFAULT_PASSWORD} != $(echo ${DEFAULT_PASSWORD} | ${OPENSSL_BIN} enc -e -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${DEFAULT_PASSWORD} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${DEFAULT_PASSWORD}) ]] && echo "ALERT Openssl encryption broken"
  Mkt_Server="https://experience-qa.${ADOBE_CORP_DOMAIN}"
  IMS_Server="https://adobeid-na1-stg1.services.${ADOBE_DOMAIN}"
  IMS_OrgId="8F4D46C05EF2EFA50A49410D@AdobeOrg"
  IMS_RightsMask="Campaign - acctesting-stage - (.*)"
  IMS_Tenet="acctesting-stage"
  IMS_ProductContext="dma_campaign_classic"
  local VAULT_IMS_CREDS_PATH='secret/campaign/techops-secrets/provisioning/ims_creds_engg'
  getVaultCreds -s CampTestDebian11-mkt-prod1 1>&2 # Just for login into vault.
  if [[ ${IMS_env} =~ .*prod.* ]]; then
    IMS_ClientId=$(vault read -address=${VAULT_ADDR} ${VAULT_IMS_CREDS_PATH} | grep -E "^prod_client\s" | awk '{print $2}')
    Mkt_Server="https://marketing.${ADOBE_DOMAIN}"
    IMS_Server="https://adobeid-na1.services.${ADOBE_DOMAIN}"
    IMS_OrgId="7380659E53398CAA0A490D4D@AdobeOrg"
    IMS_RightsMask="Campaign - acctesting - (.*)"
    IMS_Tenet="acctesting"
    IMS_ProductContext=""
    if [ -z ${SECRET_PASSWORD+x} ]; then
      IMS_Secret=$(echo ${encrypted_prod_secret} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt)
    else
      IMS_Secret=$(echo ${encrypted_prod_secret} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${SECRET_PASSWORD})
    fi
    [[ $? -eq 0 ]] || { echo "Bad decryption key" | STDERR || return $?; }
    IMS_Secret=$(vault read -address=${VAULT_ADDR} ${VAULT_IMS_CREDS_PATH} | grep prod_client_secret | awk '{print $2}')
    echo "// Configure IMS for production"
    local AAM_dataSourceId=${AAM_dataSourceId:='5836'}
    local AAM_destinationId=${AAM_destinationId:='5892'}
    getUpdateAAMConfig $AAM_dataSourceId $AAM_destinationId
  else
    IMS_ClientId=$(vault read -address=${VAULT_ADDR} ${VAULT_IMS_CREDS_PATH} | grep -E "^stage_client\s" | awk '{print $2}')
    if [ -z ${SECRET_PASSWORD+x} ]; then
      IMS_Secret=$(echo ${encrypted_stag_secret} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt)
    else
      IMS_Secret=$(echo ${encrypted_stag_secret} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${SECRET_PASSWORD})
    fi
    [[ $? -eq 0 ]] || { echo "Bad decryption key" | STDERR || return $?; }
    echo "// Configure IMS for staging"
    IMS_Secret=$(vault read -address=${VAULT_ADDR} secret/campaign/techops-secrets/provisioning/ims_creds_engg | grep stage_client_secret | awk '{print $2}')
    getUpdateAAMConfig
  fi
  local updateIMSAccountJS="
// https://wiki.${ADOBE_CORP_DOMAIN}/pages/viewpage.action?spaceKey=neolane&title=How+to+change+admin+password+on+ACC
// var password = application.arg;
var password = \"${IMS_Secret}\";
xtk.session.Write(
  <extAccount xtkschema=\"nms:extAccount\" _key=\"@name\" name=\"Adobe_Experience_Cloud\" imsServer=\"${IMS_Server}\" server=\"${Mkt_Server}\" active=\"true\" clientId=\"${IMS_ClientId}\" imsOrgId=\"${IMS_OrgId}\" imsRightsMask=\"${IMS_RightsMask}\" tenant=\"${IMS_Tenet}\" userScope=\"${IMS_UserScope}\" callbackServer=\"${IMS_CallbackServer}\" productContext=\"${IMS_ProductContext}\" clientSecret={NLWS.xtkSession.EncryptPassword(password)}>
  </extAccount>);
"
  echo "${updateIMSAccountJS}";
}
function getUpdateMidConnectionJS {
  if [ -z "$1" ]; then
    echo "You must specify the server name of the mid server"  | STDERR
    echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} < mid-server url e.g http[s]://myhost.mydomain.com:[myport]...Default Port 80 > [username] [plain-text-password]"
    return 1
  fi
  local midServerName="$1"
  local midServerAccount="mid"
  local midServerPassword="${DEFAULT_PASSWORD}"
  if [ -n "$2" ]; then
    midServerAccount="$2"
  fi
  if [ -n "$3" ]; then
    midServerPassword="$3"
  fi
  local updateMidConnectionJS="
/*https://wiki.${ADOBE_CORP_DOMAIN}/pages/viewpage.action?spaceKey=neolane&title=How+to+change+admin+password+on+ACC*/
/* var password = application.arg ;*/
var password = \"${midServerPassword}\";
xtk.session.Write(
  <extAccount xtkschema=\"nms:extAccount\" _key=\"@name\" account=\"${midServerAccount}\" name=\"defaultEmailMid\" server=\"${midServerName}\" password={NLWS.xtkSession.EncryptPassword(password)}>
  </extAccount>);
"
  echo "${updateMidConnectionJS}";
}
function getCreateRecipientsSQL {
  local DEFAULT_RECIPIENT_FOLDER_ID=$(getCmdValue "csql -d $1 -t -c \"select ifolderid from xtkfolder where sname='nmsRootRecipient'\"")
  DEFAULT_RECIPIENT_FOLDER_ID=$(getCmdValue "echo ${DEFAULT_RECIPIENT_FOLDER_ID}")
  [[ ${DEFAULT_RECIPIENT_FOLDER_ID} =~ ^[1-9][0-9]*$ ]] || { echo "Bad folder id..Can not generate valid SQL" | STDERR || return $?; }
  local userFullName="$(getUserInfo -fullname)"
  local ORG_NAME="$(getUserInfo -org)"
  local firstName=$(echo "$userFullName" | cut -d ' ' -f1)
  local lastName=$(echo "$userFullName" | rev | cut -d ' ' -f1 | rev)
  local email=$(whoami | cut -d '\' -f2)@${ADOBE_DOMAIN}
  local number_of_recepients_to_create=10;
  [[ $2 =~ ^[1-9][0-9]*$ ]] && number_of_recepients_to_create=$2
  local recepients_qualifier='+'
  [[ ! -z ${3} ]] && recepients_qualifier="${3}+"
  local sqlCreateRecipients
  [[ ${DBMS_TYPE} = "MSSQL" ]] && sqlCreateRecipients="
USE [$1]
GO
CREATE OR ALTER procedure [${PGUSER}].[sp_createCampRecipients]
AS
BEGIN
  SET NOCOUNT ON;
-- RIGHT('0000000000' + @TextToZeroPad, 10) AS ZeroPaddedText
  declare @DEFAULT_FOLDER_ID       int = ${DEFAULT_RECIPIENT_FOLDER_ID};
  declare @n_recipients            int = $[${number_of_recepients_to_create}-1];
  declare @n_half_recipients       int = @n_recipients/2;
  declare @max_length              int = LEN(cast(@n_recipients as varchar));
  declare @now                     datetimeoffset;
  declare @i                       int = 1;
  declare @iStr                    varchar(40);
  declare @getNewId                int = 0;
  set @now = SYSDATETIME()
  EXEC [postgres].[up_GetNewIdRange] 'XtkNewId', 1, @iFirstId=@getNewId OUTPUT
  insert into nmsrecipient (ifolderid, irecipientid, igender, sfirstname, slastname, smiddlename, semail, smobilephone, sphone, scompany, iemailformat, saddress1, saddress2, saddress3, saddress4, scity, szipcode, tscreated, tslastmodified) values (@DEFAULT_FOLDER_ID, @getNewId, 1, '${firstName}', '${lastName}', '${recepients_qualifier:0:16}' + '${number_of_recepients_to_create}', '${email}','9818632316','9818632316','${ORG_UNIT_NAME}',0,'${ORG_NAME}', 'Plot A5', 'Noida-Greater Noida Expressway', 'Sector 132A', 'Noida', '201310', @now, @now);
    WHILE  @i < @n_recipients
    BEGIN
      EXEC [postgres].[up_GetNewIdRange] 'XtkNewId', 1, @iFirstId=@getNewId OUTPUT;
      SET @iStr = FORMAT(@i,'0000000000')
      SET @now = SYSDATETIME()
      IF (@i <= @n_half_recipients)
        insert into nmsrecipient (ifolderid, irecipientid, igender, sfirstname, slastname, smiddlename, semail, tscreated, tslastmodified) values (@DEFAULT_FOLDER_ID, @getNewId, 1, 'first'+ @iStr, 'last', '${recepients_qualifier:0:16}' + @iStr, '${recepients_qualifier}+' + @iStr + '@qamail.com', @now, @now);
      ELSE
        insert into nmsrecipient (ifolderid, irecipientid, igender, sfirstname, slastname, smiddlename, semail, smobilephone, iemailformat, tscreated, tslastmodified) values (@DEFAULT_FOLDER_ID, @getNewId, 2, 'first', 'last' + @iStr, '${recepients_qualifier:0:16}' + @iStr, '${recepients_qualifier}+' + @iStr + '@${ADOBE_DOMAIN}', 9818632000 + @i, @i % 5, @now, @now);
      SET @i = @i + 1;
    END
END
GO
execute [${PGUSER}].sp_createCampRecipients
"
  [[ ${DBMS_TYPE} = "PostgreSQL" ]] && sqlCreateRecipients="
CREATE or REPLACE FUNCTION createCampRecipients() RETURNS integer AS \$\$
DECLARE
  declare DEFAULT_FOLDER_ID       integer = ${DEFAULT_RECIPIENT_FOLDER_ID} ;
  declare n_recipients            integer = $[${number_of_recepients_to_create}-1] ;
  declare n_half_recipients       integer = n_recipients/2 ;
  declare max_length              integer = CHAR_LENGTH(cast(n_recipients as varchar)) ;
  declare i                       integer = 0;
  declare iStr                    varchar(40);
  BEGIN
  insert into nmsrecipient (ifolderid, irecipientid, igender, sfirstname, slastname, smiddlename, semail, smobilephone, sphone, scompany, iemailformat, saddress1, saddress2, saddress3, saddress4, scity, szipcode, tscreated, tslastmodified) values (DEFAULT_FOLDER_ID, getNewId(), 1, '${firstName}', '${lastName}', '${recepients_qualifier}'||'${number_of_recepients_to_create}', '${email}','9818632316','9818632316','${ORG_UNIT_NAME}',0,'${ORG_NAME}', 'Plot A5', 'Noida-Greater Noida Expressway', 'Sector 132A', 'Noida', '201310', now(), now());
    FOR i in 1..n_recipients loop
      iStr=lpad(cast(i as varchar), 10, '0');
      if(i <= n_half_recipients) then
       insert into nmsrecipient (ifolderid, irecipientid, igender, sfirstname, slastname, smiddlename, semail, tscreated, tslastmodified) values (DEFAULT_FOLDER_ID, getNewId(), 1, 'first'||iStr, 'last', '${recepients_qualifier:0:16}'||iStr, '${recepients_qualifier}+'||iStr||'@qamail.com', now(), now());
      else
       insert into nmsrecipient (ifolderid, irecipientid, igender, sfirstname, slastname, smiddlename, semail, smobilephone,iemailformat, tscreated, tslastmodified) values (DEFAULT_FOLDER_ID, getNewId(), 2, 'first', 'last'||iStr, '${recepients_qualifier:0:16}'||iStr, '${recepients_qualifier}+'||iStr||'@${ADOBE_DOMAIN}', 9800000000 + i, i%5, now(), now());
      end if;
    end loop;
    RETURN 1;
  END;
\$\$ LANGUAGE 'plpgsql';
select createCampRecipients();
"
  echo "${sqlCreateRecipients}";
}
function createRecipients {
    _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ n -- num-of-recipients, default 10 ] [ string -- A recipient identifier, max length 64, ,default '+' ]..10 mins for 10M recipients." && return
    [[ ! -z $1 ]] && [[ ! $1 =~ ^[1-9][0-9]*$ ]] && { echo "$1 Incorrect number of recipients." | STDERR; echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ n -- num-of-recipients, default 10 ] [ string -- A recipient identifier, default '+' ]"; } && return 1
    [[ ! -z $2 ]] && [[ ${#2} -gt 64 ]] && { echo "$2 Incorrect recipient identifier." | STDERR; echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ n -- num-of-recipients, default 10 ] [ string -- A recipient identifier, default '+' ]" ; } && return 2
    local CAMP_DB_NAME=$(getCampaignDatabase)
    pushd $TEMP
    getCreateRecipientsSQL $CAMP_DB_NAME $@ > createRecipients.sql
    csql -d $CAMP_DB_NAME -f createRecipients.sql
    rm -f createRecipients.sql
    popd
}
function nlpdump
{
  pushd . > /dev/null
  isCygwin && { nlserver pdump > /tmp/nlpdump.tmp; true; } || { LD_PRELOAD=libjsig.so  nlserver pdump > /tmp/nlpdump.tmp; }
  popd > /dev/null
  if [[ ! -z $1 ]]; then
    local nlmodwf='runwf' nlmodjs='javascript'
    local get_other_nlmodules_cmd="\$p=Get-Process -Name nlserver -ErrorAction SilentlyContinue | Where-Object { \$_.CommandLine -ilike '* ${nlmodwf} *' -Or \$_.CommandLine -ilike '* ${nlmodjs} *' }; \$p | Format-Table -Autosize -hidetableheaders -Property @{Name='MODULE'; Expression={\$mod=\$_.CommandLine -replace '^.*nlserver[^\s]*[\s]+(.[^\s]+)[\s+].+', '\${1}' ; \$inst='default'; if(\$_.CommandLine -match '^.+-instance:[^\s]+.*') { \$inst=\$_.CommandLine -replace '^.+-instance:([^\s]+).*', '\$1' }; '~' + \$mod + '@' + \$inst}} , @{Name='PID'; Expression={'(' + \$_.Id + ') -'}}, @{Name='Mem'; Expression={[Math]::Round((\$_.WS/(1024.0*1024.)),1).ToString() + ' MB'  + (\$_.CommandLine.ToString() -replace '.+( -name:| -file )([^\s]+).*' , '...\${2}').ToString() }}"
    isCygwin && wps -Command "${get_other_nlmodules_cmd}" | sed -r 's,\s+, ,g' >> /tmp/nlpdump.tmp
  fi
  cat /tmp/nlpdump.tmp | d2u | grep -v '^\s*$'
}
function nls {
  local _DEBUG_LAUNCHER_
  [[ ${1,,} = '-d' ]] && shift  && { isCygwin && _DEBUG_LAUNCHER_='launch VsJITDebugger.exe '  || _DEBUG_LAUNCHER_='gdb --args '; }
  isCygwin && [[ ! -z ${_DEBUG_LAUNCHER_} ]] && { tasklist /V /NH /FI "IMAGENAME EQ devenv.exe" /FI "STATUS EQ RUNNING" | grep -i devenv  > /dev/null; [[ $? -ne 0 ]] && echo "${GREEN_COL}INFO:${RESET_COL} No existing Visual studio instance found to be running.You are advised to open visual studio and corresponding project/solution/source code before you attach to the Just in Time Debugger"; }
  exec_command_exists nlserver || { echo "nlserver: Command not found." | STDERR || return $? ; }
  touch /tmp/nlpdump && [[ "$@" =~ ^-[Ff][[:space:]]*pdump.*$ ]] && echo "Rebuilding pdump cache..." && set -- ${@:2:$#} && true > /tmp/nlpdump
  local colorOutput=1
  [[ "$@" =~ ^-[pP][[:space:]]*pdump.*$ ]] && unset colorOutput && set -- ${@:2:$#}

  if [[ "$@" =~  ^pdump$ && $(wc -l < /tmp/nlpdump) -gt 2 ]]; then
  if [[ -n ${colorOutput} ]]; then
      cat /tmp/nlpdump | sed -r -e 's,^~,*,g' -e "/.*@default.*/! s/(.*)/M1\1/" -e "/^(M1|web)/! s/(\(.*\))/${BLUE_COL}\1${RESET_COL}/g" -e "/^((M1)watchdog)/I s/(\(.*\))/${BLUE_COL}\1${RESET_COL}/g" -e "s/^M1([^@]+\s.*)/\1/g" -e "s/^M1(.*)$/${SAFFRON_COL}\1${RESET_COL}/" -e "s/(^web.*)/${GREEN_COL}\1${RESET_COL}/"
    else
      cat /tmp/nlpdump | sed -r -e 's,^~,*,g'
    fi
    return
  fi
  ! exec_command_exists nlserver && return
  local extraArgs
  shopt -s nocasematch
  local isASyncCall
  [[ "$@" =~  (^|[[:space:]])wfserver($|[[:space:]]) || "$@" =~  (^|[[:space:]])runwf($|[[:space:]]) || "$@" =~  (^|[[:space:]])mta($|[[:space:]]) || "$@" =~  (^|[[:space:]])tracking($|[[:space:]]) || "$@" =~  (^|[[:space:]])javascript($|[[:space:]]) || "$@" =~  (^|[[:space:]])sms($|[[:space:]]) || "$@" =~  package.* ]]  && [[ ! "$@" =~ (^|[[:space:]])-instance:.+($|[[:space:]]) ]] && extraArgs="-instance:$(getCampaignInstance)"
  [[ "$@" =~  (^|[[:space:]])web($|[[:space:]]) ]] && [[ ! "$@" =~ (^|[[:space:]])-tomcat($|[[:space:]]) ]] && extraArgs="${extraArgs} -tomcat"
  [[ "$@" =~  ^shutdown.* ]] && [[ -z ${_DEBUG_LAUNCHER_} ]] && isASyncCall=1
  if [[ "$@" =~  ^watchdog.* ]] ; then
    [[ -z ${_DEBUG_LAUNCHER_} ]] && isASyncCall=1
    pushd . > /dev/null
    2conf
    local args=( $(echo "$@") )
    unset 'args[0]'
    local isFirstRow
    for cmdOption in ${args[@]}; do
      for c in config-*.xml; do
        local NLmodule=$(cat $c | grep -E "args=\"[^\"]*${cmdOption}[^\"]*\"" | awk '{print $1;}' | sed -r 's,^[^[:alnum:]]*,,g')
        [[ -n  ${NLmodule} ]] && { [[ -z $isFirstRow ]] && isFirstRow=1 || isFirstRow=0; [[ $isFirstRow -eq 1 ]] && echo "${YELLOW_COL}WARN:${RESET_COL} List of comamnd line options, modules and respective instance config files, which have option already enabled for them."; } && echo -ne "\t${YELLOW_COL}${cmdOption}${RESET_COL}\t\t${NLmodule}\t\t$c\n"
      done
      [[ -z $isFirstRow ]] || {
        echo "${RED_COL}ALERT:${RESET_COL} Above listed modules may fail to start because of duplicate arguments." ;
        echo "${RED_COL}ALERT:${RESET_COL} Consider removing the options from the specific args attribute of respective modules in the above config files.";
        readEx "Press ${YELLOW_COL}Enter${RESET_COL} to continue OrElse ${YELLOW_COL}Ctrl+c${RESET_COL} to abort...Waiting for " 10 " seconds..."
      }
      unset isFirstRow
    done
    popd > /dev/null
  else
    [[ "$@" =~ (^|[[:space:]])-verbose($|[[:space:]]) ]] && [[ ! "$@" =~ (^|[[:space:]])-traccefilter:.+($|[[:space:]]) ]] && extraArgs="${extraArgs} -tracefilter:wdbc,soap"
  fi
#  isCygwin && [[ "$@" =~  ^javascript[[:space:]]+.* ]] && jsfile=$(_KEY_HAS_VALUE -file $@) && [[ X"${jsfile}" != "$(native $jsfile)" ]] && echo "specify -file as -file '$(native $jsfile)'"
  if [[ "$@" =~  ^javascript[[:space:]]+.* ]]; then
    local jsfile=$(_KEY_HAS_VALUE -file $@)
    [[ -z ${jsfile} ]] && jsfile="$(native ${@: -1})" && [[ ! -z ${jsfile} && -f ${jsfile} ]] && { set -- ${@:1:$[$#-1]}; extraArgs="${extraArgs} -file '${jsfile}'"; }
    local uf=$(ustyle "${jsfile}")
    [[ -f ${uf} && -s ${uf} ]] || echo "${RED_COL}ALERT:${RESET_COL} specified js file(${uf}) is invalid or does not exist."
    isCygwin && [[ X${uf,,} = X${jsFile,,} ]] && echo "S{YELLOW_COL}Alert:${RESET_COL} Must specify js file path in Windows/DOS path format."
  fi
  echo "Invoking ${YELLOW_COL}${_DEBUG_LAUNCHER_}nlserver $@ ${extraArgs}${RESET_COL}"
  [[ -z $isASyncCall ]] || echo "(in Backgroud)"
  if isCygwin; then
    if [[ -z $isASyncCall ]] ; then
      [[ -z ${_DEBUG_LAUNCHER_} ]] && { nlserver "$@" "${extraArgs}"; true; } || { ${_DEBUG_LAUNCHER_} nlserver "$@" "${extraArgs}"; return; }
    else
      nlserver "$@" "${extraArgs}" &
    fi
  else
    pushd . > /dev/null
     if [[ -z $isASyncCall ]] ; then
      [[ -z ${_DEBUG_LAUNCHER_} ]] && { LD_PRELOAD=libjsig.so nlserver "$@" "${extraArgs}"; true; } || { ${_DEBUG_LAUNCHER_} nlserver "$@" "${extraArgs}"; return;}
    else
      LD_PRELOAD=libjsig.so nlserver "$@" "${extraArgs}" &
    fi
    popd > /dev/null
  fi
  local isUnlistedModule
  [[ "$@" =~  ^(javascript|runwf)[[:space:]]+.* ]] && isUnlistedModule=1
  { sleep 2; (( nlpdump ${isUnlistedModule} | tee >( tail -n +2 | LC_ALL=C sort | column -t -s ' ' >&3) | head -n 1) 3>&1) > /tmp/${FUNCNAME[0]}.tmp; mv -f /tmp/${FUNCNAME[0]}.tmp /tmp/nlpdump; } &
}
function setupSSHKeys {
  local valid_RSA valid_ed25519
  [ -s ~/.ssh/id_rsa -a -s ~/.ssh/id_rsa.pub ] && valid_RSA=1
  [ -s ~/.ssh/id_ed25519 -a -s ~/.ssh/id_ed25519.pub ] && valid_ed25519=1
  _CONTAINS -f "$@" && unset valid_RSA valid_ed25519
  if [[ -z ${valid_RSA} && -z ${valid_ed25519} ]]; then
    local yn
    echo "Do you want to generate ${YELLOW_COL}new${RESET_COL} set of keys or attempt to restore then from  ${YELLOW_COL}${USER_SHARE_LOCATION}${RESET_COL}."
    read -p "Proceed? ([y]/n)" yn
    yn=${yn:0:1}
    if [ "X${yn,,}" == "Xn" ] ;  then
      read -p "Do you want to restore keys from your network shared location ${YELLOW_COL}${USER_SHARE_LOCATION}${RESET_COL} ...Proceed? ([y]/n)" yn
      if [ "X${yn,,}" == "Xn" ] ;  then
        echo "Skipping ssh key setup..."
      else
        [[ -d ~/.ssh ]] || mkdir ~/.ssh
        [[ -f ${USER_SHARE_LOCATION}id_rsa ]] || { echo -ne "${RED_COL}ALERT:${RESET_COL} ${YELLOW_COL}${USER_SHARE_LOCATION}${RESET_COL} does not seem to have your ssh keys. Press any key to continue..."; read -p "" yn; }
        cp -f ${USER_SHARE_LOCATION}id_rsa ~/.ssh/
        cp -f ${USER_SHARE_LOCATION}id_rsa.pub ~/.ssh/
        cp -f ${USER_SHARE_LOCATION}id_ed25519 ~/.ssh/
        cp -f ${USER_SHARE_LOCATION}id_ed25519.pub ~/.ssh/
        chmod 400 ~/.ssh/id_ed25519*
        chmod 400 ~/.ssh/id_rsa*
      fi
    else
      ssh-keygen -t rsa -b 4096 -C "$(whoami | cut -d '\' -f2)@${ADOBE_DOMAIN}"
      ssh-keygen -t ed25519 -b 4096 -C "$(whoami | cut -d '\' -f2)@${ADOBE_DOMAIN}"
      eval "$(ssh-agent -s)"
      chmod 400 ~/.ssh/id_rsa*
      ssh-add ~/.ssh/id_rsa
      chmod 400 ~/.ssh/id_ed25519*
      ssh-add ~/.ssh/id_ed25519
      wps -Command "Set-Clipboard -Value '$(cat ~/.ssh/id_ed25519.pub)'"
      echo "${GREEN_COL}INFO:${RESET_COL} Open ${YELLOW_COL}https://git.${ADOBE_CORP_DOMAIN}/settings/keys${RESET_COL} and ${YELLOW_COL}https://iam.${ADOBE_CORP_DOMAIN}/#/sshkey${RESET_COL} links in your browser"
      echo "${GREEN_COL}INFO:${RESET_COL} Click on New/Manage SSH keys buttons and and paste the contents of ~/.ssh/id_ed25519.pub file in Key filed of dialog and then press Add SSH Key"
      echo "${GREEN_COL}INFO:${RESET_COL} Content ~/.ssh/id_ed25519.pub is as shown below( ${YELLOW_COL}and which has also been copied to your clipboard${RESET_COL} ) :"
      cat ~/.ssh/id_ed25519.pub
      local attempts=32
      flushInput
      echo "Press any key to open links in browser"
      wps -Command "Start-Process https://git.${ADOBE_CORP_DOMAIN}/settings/keys"
      wps -Command "Start-Process https://iam.${ADOBE_CORP_DOMAIN}/#/sshkey"
      flushInput
      read -p "${RED_COL}ALERT:${RESET_COL} If you are satisfied with your sshkey setup..Press any key to continue else Press Ctrl+C to abort." yn
      [[ $? -eq 0 ]] && { cp -f ~/.ssh/id* ${USER_SHARE_LOCATION}; for f in $(find ${USER_SHARE_LOCATION} -type f -name "id*" | sed -r 's,.*/,,g'); do chmod 644 "${USER_SHARE_LOCATION}${f}"; done; }
    fi
  fi
  # If no SSH agent is already running, start one now. Re-use sockets so we never
  # have to start more than one session.
  export SSH_AUTH_SOCK=~/.ssh-socket
  ssh-add -l >/dev/null 2>&1
  if [ $? = 2 ]; then
     # No ssh-agent running
     rm -rf $SSH_AUTH_SOCK
     # >| allows output redirection to over-write files if no clobber is set
     ssh-agent -a $SSH_AUTH_SOCK >| /tmp/.ssh-script
     source /tmp/.ssh-script
     echo $SSH_AGENT_PID >| ~/.ssh-agent-pid
     rm -rf /tmp/.ssh-script
  fi
  [[ -f ~/.ssh/id_ed25519 ]]  && ssh-add ~/.ssh/id_ed25519
  [[ -f ~/.ssh/id_rsa ]]      && ssh-add ~/.ssh/id_rsa
}
function fetchVPNState {
  local iRc
  local ip=$(getIP -vpn)
  local l_hostname=$(hostname)
  if [[ -z ${ip} ]]; then
    [[ -f ~/.vpn-status-on ]] && rm -f ~/.vpn-status-on
    ip=$(getIP)
    iRc=1
  else
    [[ ! -e ~/.vpn-status-on ]] &&  touch ~/.vpn-status-on
    iRc=0
  fi
  if [[ -z $ip ]] || [[ -z $l_hostname ]]; then
    return $iRc
  fi
  local fqdn
  fqdn=$(hostname --fqdn 2> /dev/null)
  fqdn=${fqdn:=${l_hostname}.${ADOBE_CORP_DOMAIN}}
  add2HostsFile $fqdn $ip ${FUNCNAME[0]}
  add2HostsFile $fqdn $l_hostname
  return $iRc
  # Following code does not execute as of today.
  if isCygwin; then
    local vpncli="$(findW vpncli)"
    if [ ! -z "${vpncli}" ]; then
      local state=$("${vpncli}" status | sed 's/\r//g' | grep state | tail -n 1 | cut -d ':' -f2 | sed -r 's/^\s+//g')
      if [ "X${state,,}" = "Xconnected" ]; then
          if [ ! -e ~/.vpn-status-on ]; then
            touch ~/.vpn-status-on
          fi
        return 0
      fi
    fi
  fi
  if [ -s ~/.vpn-status-on ]; then
    local vpn_security_code=$(cat ~/.vpn-status-on)
    rm -f ~/.vpn-status-on
    connectVPN ${vpn_security_code}
    return $?
  else
    rm -f ~/.vpn-status-on
  fi
  return 1
}
# https://docs.paloaltonetworks.com/globalprotect/10-0/globalprotect-admin/globalprotect-apps/deploy-app-settings-transparently/deploy-app-settings-to-linux-endpoints#id5e31c3f1-a9ae-48f6-9a6c-6523cada901d
function vpnstatus { [[ -f ~/.vpn-status-on ]] && echo "*VPN On*"; }
function disconnectVPN {
  if isCygwin; then
    local vpncli="$(findW -u vpncli)"
    [[ ! -z "${vpncli}" ]] || { echo "vpn cli binaries not in PATH." | STDERR || return 2; }
    "${vpncli}" disconnect
  else
    globalprotect disconnect
    pushd . > /dev/null
    cd ${HOME}/.GlobalProtect/
    sudo rm -f *.log *.html
    popd > /dev/null
    local pid=$(ps -ae | grep -i openconnect | awk '{print $1}')
    [[ -z ${pid} ]] && return 0
    sudo kill -s SIGINT ${pid}
    readEx "Disconnecting ... " 3
  fi
  fetchVPNState &
  disown $!
}
function connectVPN {
  if ! isCygwin; then
    pushd . > /dev/null
    cd ${HOME}/.GlobalProtect/
    sudo rm -f *.log *.html
    popd > /dev/null
    export BROWSER=$(update-alternatives  --get-selections | grep x-www-browser | awk '{print $3;}')
    export DEFAULTBROWSER=${BROWSER}
    echo "Using default browser $BROWSER ..."
    globalprotect connect -p vpn.${ADOBE_DOMAIN} -u $(whoami)@${ADOBE_DOMAIN}
    return $?
  fi
  local passCode
  if [[ $# -lt 1 ]]; then
    if [[ -n ${SYMANTEC_WINDOW_TITLE} ]]; then
      grab -i -OfWindowTitle ${SYMANTEC_WINDOW_TITLE} > /tmp/capture_output.txt
      if [ $? -eq 0 ]; then
        local imgPath=$(ustyle '$(cat /tmp/capture_output.txt | tail -n +2 | head -n 1)')
        passCode=$(img2txt ${imgPath})
      fi
    else
      vpnstatus > /dev/null
      { [[ $? -eq 0 ]] && passCode=000000; } || read -p "Enter Symatec/Okta Security Code(6 digit code that appears on your security device):" passCode
    fi
  else
    passCode=$1
  fi
  if ! [[ ${passCode} =~ ^[0-9][0-9][0-9][0-9][0-9][0-9]$ ]];  then
    echo "${RED_COL}ALERT:${RESET_COL} Bad access code '${passCode}'"
    echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} < Symatec/Okta Security Code>...6 digit code that appears on your security device."
    return 1
  fi
  if ! [[ ${VPN_PIN} =~ ^[0-9]{4,6}$ ]];  then
    echo "${RED_COL}ALERT:${RESET_COL} VPN Pin not set or Bad VPN Pin. VPN Pin is  4 - 6 digit number. 'VPN_PIN' must set as your environment variable."
    return 3
  fi
  local vpn_server
  if isCygwin; then
    local vpncli="$(findW -u vpncli)"
    [[ ! -z "${vpncli}" ]] || { echo "vpn cli binaries not in PATH." | STDERR || return 2; }
    local state=$("${vpncli}" status | sed 's/\r//g' | grep state | tail -n 1 | cut -d ':' -f2 | sed -r 's/^\s+//g')
    if [ "X${state,,}" = "Xconnected" ]; then
      echo "${GREEN_COL}INFO:${RESET_COL}   Already connected to VPN"
      return 0
    fi
    local VPN_UI="vpnui.exe"
    tasklist /V /NH /FI "IMAGENAME EQ ${VPN_UI}" /FI "STATUS EQ RUNNING" | grep ${VPN_UI}
    if [ $? -eq 0 ]; then
      echo "======================"
      echo "\"${VPN_UI}\" and \"${vpncli}\" do not go together."
       readEx "Terminating ${VPN_UI} in " 5 " seconds. Press any key to abort termination..."
      if [ $? -eq 0 ]; then
        echo "\"${vpncli}\" and \"${VPN_UI}\" do not go together.You may want to close ${VPN_UI} manually from tray before launching command line vpn"
        return 4;
      else
        tskill  vpnui
      fi
    fi
    for h in $("${vpncli}" hosts | grep noida | sed -r 's/[^[[:alnum:].-]+//g'); do
      # asa-noida-4.adobe.com even though live is ,at the moment, not a functional gateway.
      if [[ $h = "asa-noida-4.${ADOBE_DOMAIN}" ]]; then
        continue
      fi
      if isHostAlive ${h}; then
        vpn_server="${vpn_server}${h} "
      else
        echo "${RED_COL}ALERT:${RESET_COL} Skipping VPN Host ${h} as it is not reachable"
      fi
    done
    if [ ! -z ${vpn_server+x} ]; then
      vpn_server=( $vpn_server )
      vpn_server=${vpn_server[$(expr $RANDOM % ${#vpn_server[@]})]}
    fi
    if [ ! -z ${vpn_server+x} ]; then
      echo -e "connect ${vpn_server}\n$(whoami)\n${VPN_PIN}${passCode}\ny\nexit" | "${vpncli}" -s
      iRc=$?
      if [ $iRc -ne 0 ]; then
        return $iRc
      fi
    fi
  else
    ps -e -o cmd | grep openconnect | grep -v grep > /dev/null 2>&1
    [[ $? -eq 0 ]] && echo "${GREEN_COL}INFO:${RESET_COL}   Already connected to VPN" && return 0
    if ! exec_command_exists openconnect; then
      aptS install openconnect
    fi
    vpn_server="asa-noida-1.${ADOBE_DOMAIN}"
    if isHostAlive $vpn_server; then
      local iRc
      sudo openconnect -b -q --usergroup=ADOBEOTP --authgroup=ADOBEOTP -u $(whoami) ${vpn_server} --non-inter --passwd-on-stdin <<< "${VPN_PIN}${passCode}"
      iRc=$?
      if [ $iRc -ne 0 ]; then
        return $iRc
      fi
      readEx "Connecting ... " 3
    else
      echo "${YELLOW_COL}${vpn_server}${RESET_COL} not reachable..probably because VPN is running on WSL Host.You can not run VPN on both simultaneously." | STDERR
      return 5
    fi
  fi
  if [ ! -z ${vpn_server+x} ]; then
    fetchVPNState
    echo "VPN-IP: $(getIP -vpn)"
    return 0;
  fi
  # Did it fail because route table got corrupted..try to disconnect to clean up a any route/cache.
  disconnectVPN
  return 1;
}
function cpToJumpHost {
  sConn
  scp -o PubkeyAcceptedKeyTypes=+ssh-rsa "${@:3:$#}" -S ~/scon $1  $(whoami)@$(getJumpHost):$2
}
function scpToRemote {
  local rhost;
  local srcfiles;
  for file in "$@"; do
    if [ ! -f $file ]; then
      break
    fi
    srcfiles+=($file)
    shift
  done
  local rhost=$(echo $1 | sed -r 's,^(.*:[/]+)([-\.[:alnum:]]+)[/]*.*,\2,g')
  [[ ! -z $rhost ]] && [[ X${rhost%%.*} = X${rhost} ]] && rhost=${rhost}.${HOSTED_CAMPAIGN_DOMAIN}
  shift
  if [[ ${#srcfiles[@]} -eq 0 ]] || [[ -z ${rhost} ]]; then
    echo "${YELLOW_COL}Usage${RESET_COL}: ${FUNCNAME[0]} <local-src-file-path> <remote-dest-host> [<remote-dest-file-path>]
            local-src-file-path           ${YELLOW_COL}Mandatory${RESET_COL} local source file name to copy.
            remote-dest-host              ${YELLOW_COL}Mandatory${RESET_COL} Remote host on which to eventually copy the file to.
            remote-dest-file-path         ${GREEN_COL}Optional${RESET_COL}  Remote destination file  path. if remote directory does not exist it will "not" create it.
                                                       default destination folder is home folder of user ${YELLOW_COL}$(whoami)${RESET_COL} on remote machine
                                                       and file name is same as source file name" | STDERR
    return
    fi
  local dest=$1
  if [ ! -z $dest ]; then
    dest=${dest%/}/
    shift
  fi
  local retCode
#  local scpOpts="$@"
#  echo "files: ${srcfiles[@]} , host = ${rhost} , options = ${scpOpts}" && return
  [[ "X${rhost#*.}" = Xrd.${HOSTED_CAMPAIGN_DOMAIN} ]] && [[ $(nslookup ${rhost} | grep -E ^Name: | awk '{ print $2; }') =~ ^[A-Za-z][A-Za-z][0-9]+\.${ADOBE_CORP_DOMAIN}$ ]] && echo "Using prod user and legacy password for connecting to rd-dev machine." && { scp ${SCP_OPTS} ${srcfiles[@]} prod@${rhost}:${dest} $@; retCode=$?; [[ ${retCode} -eq 0 ]] && echo ${rhost} >> ~/.hosts; return ${retCode} ; }
  retCode=1
  sConn
  for src in "${srcfiles[@]}"; do
#   scp -S ~/scon ${SCP_OPTS} ${src} $(whoami)@$(getJumpHost | sed -r "s,^.*@,${rhost}@,g"):${dest}$(basename ${src})
    local scpSingleSignOnPrompt=".*Hit enter to send Okta Verify push notification or provide OTP.*"
    local scpCmd="scp -S ${HOME}/scon ${SCP_OPTS} ${src} $(whoami)@$(getJumpHost | sed -r "s,^.*@,${rhost}@,g"):${dest}$(basename ${src})"
    # local REMOTE_CMD_OUTPUT_BUFFER=${SSH_REMOTE_CMD_OUTPUT_BUFFER:=100}
    # No way to other way to capture scp progress bar if we want to filter output buffer.
    execute_with_UserInteraction "${scpCmd}" "${scpSingleSignOnPrompt}"

    # local tmpFile="/tmp/$(basename ${src}).$(date '+%d%b%Y_%H_%M_%S_%s')"
    # cpToJumpHost ${src} $tmpFile
    # if [ -z $dest ]; then
      # local fName=$(basename ${src})
      # ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost) "scp ${scpOpts} $tmpFile ${rhost}:${fName}; echo Remote Home: \${HOME}"
      # [[ $? -eq 0 ]] && retCode=0
    # else
      # local fName
      # if [[ ${dest} =~  /$ ]]; then
        # fName="${dest}$(basename ${src})"
      # elif [[ ${dest} =~ \.[[:alnum:]]*$ ]] && [[ ${#srcfiles[@]} -eq 1 ]]; then
        # fName="${dest}"
      # else
        # fName="${dest}/$(basename ${src})"
      # fi
      # ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost) "scp ${scpOpts} $tmpFile ${rhost}:${fName}; echo Remote Home: \${HOME}"
      [[ $? -eq 0 ]] && retCode=0
    # fi
  done
  [[ ${retCode} -eq 0 ]] && echo ${rhost} >> ~/.hosts
}
function cpFromJumpHost {
  sConn
  scp -o PubkeyAcceptedKeyTypes=+ssh-rsa "${@:3:$#}" -S ~/scon $(whoami)@$(getJumpHost):$1 $2
}
function scpFromRemote {
    if [ $# -lt 2 -o $# -gt 3 ]; then
        echo "${YELLOW_COL}Usage${RESET_COL}: ${FUNCNAME[0]} <remote-src-file-path> <remote-src-host> [<local-dest-file-path>]
            remote-src-file-path          ${YELLOW_COL}Mandatory${RESET_COL} Remote source file name to copy.
            remote-src-host               ${YELLOW_COL}Mandatory${RESET_COL} Remote source host from which to pick up the file from.
            local-dest-file-path          ${GREEN_COL}Optional${RESET_COL}  Local destination file path.
                                                       default destination folder is current folder on local machine
                                                       and file name is same as source file name" | STDERR
    return
    fi
  local src="$1"
  local rhost=$(echo $2 | sed -r 's,^(.*:[/]+)([-\.[:alnum:]]+)[/]*.*,\2,g')
  [[ ! -z $rhost ]] && [[ X${rhost%%.*} = X${rhost} ]] && rhost="${rhost}.${HOSTED_CAMPAIGN_DOMAIN}"
  shift
  shift
  local tmpFile="/tmp/$(basename ${src}).$(date '+%d%b%Y_%H_%M_%S_%s')"
  local fName="$1"
  if [ -z $fName ]; then
    fName=$(basename ${src})
  else
    shift
  fi
  local retCode
  [[ "X${rhost#*.}" = Xrd.${HOSTED_CAMPAIGN_DOMAIN} ]] && [[ $(nslookup ${rhost} | grep -E ^Name: | awk '{ print $2; }') =~ ^[A-Za-z][A-Za-z][0-9]+\.${ADOBE_CORP_DOMAIN}$ ]] && echo "Using prod user and legacy password for connecting to rd-dev machine." && { scp ${SCP_OPTS} prod@${rhost}:${src} ${tmpFile} $@; retCode=$?; [[ $retCode -eq 0 ]] && echo ${rhost} >> ~/.hosts && cp "${tmpFile}" "${fName}" && retCode=$?; return $retCode ; }
  sConn
  local scpSingleSignOnPrompt=".*Hit enter to send Okta Verify push notification or provide OTP.*"
  local scpCmd="scp -S ${HOME}/scon ${SCP_OPTS} $(whoami)@$(getJumpHost | sed -r "s,^.*@,${rhost}@,g"):${src}  ${tmpFile}"
  # local REMOTE_CMD_OUTPUT_BUFFER=${SSH_REMOTE_CMD_OUTPUT_BUFFER:=100}
  # No way to other way to capture scp progress bar if we want to filter output buffer.
  execute_with_UserInteraction "${scpCmd}" "${scpSingleSignOnPrompt}"
  retCode=$?
#  ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost) "scp ${scpOpts} ${rhost}:${src} $tmpFile"
  [[ $retCode -eq 0 ]] && echo ${rhost} >> ~/.hosts && cp "${tmpFile}" "${fName}"
#  cpFromJumpHost $tmpFile $fName ${scpOpts}
    return ${retCode}
}
function bash_prompt_command {
  # How many characters of the $PWD should be kept
  local pwdmaxlen=25
  # Indicate that there has been dir truncation
  local dir=${PWD##*/}
  pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
  NEW_PWD=${PWD/#$HOME/\~}
  NEW_PWD=${NEW_PWD#/cygdrive/}
  NEW_PWD=${NEW_PWD#/mnt/}
  local trunc_symbol="${NEW_PWD:0:2}.."
  local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
  if [ ${pwdoffset} -gt "0" ]
  then
    NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
    NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
  fi
  if [[ -z ${ENABLE_GIT_PS1} ]]; then
    [[ ${OWD} != ${PWD} ]] && CUR_CAMP_GIT_BRANCH=$(currentBranch 2> /dev/null) && OWD=${PWD}
    [[ "${LAST_COMMAND}" =~ ^[^[:space:]]*git[\"]?[[:space:]]+checkout[[:space:]]+ ]] && CUR_CAMP_GIT_BRANCH=$(currentBranch 2> /dev/null)
    [[ ! -z ${CUR_CAMP_GIT_BRANCH} ]] && NEW_PWD="${NEW_PWD}:"
  fi
}
if [[ ! -z ${ENABLE_GIT_PS1} ]]; then
# export GIT_PS1_COMPRESSSPARSESTATE=
# export GIT_PS1_OMITSPARSESTATE=
# export GIT_PS1_SHOWDIRTYSTATE=1
# export GIT_PS1_SHOWUNTRACKEDFILES=1
# export GIT_PS1_SHOWDIRTYSTATE=1
# export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_HIDE_IF_PWD_IGNORED=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_STATESEPARATOR=':'
fi
function make_bash_prompt {
  # regular colors
  local K="30m\]"          # black
  local R="31m\]"          # red
  local G="32m\]"          # green
  local Y="33m\]"          # yellow
  local B="34m\]"          # blue
  local M="35m\]"          # magenta
  local C="36m\]"          # cyan
  local W="37m\]"          # white
  local NORM="\[\033[0;"   # normal
  local BOLD="\[\033[1;"   # bold/emphasized/bright
  local DULL="\[\033[2;"   # dull
  local ITAL="\[\033[3;"   # italic
  local UNDL="\[\033[4;"   # underline
  local BLNK="\[\033[5;"   # blink
  local RVBG="\[\033[7;"   # reverse background
  local STTH="\[\033[9;"   # strike through
  local DBUL="\[\033[21"   # double underline
  local NONE="\[\033[0m\]" # unsets color to term's fg color
  local TITLEBAR
  if isCygwin; then
    TITLEBAR='\[\033]0; ${CUSTOM_TITLEBAR}$?-\u@\h $(cygpath -w \w) \d \T $(vpnstatus) \a\]'
  else
    TITLEBAR='\[\033]0; ${CUSTOM_TITLEBAR}$?-\u@\h \d \T $(vpnstatus) \a\]'
  fi
  if [[ -z ${ENABLE_GIT_PS1} ]]; then
    PS1="${TITLEBAR}${BOLD}${B}\${NEW_PWD}${NONE}${BOLD}${K}\${CUR_CAMP_GIT_BRANCH}${NONE}${BOLD}${Y}#\#> ${NONE}"
  elif [[ X${ENABLE_GIT_PS1:0:1} =~ X[Y1T] ]]; then
    PS1="${TITLEBAR}${BOLD}${B}\${NEW_PWD}${NONE}\$(__git_ps1)${BOLD}${Y}#\#> ${NONE}"
  else
    PS1="${TITLEBAR}${BOLD}${B}\${NEW_PWD}${NONE}${BOLD}${Y}#\#> ${NONE}"
  fi
}
# https://bash.cyberciti.biz/guide/Changing_bash_prompt
# https://www.thegeekstuff.com/2008/09/bash-shell-take-control-of-ps1-ps2-ps3-ps4-and-prompt_command/
PROMPT_COMMAND=bash_prompt_command
make_bash_prompt
unset make_bash_prompt
# if isCygwin; then
  # export PS1="\[\e]0;\u@\h:\w: \d \T \$(vpnstatus)\a\]\n\[\e[32m\]\$(cygpath -w \w) \[\e[33m\]\## \[\e[0m\]"
# else
  # export PS1="\[\e]0;\u@\h:\w: \d \T \$(vpnstatus)\a\]\n\[\e[32m\]\w \[\e[33m\]\## \[\e[0m\]"
# fi
# export PS1="\[\e]0;\u@\h:\w:\T\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\## "
# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077
# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
#
function gSync {
  local CUR_BRANCH
  local campaign_src=nl integro="../v6SOAPAPI" globalmessages="../globalmessages" devsetup="../acc-dev" web_ui="../acc-web-ui"
  pushd "$(getCampRoot)" > /dev/null
  case "$1" in
    -a|--all)
      [[ -d ${campaign_src} ]] || campaign_src=''
      [[ -d ${integro} ]] || integro=''
      [[ -d ${globalmessages} ]] || globalmessages=''
      [[ -d ${devsetup} ]] || devsetup=''
      [[ -d ${web_ui} ]] || web_ui=''
    ;;
    -c|--ac|--nl)
      [[ -d ${campaign_src} ]] || campaign_src=''
    ;;
    -d|--devsetup|--acc-dev)
      [[ -d ${devsetup} ]] || devsetup=''
    ;;
    -g|--globalmessages)
      [[ -d ${globalmessages} ]] || globalmessages=''
    ;;
    -i|--integro|--v6SOAPAPI)
      [[ -d ${integro} ]] || integro=''
    ;;
    -w|--web-ui|--web|--ui)
      [[ -d ${web_ui} ]] || web_ui=''
    ;;
    *)
      echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} [OPTION]...
        -a, --all                  all of the below.
        -c, --ac, --nl             Campaign source
        -d, --devsetup, --acc-dev  dev env setup latest code i.e .bashrc file
        -g, --globalmessages       Translation i.e global messages files.
        -i, --integro, --v6SOAPAPI Integro tests branch
        -w, --web-ui, --web, --ui  Web UI
        -h,h,help,--help,?,/?      This help documentation.
        "
      popd > /dev/null
      return
    ;;
  esac
  if [[ ! -z ${campaign_src} ]]; then
    pushd ${campaign_src} > /dev/null
    echo "Syncing campaign source"
    CUR_BRANCH=$(currentBranch)
    git stash
    if [ "$CUR_BRANCH" = "master" ]; then
      CUR_BRANCH=$MASTER_BRANCH
      git checkout $MASTER_BRANCH
      git branch -d master
    fi
    git checkout $MASTER_BRANCH && git pull && git checkout $CUR_BRANCH && git pull origin $MASTER_BRANCH && git pull origin $CUR_BRANCH && git push && git stash apply
    popd > /dev/null
  fi
  if [[ ! -z ${globalmessages} ]]; then
    pushd ${globalmessages} > /dev/null
    echo "Syncing globalmessages"
    CUR_BRANCH=$(currentBranch)
    git stash
    git checkout master && git pull && git checkout $CUR_BRANCH && git pull origin master && git pull origin $CUR_BRANCH && git push && git stash apply && git stash drop
    popd > /dev/null
  fi
  if [[ ! -z ${integro} ]]; then
    pushd ${integro} > /dev/null
    echo "Syncing Integro test branch"
    CUR_BRANCH=$(currentBranch)
    git stash
    git checkout master && git pull && git checkout $CUR_BRANCH && git pull origin master && git pull origin $CUR_BRANCH && git push && git stash apply && git stash drop
    popd > /dev/null
  fi
  if [[ ! -z ${devsetup} ]]; then
    pushd ${devsetup} > /dev/null
    echo "Syncing dev setup branch"
    CUR_BRANCH=$(currentBranch)
    git stash
    git checkout master && git pull && git checkout $CUR_BRANCH && git pull origin master && git pull origin $CUR_BRANCH && git stash apply && git stash drop
    git reset HEAD
    popd > /dev/null
  fi
  if [[ ! -z ${web_ui} ]]; then
    pushd ${web_ui} > /dev/null
    echo "Syncing web ui branch"
    CUR_BRANCH=$(currentBranch)
    git stash
    git checkout master && git pull && git checkout $CUR_BRANCH && git pull origin master && git pull origin $CUR_BRANCH && git stash apply && git stash drop
    git reset HEAD
    popd > /dev/null
  fi
  popd > /dev/null
}
function isDevToolAvailable {
  if isCygwin; then
    local vs_version=$(getIDEVersion)
    case "$vs_version" in
      'Microsoft Visual Studio 2012' | 'Microsoft Visual Studio 2013')
        true
      ;;
      'Microsoft Visual Studio 2019'* )
        true
      ;;
      *)
        false
    esac
  else
    if exec_command_exists gcc && exec_command_exists gdb; then
      true
    else
      false
    fi
  fi
}
if isCygwin; then
  if [ -z ${APACHE_ROOT+X} ]; then
    APACHE_ROOT='/cygdrive/c/Apache24_64'
  else
    APACHE_ROOT="$(cygpath -u "${APACHE_ROOT}")"
  fi
  if [ -d $APACHE_ROOT ]; then
    export APACHE_ROOT="$(getPlatformPath ${APACHE_ROOT})"
  else
    if [ "X${BUILD_BIT_WIDE}" = "X32" ]; then
      APACHE_ROOT="$(cygpath -w "${CAMP_AC_ROOT}/../Apache24_x86/")"
    else
      APACHE_ROOT="$(cygpath -w "${CAMP_AC_ROOT}/../Apache24_x64/")"
    fi
  fi
  HTTPD="$(ustyle ${APACHE_ROOT})"
  HTTPD="${HTTPD%/}"
  export HTTPD="${HTTPD}/bin/httpd.exe"
  function apache {
    local HTTPD_PID
    case "$1" in
    [sS][tT][aA][rR][tT])
      pushd $CAMP_AC_ROOT > /dev/null
      local l_ACC_BRANCH=$(currentBranch)
      popd > /dev/null
      local HTTPD_CONF="$(ustyle $APACHE_ROOT)conf/httpd.conf"
      local host_aliases_regex="($({ cat /etc/hosts | grep -E "^$(getIP)" | awk -F"#" '{print $1;}' | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF;}'; hostname --fqdn; cat $HTTPD_CONF | grep -o -E -i 'SetEnvIfNoCase Host "\([^[:space:]]+\)' | sed -r 's,^.*\((.*)\),\1,g' | tr '|' ' ' | tr -d '\\'; } | xargs -n1 | sort -r -f -u | xargs | sed -r -e 's,[[:space:]]+,|,g' -e 's,\.,\\\\\.,g'))"
      sed -r -i "s,SetEnvIfNoCase Host \"\([^[:space:]]+\),SetEnvIfNoCase Host \"${host_aliases_regex},g" $HTTPD_CONF
      [[  -e ${CAMP_AC_ROOT}/nl/build/win64/lib/.htaccess ]] || echo 'IndexIgnore .htaccess *.lib' > ${CAMP_AC_ROOT}/nl/build/win64/lib/.htaccess
      echo "<html><meta name=\"google\" content=\"notranslate\"><head><title>Adobe Campaign Classic server Info</title></head><body><p><br> $(trim $(exec_command_exists nlserver && nlserver config -version | awk -F ">" '{print $2;}')) on branch ${l_ACC_BRANCH}</p><p><a href=\"/accbuild/\">ACC Build</a></p><br><p><a href=\"/accbuild/nlclient/Release/nlclient.exe\">Download ACC console binary(Release)</a><br><a href=\"/accbuild/win64/lib\">Download ACC console shared dlls(Release)</a></p><br></body></html>" > ${APACHE_ROOT}/htdocs/acc.html
      $HTTPD &
    ;;
    [sS][tT][oO][pP])
      HTTPD_PID=$(ps -e -s | grep httpd | awk '{print $1;}')
      [[ ! -z ${HTTPD_PID} ]] && kill -TERM ${HTTPD_PID}
    ;;
    [sS][tT][aA[tT]*)
      HTTPD_PID=$(ps -e -s | grep httpd | awk '{print $1;}')
      [[ ! -z ${HTTPD_PID} ]] &&
      { curl -s http://$(hostname --fqdn)/server-status > /tmp/apache.html; exec_command_exists lynx && lynx -dump /tmp/apache.html || cat /tmp/apache.html; }
    ;;
    [dD][eE][bB][uU][gG])
      isCygwin && _DEBUG_LAUNCHER_='launch VsJITDebugger.exe '  || _DEBUG_LAUNCHER_='gdb --args '
      ${_DEBUG_LAUNCHER_} $HTTPD  "$@"
    ;;
    i*)
      HTTPD_PID=$(ps -e -s | grep httpd | awk '{print $1;}')
      [[ ! -z ${HTTPD_PID} ]] &&
      { curl -s http://$(hostname --fqdn)/server-info   > /tmp/apache.html; exec_command_exists lynx && lynx -dump /tmp/apache.html || cat /tmp/apache.html; }
    ;;
    -V*)
      $HTTPD -V
    ;;
    *)
      $HTTPD -v
    esac
    return $?
 }
 function __getJHome {
    local findArgs varToSet
    [[ "X-${1}" = "X-JAVA" ]] && [[ -z ${JAVA_HOME} ]] && findArgs='javac'       && varToSet=JAVA_HOME
    [[ "X-${1}" = "X-JDK"  ]] && [[ -z ${JDK_HOME}  ]] && findArgs='javac'       && varToSet=JDK_HOME
    [[ "X-${1}" = "X-JRE"  ]] && [[ -z ${JRE_HOME}  ]] && [[ -z ${JDK_HOME}  ]]  && findArgs='java -i jre' && varToSet=JRE_HOME
    [[ "X-${1}" = "X-JRE"  ]] && [[ -n ${JRE_HOME}  ]] && [[ ! -d ${JRE_HOME} ]] && unset JRE_HOME varToSet
    if [[ -n ${varToSet} ]]; then
      echo "Finding ${findArgs%% *}...and if found will update system path with its location" | STDWARN
      local binPath=$(findW -u "${findArgs}")
      [[ ! -z ${binPath} ]] && declare -g ${varToSet}="$(dirname "$(dirname "$(wstyle "${binPath}")")")" &&  cacheEnvVar ${varToSet}
    fi
  }
else
  APACHE_ROOT='/etc/apache2'
  export HTTPD='sudo apache2ctl'
  if [ -d $APACHE_ROOT ]; then
    export APACHE_ROOT="$(getPlatformPath ${APACHE_ROOT})"
  fi
 function __getJHome {
    local findArgs varToSet
    [[ "X-${1}" = "X-JAVA" ]] && [[ -z ${JAVA_HOME} ]] && findArgs='javac'  && varToSet=JAVA_HOME
    [[ "X-${1}" = "X-JDK"  ]] && [[ -z ${JDK_HOME}  ]] && findArgs='javac'  && varToSet=JDK_HOME
    [[ "X-${1}" = "X-JRE"  ]] && [[ -z ${JRE_HOME}  ]] && [[ -z ${JDK_HOME}  ]] && findArgs='java' && varToSet=JRE_HOME
    [[ "X-${1}" = "X-JRE"  ]] && [[ -n ${JRE_HOME}  ]] && [[ ! -d ${JRE_HOME} ]] && unset JRE_HOME varToSet
    if [[ -n ${varToSet} ]]; then
      echo "Finding ${findArgs%% *} ..." | STDWARN
      local binPath=$(findW -u "${findArgs}")
      [[ ! -z ${binPath} ]] && declare -g ${varToSet}="$(dirname $(dirname $(readlink -f $binPath)))" && cacheEnvVar ${varToSet}
    fi
  }
  if [[ -z $INSTANCE_NUM ]]; then
  function apache {
    case "$1" in
    [sS][tT][aA][rR][tT])
      pushd $CAMP_AC_ROOT > /dev/null
      local l_ACC_BRANCH=$(currentBranch)
      popd > /dev/null
      local HTTPD_CONF=${APACHE_ROOT}/apache2.conf
      local host_aliases_regex="($({ cat /etc/hosts | grep -E "^$(getIP)" | awk -F"#" '{print $1;}' | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF;}'; hostname --fqdn; cat $HTTPD_CONF | grep -o -E -i 'SetEnvIfNoCase Host "\([^[:space:]]+\)' | sed -r 's,^.*\((.*)\),\1,g' | tr '|' ' ' | tr -d '\\'; } | xargs -n1 | sort -r -f -u | xargs | sed -r -e 's,[[:space:]]+,|,g' -e 's,\.,\\\\\.,g'))"
      sudo sed -r -i "s,SetEnvIfNoCase Host \"\([^[:space:]]+\),SetEnvIfNoCase Host \"${host_aliases_regex},g" $HTTPD_CONF

      sudo systemctl start apache2
      sudo echo "<html><meta name=\"google\" content=\"notranslate\"><head><title>Adobe Campaign Classic server Info</title></head><body><p><br> $(trim $(exec_command_exists nlserver && nlserver config -version | awk -F ">" '{print $2;}')) on branch ${l_ACC_BRANCH}</p><p><a href=\"/accbuild/\">ACC Build></a></p><br></body></html>" > ${APACHE_ROOT}/htdocs/acc.html
    ;;
    [sS][tT][oO][pP])
      sudo systemctl stop apache2
    ;;
    [sS][tT][aA[tT]*)
      sudo systemctl status apache2
    ;;
    i*)
      [[ X$(sudo systemctl status apache2 | grep -E "\s+Active:" | awk '{print $2;}') = "Xactive" ]] && { curl -s http://$(hostname --fqdn)/server-info > /tmp/apache.html; exec_command_exists lynx && lynx -dump /tmp/apache.html || cat /tmp/apache.html; }
    ;;
    -V*)
      $HTTPD -V
    ;;
    *)
      $HTTPD -v
    esac
    return $?
  }
  else
  function apache {
    case "$1" in
    [sS][tT][aA][rR][tT])
      sudo systemctl stop apache2
      sudo sed -r -i "s|^\s*ServerName .*|ServerName $(hostname --fqdn)|" ${APACHE_ROOT}/apache2.conf
      sudo /usr/sbin/apache2 -k stop
      pushd $CAMP_AC_ROOT > /dev/null
      local l_ACC_BRANCH=$(currentBranch)
      popd > /dev/null
      local HTTPD_CONF=${APACHE_ROOT}/apache2.conf
      local host_aliases_regex="($({ cat /etc/hosts | grep -E "^$(getIP)" | awk -F"#" '{print $1;}' | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF;}'; hostname --fqdn; cat $HTTPD_CONF | grep -o -E -i 'SetEnvIfNoCase Host "\([^[:space:]]+\)' | sed -r 's,^.*\((.*)\),\1,g' | tr '|' ' ' | tr -d '\\'; } | xargs -n1 | sort -r -f -u | xargs | sed -r -e 's,[[:space:]]+,|,g' -e 's,\.,\\\\\.,g'))"
      sudo sed -r -i "s,SetEnvIfNoCase Host \"\([^[:space:]]+\),SetEnvIfNoCase Host \"${host_aliases_regex},g" $HTTPD_CONF

      sudo systemctl start apache2
      sudo echo "<html><meta name=\"google\" content=\"notranslate\"><head><title>Adobe Campaign Classic server Info</title></head><body><p><br> $(trim $(exec_command_exists nlserver && nlserver config -version | awk -F ">" '{print $2;}')) on branch ${l_ACC_BRANCH}</p><p><a href=\"/accbuild/\">ACC Build></a></p><br></body></html>" > ${APACHE_ROOT}/htdocs/acc.html
      sudo /usr/sbin/apache2 -k start
    ;;
    [sS][tT][oO][pP])
      sudo systemctl stop apache2
      local HTTPD_PID=$(ps -e | grep apache2 |  sed -r 's/[[:space:]]+/ /g' | cut -d ' '  -f2) && [[ ! -z ${HTTPD_PID} ]] && sudo /usr/sbin/apache2 -k stop
    ;;
    [sS][tT][aA[tT]*)
      local HTTPD_PID=$(ps -e | grep apache2 |  sed -r 's/[[:space:]]+/ /g' | cut -d ' '  -f2) && [[ ! -z ${HTTPD_PID} ]] && curl http://$(hostname --fqdn)/server-status
    ;;
    i*)
      [[ X$(sudo systemctl status apache2 | grep -E "\s+Active:" | awk '{print $2;}') = "Xactive" ]] && { curl -s http://$(hostname --fqdn)/server-info > /tmp/apache.html; exec_command_exists lynx && lynx -dump /tmp/apache.html || cat /tmp/apache.html; }
    ;;
    -V*)
      $HTTPD -V
    ;;
    *)
      $HTTPD -v
    esac
    return $?
  }
  fi
fi
if [[ $(( BOOT_OPTIONS & 16 )) -ne 0 ]]; then
  __getJHome JDK
  __getJHome JRE
  __getJHome JAVA
fi
unset -f __getJHome
function registerRootCert {
  local APACHE_CONF_DIR=${APACHE_ROOT}
  isCygwin && APACHE_CONF_DIR=$(cygpath -u ${APACHE_ROOT})conf
  echo "${GREEN_COL}INFO:${RESET_COL} Using ${OPENSSL_BIN} $(${OPENSSL_BIN} version)"
  local envSetupDir="$(readlink -f $CAMP_AC_ROOT/../acc-dev/acc-dev-setup)"
  local rootCA="${envSetupDir}/rootCA.pem"
  local rootCAKey="${envSetupDir}/rootCAKey.pem"
  if ! isCygwin; then
    [[ ! -e ./openssl.conf ]] && sudo cp $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/openssl.conf ${APACHE_CONF_DIR}
    sudo chown -R $(whoami) ${APACHE_CONF_DIR}
  fi
  if [ -f "${rootCA}" -a -f "${rootCAKey}" ]; then
      echo "${GREEN_COL}INFO:${RESET_COL}Root certificate(and key) already exists on disk..We shall now register it with Windows and Cygwin cert stores."
  else
      local yn
      read -p "Generating new Root certificate(and key).Are you sure you do not want to use existing root cert @git.${ADOBE_CORP_DOMAIN}:hparmar/acc-dev.git   /acc-dev-setup? (y/[n]) " yn
      yn=${yn:0:1}
      if [ "X${yn,,}" != "Xy" ] ;  then
        return
      fi
      local userFullName="$(getUserInfo -fullname)"
      local ORG_NAME="$(getUserInfo -org)"
      pushd ${APACHE_CONF_DIR}
      sed -r -i "s/^\s*organizationName.*/organizationName = ${ORG_NAME}/g" ./openssl.conf
      sed -r -i "s/^\s*commonName.*/commonName = acc-dev-rootCA.${ADOBE_CORP_DOMAIN}/g" ./openssl.conf
      sed -r -i "s/^\s*organizationalUnitName.*/organizationalUnitName = ${ORG_UNIT_NAME}/g" ./openssl.conf
      sed -r -i "s/^\s*default_bits.*/default_bits = 4096/g" ./openssl.conf
      sed -r -i "s/^\s*keyUsage.*/keyUsage = critical,cRLSign,digitalSignature,keyCertSign/g" ./openssl.conf
      sed -r -i "s/^\s*extendedKeyUsage(.*)/# extendedKeyUsage\1/g" ./openssl.conf
      sed -r -i "s/^\s*emailAddress.*/emailAddress = hparmar@${ADOBE_DOMAIN}/g" ./openssl.conf
      sed -r -i "s/^\s*name.*/name = ${userFullName}/g" ./openssl.conf
      sed -r -i "s/^\s*DNS\.1 .*/DNS\.1 = acc-dev-rootCA.${ADOBE_CORP_DOMAIN}/g" ./openssl.conf
      local default_bits=$(getCmdValue "cat openssl.conf | grep -n '^\s*default_bits' | cut -d '=' -f2 | sed s/\ //g")
      rm -rf rootCA.pem
      rm -rf rootCAKey.pem
      ${OPENSSL_BIN} genrsa -des3 -out rootCAKey.pem  "$default_bits"
      ${OPENSSL_BIN} req -addext basicConstraints=critical,CA:TRUE,pathlen:5 -config ./openssl.conf -new -nodes -x509 -sha256 -key rootCAKey.pem -days 1095 -out rootCA.pem
      mv rootCA.pem     "${rootCA}"
      mv rootCAKey.pem  "${rootCAKey}"
      sudo chmod 744 ${rootCA}
      sudo chmod 744 ${rootCAKey}
      popd
  fi
  pushd "${envSetupDir}"
  if isCygwin; then
    local CERT_UTIL="$(cygpath -w $(findW -i windows certutil))"
    local delStoreCmd="-Command ${CERT_UTIL} -delstore Root acc-dev-rootCA.${ADOBE_CORP_DOMAIN}"
    wps -Command "Start-Process $PWSHELL  -ArgumentList '${delStoreCmd}' -Wait -Verb RunAs"
    local wp=$(getCmdValue getPlatformPath)
    local addStoreCmd="-Command ${CERT_UTIL} -addstore Root ${wp}rootCA.pem"
    wps -Command "Start-Process $PWSHELL  -ArgumentList '${addStoreCmd}' -Wait -Verb RunAs"
    for certFile in ca-bundle.trust.crt ca-bundle.crt; do
      if [[ -e /etc/ssl/certs/${certFile} ]]; then
        # remove/delete any existing 'acc-dev-rootCA' certificates.
        sed -i -r "/^[#[:space:]]+acc-dev-rootCA.${ADOBE_CORP_DOMAIN}/,/^-+END CERTIFICATE-+$/d" /etc/ssl/certs/${certFile}
        local tokeep=$(wc -c <<< "$(< "/etc/ssl/certs/${certFile}")")
        dd if=/dev/null of="/etc/ssl/certs/${certFile}" bs=1 seek=${tokeep}
        # Add new certificate.
        echo -e "\n# acc-dev-rootCA.${ADOBE_CORP_DOMAIN}" >> /etc/ssl/certs/${certFile}
        cat ${rootCA} | dos2unix >> /etc/ssl/certs/${certFile}
      else
        echo "${RED_COL}/etc/ssl/certs/${certFile}${RESET_COL} not found..Cygwin curl may have issues"
      fi
    done
  else
    local certFile=ca-certificates.crt
    sudo chown $(whoami) /etc/ssl/certs/${certFile}
    # remove/delete any existing 'acc-dev-rootCA' certificates.
    sudo sed -i -r "/^[#[:space:]]+acc-dev-rootCA.${ADOBE_CORP_DOMAIN}/,/^-+END CERTIFICATE-+$/d" /etc/ssl/certs/${certFile}
    local tokeep=$(wc -c <<< "$(< "/etc/ssl/certs/${certFile}")")
    dd if=/dev/null of="/etc/ssl/certs/${certFile}" bs=1 seek=${tokeep}
    # Add new certificate.
    echo -e "\n# acc-dev-rootCA.${ADOBE_CORP_DOMAIN}" >> /etc/ssl/certs/${certFile}
    cat ${rootCA} | dos2unix >> /etc/ssl/certs/${certFile}
    sudo chown root /etc/ssl/certs/${certFile}
  fi
  popd
}
function installPowershell {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) -f(force) ] -- Installs latest version of Windows Powershell 7." && return
  if ! exec_command_exists pwsh  && ! exec_command_exists powershell || [ "X${1,,}" = "X-f" ]; then
    if isCygwin; then
      local latest_pwsh_Release_URL=https://github.com$(curl -s https://github.com/PowerShell/PowerShell/tags | grep "/PowerShell/PowerShell/releases" | grep "<a href" | head -n 1 | getXMLAttrVal a href)
      latest_pwsh_Release_URL=${latest_pwsh_Release_URL/\/tag\//\/download\/}/PowerShell-${latest_pwsh_Release_URL##*/v}-win-x64.msi
      download ${latest_pwsh_Release_URL} wpsinstall.msi
      msiexec.exe /i wpsinstall.msi
    else
      aptS update
      aptS install curl wget gnupg apt-transport-https
      local os=$(cat /etc/os-release | grep ^ID= | sed 's,^ID=,,')
      local osVersion=$(cat /etc/os-release | grep ^VERSION_ID= | sed 's,^VERSION_ID=,,' | sed 's,\",,g')
      curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
      curl https://packages.microsoft.com/config/${os}/${osVersion}/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
      download https://packages.microsoft.com/config/${os}/${osVersion}/packages-microsoft-prod.deb
      sudo dpkg -i packages-microsoft-prod.deb
      aptS update
      aptS install powershell
      alias wps=pwsh
    fi
  else
    wps -version
    echo "${GREEN_COL}INFO:${RESET_COL} Powershell already exists... Use -f to force install latest version."
  fi
}
function installJava {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) -f(force) ] [ 8 | 11 | 13 |14] -- Installs Zulu java of specific major version(x64 bit) -- Default java11." && return
if ! exec_command_exists javac || [ "X${1,,}" = "X-f" ]; then
  # echo "Did not find java in your machine. Download and install java (atleast java8)"
  if ! isCygwin; then
    local openJDKVersion=$(apt list openjdk-*-jdk 2> /dev/null | grep openjdk | sed -r 's,/.*,,' | head -n 1 | cut -d '-' -f2)
    aptS install openjdk-${openJDKVersion}-jdk*
    return $?
  fi
  if [ -z ${USE_ORACLE_JAVA} ]; then
    [[ "X${1,,}" = "X-f" ]] && shift
    local yn
    local downloadsFolder="$(getUsersFolder Downloads)"
    [[ -z ${downloadsFolder} ]] || pushd "${downloadsFolder}"
    local java_x64_installer='zulu11.45.28-sa-jdk11.0.10-win_x64.msi'
    [[ ! -z $1 ]] && java_x64_installer=$(echo -ne "zulu8.56.0.22-sa-jdk8.0.302-win_x64.msi\nzulu11.45.28-sa-jdk11.0.10-win_x64.msi\nzulu13.33.26-sa-jdk13.0.4-win_x64.msi\nzulu14.29.24-sa-jdk14.0.2-win_x64.msi\n" | grep --color=never "zulu${1}")
    local java_x86_installer='zulu8.54.0.22-sa-jdk8.0.292-win_i686.msi'
    local zv_x64=$(echo ${java_x64_installer} | sed -r 's,^[^0-9]+([0-9.]+).*,\1,')
    yn=${zv_x64#*.}
    zv_x64=${zv_x64%%.*}.${yn%%.*}
    local zv_x86=$(echo ${java_x86_installer} | sed -r 's,^[^0-9]+([0-9.]+).*,\1,')
    yn=${zv_x86#*.}
    zv_x86=${zv_x86%%.*}.${yn%%.*}
    if [[ -f ${java_x64_installer} && -f ${java_x86_installer} ]]; then
       echo "${GREEN_COL}INFO:${RESET_COL} Using already downloaded Zulu java installers presernt in ${downloadsFolder} folder..."
    else
      echo "${GREEN_COL}INFO:${RESET_COL} Downloading  zulu java installers from artifactory....${java_x64_installer}  and ${java_x86_installer}"
      wps -Command "Start-Process https://artifactory-uw2.adobeitc.com"
      read -p "After login into artifactory  using okta/symantec, Press any key here to continue..." yn
      wps -Command "Start-Process https://artifactory-uw2.adobeitc.com/artifactory/list/binaries-azul-remote/ZuluCatalog/Zulu${zv_x64%%.*}/${zv_x64}/${java_x64_installer}"
      wps -Command "Start-Process https://artifactory-uw2.adobeitc.com/artifactory/list/binaries-azul-remote/ZuluCatalog/Zulu${zv_x86%%.*}/${zv_x86}/${java_x86_installer}"
      echo "${YELLOW_COL}${BOLD}After${RESET_COL} java installers download has finished into ${YELLOW_COL}${downloadsFolder} ( $(native ${downloadsFolder}) )${RESET_COL} folder, Press any key here to continue..."
      read yn
      [[ -z ${downloadsFolder} ]] || pushd "${downloadsFolder}"
      [[ -f ${java_x64_installer} && -f ${java_x86_installer} ]] || { echo "Java installers(32/64) not found in ${downloadsFolder}...Exit" | STDERR || return $?; }
    fi
    echo "Removing Zulu java ..."
    local uninstall_zulu_java_cmd="-Command Get-CimInstance -Class win32_product -Filter  \"\"\"\"Name like \"\"\`''%Zulu%\"\"\`''\"\"\"\" |  ForEach-Object -Process { Write-Host Removing \"\"\`''\$_\"\"\`''...; Invoke-CimMethod -InputObject \$_ -Name Uninstall }"
    wps -Command "Start-Process $PWSHELL  -ArgumentList '${uninstall_zulu_java_cmd}' -Wait -Verb RunAs"
    echo "About to Install Zulu java ..."
    local javaInstallFeatures=ZuluInstallation
    [[ ${1} -eq 8 ]] && javaInstallFeatures="${javaInstallFeatures},FeatureOracleJavaSoft"
    msiexec.exe /i ${java_x64_installer} ADDLOCAL=${javaInstallFeatures} /qf
    [[ ${1} -eq 8 ]] && msiexec.exe /i ${java_x86_installer} ADDLOCAL=${javaInstallFeatures}} /qf
    popd

    local dest="$(native "${PROGRAMFILES}\Zulu")"
    local JRE_Location
    wps -Command "Push-Location '${dest}'; New-Item -Path jdk -Force -ItemType SymbolicLink -Target ./zulu-${zv_x64%%.*}; Pop-Location"
    [[ -d ${dest}\\jdk ]] && wps -Command "[Environment]::SetEnvironmentVariable('JDK_HOME_x64','${PROGRAMFILES}\\Zulu\\jdk','Machine')" || { echo "${RED_COL}ALERT:${RESET_COL}JDK instllation not found"; return  2; }
    JRE_Location='JDK_HOME_x64'
    [[ -d ${dest}\\jdk\\jre ]] && wps -Command "Push-Location '${dest}'; New-Item -Path jre -Force -ItemType SymbolicLink -Target ./jdk/jre; Pop-Location" && wps -Command "[Environment]::SetEnvironmentVariable('JRE_HOME_x64','${PROGRAMFILES}\\Zulu\\jre','Machine')" && JRE_Location='JRE_HOME_x64'

    dest="$(native "${PROGRAMFILES} (x86)\Zulu")"
    if [[ -d "${dest}" ]]; then
      wps -Command "Push-Location '${dest}'; New-Item -Path jdk -Force -ItemType SymbolicLink -Target ./zulu-${zv_x86%%.*}; Pop-Location"
      [[ -d ${dest}\\jdk ]] && wps -Command "[Environment]::SetEnvironmentVariable('JDK_HOME_x86','${PROGRAMFILES} (x86)\\Zulu\\jdk','Machine')" || { echo "${YELLOW_COL}WARN:${RESET_COL}JDK 32 bit instllation not found"; }
      [[ -d ${dest}\\jdk\\jre ]] && wps -Command "Push-Location '${dest}'; New-Item -Path jre -Force -ItemType SymbolicLink -Target ./jdk/jre; Pop-Location" && wps -Command "[Environment]::SetEnvironmentVariable('JRE_HOME_x86','${PROGRAMFILES} (x86)\\Zulu\\jre','Machine')" && [[ -z ${JRE_Location} ]] && JRE_Location='JRE_HOME_x86'
    fi

    wps -Command "Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' 'JAVA_HOME' '%JDK_HOME_x64%'  -Type 'ExpandString'"
    wps -Command "Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' 'JDK_HOME'  '%JDK_HOME_x64%'  -Type 'ExpandString'"
    [[ -z ${JRE_Location} ]] || wps -Command "Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' 'JRE_HOME'  '%${JRE_Location}%'  -Type 'ExpandString'"
    wps -Command "\$p=([System.Environment]::GetEnvironmentVariable('Path','Machine') + ';%JAVA_HOME%\\bin\\'); Set-ItemProperty 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment' 'Path' \$p -Type 'ExpandString'"
    wps -Command "[Environment]::SetEnvironmentVariable('JAVA_OPTS','-Xms512M -Xmx1024M','Machine')"
  else
    local javaDownloadPage="https://www.oracle.com/java/technologies/javase-downloads.html"
    toggleXMLLintUse
    local jdkwebinstallerDownloadPage=https://www.oracle.com$(curl -s -L $javaDownloadPage | /bin/unix2dos | grep --color=never -i -e "<a href=.*JDK8.*" | grep --color=never -i downloads | head -n 1 | sed s/\'/\"/g | getXMLAttrVal a href)
    local jdkinstallerDownloadURL=https:$(curl -s -L $jdkwebinstallerDownloadPage | grep windows | grep downloads | grep x64 | grep jdk | grep -v demos | sed -r 's/^.*https/https/g' | sed -r 's/\".*//g' | sed s/\'/\"/g | getXMLAttrVal a data-file)
    toggleXMLLintUse
    echo "JDK8 download URL: "$jdkinstallerDownloadURL
    wps -Command "Start-Process -FilePath ${jdkinstallerDownloadURL}"
    pushd /tmp
    local jdkinstaller=$(ls -r ${TEAM_SHARE_LOCATION} | grep --color=never -E jdk.*exe | head -n 1)
    cp ${TEAM_SHARE_LOCATION}${jdkinstaller} . # /L
    ./${jdkinstaller} /s
  #  wget $jdkinstallerDownloadURL
    popd
  fi
  echo "It is now advised that you close and relaunch ${OSTYPE}."
  readEx "Closing terminal in " 5 " seconds... Press any key to continue working  in this session."
  if [ $? -ne 0 ]; then
    openTerm -r
  fi
  # refreshEnvPath_Windows
fi
}
function installIntelliJ {
    isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
    if ! exec_command_exists idea64; then
        local intellij_idea_community_version='2022.3.1'
        pushd /tmp
        download https://download-cdn.jetbrains.com/idea/ideaIC-${intellij_idea_community_version}.exe
        ./ideaIC-${intellij_idea_community_version}.exe # /S
        popd
        findW -v -u idea64
        refreshEnvPath_Windows
    else
        echo "IntelliJ IDEA already installed."
        type idea64
    fi
}
exec_command_exists mvn && alias mvn='TERM=cygwin mvn'
function installMaven {
    local mavenVersion="3.9.2"
    _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) -f(force) ] -- Installs maven ${mavenVersion}." && return
    if exec_command_exists mvn && ! _CONTAINS -f "$@"; then
        mvn -version
        echo "${GREEN_COL}INFO:${RESET_COL} Maven already exists @ $(which mvn)... Remove maven to install it afresh."
        return 0
    fi
    installJava
    local iRc=0
    toggleXMLLintUse
    mavenVersion=$(curl -s -L https://dlcdn.apache.org/maven/maven-3 | getXMLAttrVal_last a href | sed -r 's,[^.0-9],,g')
    local mavenDownloadURL="https://dlcdn.apache.org/maven/maven-${mavenVersion%%.*}/${mavenVersion}/binaries/apache-maven-${mavenVersion}-bin.zip"
    pushd /tmp
    download $mavenDownloadURL || { mavenVersion=$(curl -s -L https://dlcdn.apache.org/maven/maven-3 | getXMLAttrVal_last a href | sed -r 's,[^.0-9],,g'); mavenDownloadURL="https://dlcdn.apache.org/maven/maven-${mavenVersion%%.*}/${mavenVersion}/binaries/apache-maven-${mavenVersion}-bin.zip"; }
    download $mavenDownloadURL
    iRc=$?
    toggleXMLLintUse
    [[ ${iRc} -ne 0 ]] && return ${iRc}
    unzip -o apache-maven-${mavenVersion}-bin.zip
    local cpCmd="$(which cp) -f -p -r"
    sudo ${cpCmd} apache-maven-${mavenVersion}/* /usr/local/
    find . -iname *.dll -exec sudo chmod +x {} \;
    which mvn
    mvn --version
    popd
}
function installNode {
  pushd . > /dev/null
  cd ${ACC_WEB_UI}
  echo "Applicable node versions are:"
  jq .engines.node package.json | sed -r 's,[^0-9.], ,g' | awk '{for(i=1;i<=NF;++i){print $i;}}' | sort -t '.' -k1,1r -k2,2r -k3,3r > /tmp/nodeVersions
  local nodeVersions=$(cat /tmp/nodeVersions | xargs)
  echo ${nodeVersions}
  local nodeV=$(rlwrap -S "Select Node Version to install: " -H /tmp/nodeVersions -P $(head -n 1 /tmp/nodeVersions) -o cat)
  pushd $TMP > /dev/null
  download https://nodejs.org/download/release/v${nodeV}/node-v${nodeV}-x64.msi
  [[ -f node-v${nodeV}-x64.msi ]] && msiexec.exe /i node-v${nodeV}-x64.msi || { echo "Failed to install node version v${nodeV}-x64" ; return 1; }
  popd > /dev/null
  popd > /dev/null
  refreshEnvPath_Windows
}
function installPython3 {
  local pythonVersion="3.9.9"
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) ] -- Installs python ${pythonVersion}." && return
  if ! isCygwin; then
    local pipBinary=pip${pythonVersion%%.*}
    if ! exec_command_exists python3 || [ "X${1,,}" = "X-f" ]; then
      aptS install python3 python3-pip python3-requests
    fi
    local cur_pythonVersion=$(python3 -V | awk '{print $2}')
    if awk "BEGIN {exit !(${cur_pythonVersion%.*} < 3.9 )}"; then
      aptS remove python3 python3-pip
      aptS autoremove
      pushd /tmp > /dev/null
      download https://www.python.org/ftp/python/${pythonVersion}/Python-${pythonVersion}.tgz
      tar xvf Python-${pythonVersion}.tgz
      pushd Python-${pythonVersion} > /dev/null
      ./configure --enable-optimizations
      sudo make altinstall
      popd > /dev/null
      popd > /dev/null
      pushd $(dirname $(which python${pythonVersion%.*})) > /dev/null
      sudo ln -s python${pythonVersion%.*} python${pythonVersion%%.*}
      sudo ln -s pip${pythonVersion%.*} ${pipBinary}
      popd > /dev/null
    else
      pythonVersion=${cur_pythonVersion}
    fi
    if [ "X${1,,}" = "X-f" ]; then
      aptS install python3-requests
      sudo ${pipBinary} install --upgrade pip
  #   sudo ${pipBinary} install -U numpy==1.19.3
      sudo ${pipBinary} install setuptools wheel fire options num2words opencv-python pyttsx3 multipart requests numpy
      return 0
    fi
  fi
  if ! exec_command_exists python || [ "X${1,,}" = "X-f" ]; then
    readEx "About to update  python v3 install inside cygwin " 5 " seconds ..." || echo
    aptS install python3 python3-pip python3-requests
    python -m pip install --upgrade pip
    pip install setuptools wheel fire options num2words opencv-python pyttsx3 multipart numpy
  fi
  if [ -z "$(findW -i python3 -u python.exe)" ] || [ "X${1,,}" = "X-f" ]; then
    readEx "About to update  python v3 install on wndows but outside of cygwin " 5 " seconds ..." || echo
    local yn
    echo "${YELLOW_COL}WARN:${RESET_COL} You are advised to un-install all older Python versions."
    read  -p "${RED_COL}ALERT:${RESET_COL} Do you want to remove Python 2.x? ([y]/n) " yn
    yn=${yn:0:1}
    if [ "X${yn,,}" = "Xn" ] ;  then
      if [ "X${1,,}" = "X-f" ]; then
        echo -ne "Do you want to continue? ([y]/n) "
        read yn
        if [ "X${yn,,}" = "Xn" ] ;  then
          return
        fi
      fi
    else
      for i in $(aptS list | grep -e ^python2 | cut -d' ' -f1)
      do
        aptS remove $i
      done
      for i in $(aptS show | grep -e ^python2 | cut -d' ' -f1)
      do
        aptS remove $i
      done
      echo -ne "Python2 removed...Do you want to continue? ([y]/n) "
      read yn
      if [ "X${yn,,}" = "Xn" ] ;  then
        return
      fi
    fi
    pushd /tmp > /dev/null
    local python3WinInstallerURL="https://www.python.org$(curl -s --compressed "https://www.python.org/downloads/windows/" | grep "<a href=.*/downloads/release" | grep -i Latest | head -n 1 | xmlize | getXMLAttrVal a href)"
    python3WinInstallerURL="$(curl -s --compressed "${python3WinInstallerURL}" | grep "<a href=.*python.*64.*exe" | head -n 1 | xmlize | getXMLAttrVal a href)"
    download  "${python3WinInstallerURL}" python3Installer.exe
    chmod +x ./python3Installer.exe
    ./python3Installer.exe /passive InstallAllUsers=1 PrependPath=1
    refreshEnvPath_Windows
    "$(findW -i python3 -u python.exe)" -m pip install --upgrade pip
    "$(findW -i python3 -u pip.exe)" install -U setuptools wheel fire options num2words opencv-python pyttsx3 multipart requests numpy
    "$(findW -i python3 -u pip.exe)" install -U pywin32 pypiwin32 psutil wmi
    echo -ne "${RED_COL}ALERT:${RESET_COL} Do you want to install Tesseract (used as OCR for text detection in an image)? (y/[n])?"
    read yn
    yn=${yn:0:1}
    if [ "X${yn,,}" = "Xy" ] ;  then
      wcinstall tesseract
    fi
    popd > /dev/null
  fi
}

function installgh {
  exec_command_exists gh && _CONTAINS -q "$@" && return
    if ! exec_command_exists gh; then
        local version=2.49.0
        if isCygwin; then
            download https://github.com/cli/cli/releases/download/v${version}/gh_${version}_windows_amd64.zip /tmp/gh.zip
            pushd .
            cd /tmp
            unzip -j -o gh.zip bin/gh.exe
            sudo chmod 755 /tmp/gh.exe
            mv /tmp/gh.exe /usr/local/bin/
            popd > /dev/null
        else
            download https://github.com/cli/cli/releases/download/v${version}/gh_${version}_linux_amd64.deb /tmp/gh.deb
            sudo dpkg -i /tmp/gh.deb
        fi
    fi
    gh auth login --hostname git.${ADOBE_CORP_DOMAIN}
    local TO_MASTER_BRANCH=$MASTER_BRANCH
    local FROM_FEATURE_BRANCH=$(currentBranch)
    echo "Sample command to create a PR"
    echo "gh pr create --title "NEO-12345: [DONOT MERGE] Testing automation of PR creation from command line" --body "Pull request body" -B ${TO_MASTER_BRANCH} -H ${FROM_FEATURE_BRANCH} --fill-verbose"
}
function createPR {
  installgh -q
  _CONTAINS -h "$@" || [[ $# -eq 0 ]] && { echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <<from_old_commit> <to_newer_commit>> | <<from-feature_branch> <to_master_branch>>"; return 1; }
  local FROM_SRC=$1 TO_DEST=$2
  FROM_SRC_FEATURE_BRANCH=${FROM_SRC_FEATURE_BRANCH:=$(currentBranch)}
  TO_DEST_MASTER_BRANCH=${TO_DEST_MASTER_BRANCH:=${MASTER_BRANCH}}
  function __getBranchName {
      { git branch --contains $1; git branch; } | sort | uniq -d | sort -r | head -n 1 | sed -r 's,^[[:space:]*]+,,g'
  }
  local branch title
  [[ $FROM_SRC_FEATURE_BRANCH =~ ^[a-f0-9]{7,40}$ ]]  && branch=$(__getBranchName $FROM_SRC_FEATURE_BRANCH) && branch=${branch}-$(git show --no-color -s --oneline $FROM_SRC_FEATURE_BRANCH | tr -s '[[:space:]]' | cut -d' ' -f2- | tr ' ' '_' | head -c 8) && g branch -f ${branch} $FROM_SRC_FEATURE_BRANCH && git checkout ${branch} && git push --set-upstream origin ${branch}  && [[ -z $2 ]] && TO_DEST_MASTER_BRANCH=$FROM_SRC_FEATURE_BRANCH && title=$(git show --no-color -s --oneline ${FROM_SRC_FEATURE_BRANCH} | cut -d' ' -f2-) && FROM_SRC_FEATURE_BRANCH=${branch}
  [[ -z  ${title} ]] && title=$(git show --no-color -s --oneline ${FROM_SRC_FEATURE_BRANCH} | cut -d' ' -f2-)

  [[ $TO_DEST_MASTER_BRANCH =~ ^[a-f0-9]{7,40}$ ]] && branch=$(__getBranchName $TO_DEST_MASTER_BRANCH) && branch=${branch}-$(git show --no-color -s --oneline $TO_DEST | tr -s '[[:space:]]' | cut -d' ' -f2- | tr ' ' '_' | head -c 8) && g branch -f ${branch} $TO_DEST_MASTER_BRANCH && git checkout ${branch} && git push --set-upstream origin ${branch} && TO_DEST_MASTER_BRANCH=${branch}

  gh pr create --title "${title}" --body "Pull request body" -B ${TO_DEST_MASTER_BRANCH} -H ${FROM_SRC_FEATURE_BRANCH} --fill-verbose
}
function fixDebianRepo {
  isCygwin && { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  pushd ${TMP} > /dev/null
  download https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.7.5.2/aptsources-cleanup.pyz
  chmod a+x aptsources-cleanup.pyz
  sudo ./aptsources-cleanup.pyz -y
  popd > /dev/null
}

function setupDebianEnv {
  check_CAMP_AC_ROOT
  [[ ! -d $CAMP_AC_ROOT ]] && echo "Please ensure CAMP_AC_ROOT env variable points to existing directory" && return 1
  if ! exec_command_exists /sbin/mount.cifs || ! exec_command_exists javac || ! exec_command_exists java || [[ -z $JAVA_HOME ]] || [ "X${1,,}" = "X-f" ]; then
    setupSSHKeys
    local yn
    read -p "Do you want to continue setting up ${WSL_DISTRO_NAME} dev Environment, on what looks like a freshly installed machine ? ([y]/n)" yn
    yn=${yn:0:1}
    if [[ "X${yn,,}" = "Xn" ]]; then
      echo "${FUNCNAME[0]} Aborted..." | STDERR
      return $?
    fi
    aptS update
    local iRc=0
    for p in wget curl fio hdparm postgresql-client openssl vim unzip dos2unix bc procps iputils-ping netcat finger dnsutils whois moreutils bash-completion firefox-esr icu-devtools libreadline-dev libffi-dev libssl-dev zlib1g-dev libz-dev minizip libminizip-dev libxerces-c libxerces-c-dev libxalan-c-dev libxslt1-dev xsltproc net-tools tasksel man build-essential gdb manpages-dev devscripts libc6-dbg libc6 cmake openconnect network-manager iputils-tracepath mtr vim gnupg apt-transport-https apache2 lynx procps-ng ca-certificates jq software-properties-common libnss3-dev libgdbm-dev libncurses5-dev  libsqlite3-dev libbz2-dev espeak libespeak-ng1 alsa-utils unixodbc-common unixodbc-dev rlwrap cifs-utils openssh-client install libcurl4-openssl-dev libexpat1-dev libpcre3-dev libpcre2-dev libpcre2-posix2* libpcre3 libpcre++-dev libicu-dev uuid-dev libpq-dev libuuid-devel libxml2-utils libldap2-dev libsasl2-dev libc-ares-dev libc-ares2 openssh-server at btop
    do aptS install $p; [[ -z $iRc ]] && iRc=$?; done
    # Enable root ssh login
    sudo sed -i -r  's,#\s*PermitRootLogin.*,PermitRootLogin yes,g'  /etc/ssh/sshd_config
    [[ $iRc -eq 0 ]] || readEx "Some packages were not installed...Press any key to continue or Else setup will abort in next " 10 " seconds"
    [[ $? -eq 0 ]] || return $iRc
    installJava
    installPython3
    installPowershell
    wps -Command 'Register-PSRepository -Default -Verbose; Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted'
    wps -Command 'Install-Module PowerShellGet  -SkipPublisherCheck;  Install-Module -Name PSWindowsUpdate; Install-Module -Name JoinModule'
    wcinstall snowflake
    echo "${GREEN_COL}INFO:${RESET_COL} Install optional packages ... "
    aptS install mssql-tools
    aptS update
    aptS upgrade
    aptS install gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    aptS install apt-transport-https
    aptS update
    aptS install code
    sudo sed -i -r "s,^.*PermitUserEnvironment.*,PermitUserEnvironment yes," /etc/ssh/sshd_config
    download https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash    ~/.git-completion.bash
    download https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh                     ~/.git-prompt.bash
    local GDB_INIT_FILE='/etc/gdb/gdbinit'
    local permissions="$(ls -l ${GDB_INIT_FILE}  | awk '{print $3":"$4}')"
    sudo chown $(id -u):$(id -g) ${GDB_INIT_FILE}
    cat ${GDB_INIT_FILE} | grep "set target-wide-charset"  ||  { echo "set target-wide-charset UCS-2" | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "set print elements 10000" ||  { echo "set print elements 10000"      | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "set breakpoint pending"   ||  { echo "set breakpoint pending on"     | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "set history save"         ||  { echo "set history save on"           | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "set history size"         ||  { echo "set history size unlimited"    | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "set history expansion"    ||  { echo "set history expansion on"      | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "set exec-wrapper env"     ||  { echo "set exec-wrapper env 'LD_PRELOAD=libjsig.so'"  | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "set history filename"          ||  { echo "set history filename ~/.gdb_history"      | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "set history remove-duplicates" ||  { echo "set history remove-duplicates unlimited"  | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "alias sb"                      ||  { echo "alias sb=save breakpoints /tmp/.brkpts"   | tee -a ${GDB_INIT_FILE}; }
    cat ${GDB_INIT_FILE} | grep "alias rb"                      ||  { echo "alias rb=source /tmp/.brkpts"             | tee -a ${GDB_INIT_FILE}; }
    sudo chown "${permissions}" ${GDB_INIT_FILE}

    if ! exec_command_exists git; then
      aptS install git
    fi
    if [ "X${1,,}" = "X-f" ]; then
        aptS remove git
    fi
    if exec_command_exists git; then
      local gitv
      read -a gitv <<< "$(git --version | cut -d ',' -f1 | sed -r 's/^(.*?)(\s)([0-9\.]+)(\s*).*/\3/' | xargs -d '.')"
      if [[ ${gitv[0]} -lt 2 ]] || [[ ${gitv[0]} -eq 2 &&  ${gitv[1]} -lt 30 ]]; then
        aptS remove git
      fi
    fi
    if ! exec_command_exists git; then
      local GIT_HUB="https://github.com"
      pushd /tmp
      download ${GIT_HUB}$(curl -s ${GIT_HUB}/git/git/tags |  grep "/git/git/archive" | grep ".tar.gz" | getXMLAttrVal a href) /tmp/git_latest.tar.gz
      local gitSrcRoot=$(tar -zxvf /tmp/git_latest.tar.gz  | tail -n 1 | cut -d '/' -f1)
      pushd ${gitSrcRoot}
      # aptS install asciidoc
      make prefix=/usr all # doc info
      sudo make prefix=/usr install # install-doc install-html install-info
      popd
      popd
    fi
    pushd $CAMP_AC_ROOT
    git init
    git config --global init.defaultBranch ${MASTER_BRANCH}
    git config --global user.name "$(getUserInfo -fullname)"
    git config --global user.email "$(whoami)@${ADOBE_DOMAIN}"
    git config --global core.autocrlf false
    git config --global pull.rebase true
    git config --global fetch.prune true
    ## Diff
    git config --global diff.colorMoved zebra
    # Diff staged files highlighting individual character changes and space changes (see https://stackoverflow.com/questions/3231759/how-can-i-visualize-per-character-differences-in-a-unified-diff-file/25634420#25634420)
    git config --global alias.ds "diff --cached --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'"
    # Diff HEAD or specified commit with previous one highlighting individual character changes and space changes
    git config --global alias.diffp '!f() { git diff "${1-HEAD}"^.."${1-HEAD}" --color-words="[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+"; }; f'
    git config --global alias.dw 'diff --color-words'
    git config --global alias.dc 'diff --word-diff=color --word-diff-regex=.'

    git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'
    git config --global alias.amend-to '!f() { SHA=`git rev-parse "$1"`; git commit --fixup "$SHA" && GIT_SEQUENCE_EDITOR=true git rebase --interactive --autosquash "$SHA^"; }; f'
    git config --global alias.root 'rev-parse --show-toplevel'
    git config --global alias.exec '!exec'
    git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    git config --global alias.parent '!git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//"'
    git config --global alias.br '!f() { cmd="git branch"; [[ -n $1 ]] && opt=$(echo $1 | sed -r -e "s,^\*?,*,g" -e "s,\*?$,*,g") && cmd="$cmd -r --list "$opt""; $cmd --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]" --sort=-committerdate; }; f'
    git config --global alias.summ '!f() { local b=$1 a=$2; [[ -z $a ]] && git show --pretty="" --name-status $b && return 0; git merge-base --is-ancestor $b $a || { a=$1; b=$2; git merge-base --is-ancestor $b $a || return 1; }; git diff --stat $b $a; }; f'
    # some more git aliases : https://github.com/laurentkempe/dotfiles/blob/master/git/.gitconfig.aliases
    git read-tree --empty
    git reset --hard
    popd
    wcinstall gh
    if [[ ! -L ~/.bashrc ]]; then
      if isHostAlive git.${ADOBE_CORP_DOMAIN}; then
        pushd $CAMP_AC_ROOT/..
        git clone git@git.${ADOBE_CORP_DOMAIN}:hparmar/acc-dev.git
        pushd $CAMP_AC_ROOT/../acc-dev
        git pull
        popd
        popd
      fi
      if [ -f "$CAMP_AC_ROOT/../acc-dev/acc-dev-setup/.bashrc" ]; then
        if [ -f ~/.bashrc ]; then
          mv -f ~/.bashrc ~/.bashrc.$(date '+%d%b%Y_%H_%M_%S_%s')
        fi
        [[ -e ~/.bashrc ]] && rm -f ~/.bashrc
        ln -s $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/.bashrc ~/.bashrc
      fi
    fi
    # https://docs.microsoft.com/en-us/windows/wsl/wsl-config
    # https://devblogs.microsoft.com/commandline/automatically-configuring-wsl/
    # https://www.systutorials.com/docs/linux/man/8-ip-netns/#:~:text=ip%20netns%20add%20NAME%20-%20create%20a%20new,PID%20-%20create%20a%20new%20named%20network%20namespace
    # https://serverfault.com/questions/791833/ways-to-circumvent-cisco-anyconnect-vpn-routing-table
    local l_hostname=$(hostname)
    local l_hostname_fqdn=$(hostname --fqdn)
    if [[ ${l_hostname_fqdn} = ${l_hostname} ]]; then
      l_hostname=${l_hostname_fqdn%%.*}
      l_hostname_fqdn=${l_hostname}.${ADOBE_CORP_DOMAIN}
    fi
    if [[ ! -z ${WSL_DISTRO_NAME} ]] && [[ ! $l_hostname =~ ^.*-${WSL_DISTRO_NAME}$ ]]; then
      local windowsOSDrive=$(for d in {a..z}; do [[ -d /mnt/${d}/Windows/System32 ]] && echo $d && break; done)
      local wslconfig=/mnt/${windowsOSDrive}/Users/$(whoami)/.wslconfig
      local pws="/mnt/${windowsOSDrive}/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
      echo "Using Powershell $(${pws} -Command ' Write-Host $PSVersionTable.PSVersion')"
      if [[ ! -f ${wslconfig} ]]; then
      echo "
[wsl2]
  # Limits VM memory to use no more than 4 GB, this can be set as whole numbers using GB or MB\
  memory=4GB

  # Sets the VM to use two virtual processors
  processors=4

  # Turn off default connection to bind WSL 2 localhost to Windows localhost
  localhostforwarding=false

  # Turns on output console showing contents of dmesg when opening a WSL 2 distro for debugging
  # debugConsole=true
" > ${wslconfig}
      [[ -e $(getUsersFolder Downloads) ]] || {
        local getDlFolder_Cmd="(New-Object -ComObject Shell.Application).NameSpace(\"shell:Downloads\").Self.Path"
        local f="$(ustyle $(trim $(${pws} -Command ${getDlFolder_Cmd})))";
        [[ -d ${f} ]] && ln -s ${f} $(getUsersFolder Downloads);
      }
      [[ -e $(getUsersFolder .ssh) ]] || {
        local getHostHomeFolder_Cmd='$env:USERPROFILE';
        local f="$(ustyle $(trim $(${pws} -Command ${getHostHomeFolder_Cmd})))/.ssh";
        [[ -d ${f} ]] && ln -s ${f} $(getUsersFolder .ssh);
      }
      local wslCPUCores=4 wslMemGB=4
      if [[ -f ${pws} ]]; then
        wslMemGB=$(${pws} -Command '((Get-CimInstance Win32_PhysicalMemory).Capacity | Measure-Object -Sum).Sum / (1024*1024*1024)')
        wslMemGB=$(trim "${wslMemGB}")
        wslMemGB=$[${wslMemGB}/2]

        wslCPUCores=$(${pws} -Command '((Get-WmiObject Win32_Processor).NumberOfLogicalProcessors | Measure-Object -Sum).Sum')
        wslCPUCores=$(trim "${wslCPUCores}")
        wslCPUCores=$[${wslCPUCores}/2]
      fi
      sed -i -r "s,^\s*memory=.*,memory=${wslMem}GB,g" ${wslconfig}
      sed -i -r "s,^\s*processors=.*,processors=${wslCPUCores},g" ${wslconfig}
      sed -i -r "s,^\s*localhostforwarding=.*,localhostforwarding=false" ${wslconfig}
      fi
      # Turns on output console showing contents of dmesg when opening a WSL 2 distro for debugging
      if [[ -f /etc/wsl.conf ]]; then
        cat /etc/wsl.conf | grep -v -E 'hostname\s+=' | grep -v -E 'generateHosts\s+=' | sed -r "s,\[network\],[network]\nhostname = ${l_hostname}-${WSL_DISTRO_NAME}\ngenerateHosts = false," > /tmp/wsl.conf
      else
        local osVersion=$(cat /etc/os-release | grep ^VERSION_ID= | sed 's,^VERSION_ID=,,' | sed 's,\",,g')
        ${osVersion//[^[:alnum:]]/-}
        echo -e "[network]\nhostname = ${l_hostname}-${WSL_DISTRO_NAME}-${osVersion//[^[:alnum:]]/-}\ngenerateHosts = false" | tee /tmp/wsl.conf
      fi
      local mvCmd="$(which mv) -f"
      sudo ${mvCmd} /tmp/wsl.conf /etc/wsl.conf
      echo "${RED_COL}WSL: Hostname changed. ${YELLOW_COL}Reboot distro ${WSL_DISTRO_NAME}${RESET_COL}"
      # local ip=$(getIP)
      # 127.0.1.1 ensures that hostname --fqdn returns full hostname on wsl machines.
      # 127.0.0.1 is localhost..we do not touch that.
      add2HostsFile ${l_hostname_fqdn} 127.0.0.1 ${FUNCNAME[0]}
      echo ${l_hostname} | sudo tee /etc/hostname
    fi
    eval "$(ssh-agent -s)"
    createShortCut ${WSL_DISTRO_NAME}
    registerRootCert
    sudo rm -rf /tmp/!(.|..|bkp)
    sudo rm -rf /tmp/!(.|..|bkp)
    sudo setcap cap_net_raw+p $(which ping)
    sudo chmod u+s $(which ping)
    sudo setcap cap_net_raw+p $(which gdb)
    sudo setcap cap_sys_ptrace=eip $(which gdb)
    sudo chmod u+s $(which gdb)
    cacheEnvVar EXPERT_MODE yes
    cacheEnvVar -c EXPERT_MODE
    cacheEnvVar VPN_PIN 1234
    cacheEnvVar -c VPN_PIN
    cacheEnvVar CUSTOM_TITLEBAR $(whoami),
    cacheEnvVar -c CUSTOM_TITLEBAR
    cacheEnvVar TIME_PROFILE_SCRIPT 1
    cacheEnvVar -c TIME_PROFILE_SCRIPT
    cacheEnvVar ATTACH_TO_TERMINAL 0
    cacheEnvVar VS_IDENTIFIER 2019
    cacheEnvVar ENABLE_GIT_PS1 1
    cacheEnvVar -c ENABLE_GIT_PS1
    cacheEnvVar GUI_DIFF_TOOL_NAME Examdiff.exe
    cacheEnvVar -c GUI_DIFF_TOOL_NAME
    cacheEnvVar BOOT_OPTIONS 255
    cacheEnvVar -c BOOT_OPTIONS
  fi
  if isWSL; then
    [[ -f /usr/local/bin/wsl-netns.sh ]] || [[ -h /usr/local/bin/wsl-netns.sh ]] || sudo ln -s $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/wsl-netns.sh /usr/local/bin/wsl-netns.sh
    # Mount virtual disk on WSL for building campaign.
    local ACC_BUILD_DIR=${CAMP_AC_ROOT}/nl/build
    [[ ! -e ${ACC_BUILD_DIR} || ! -d ${ACC_BUILD_DIR} ]] && mkdir ${CAMP_AC_ROOT}/nl/build
    mount -l | grep ${ACC_BUILD_DIR} > /dev/null
    if [[ $? -ne 0 ]]; then
      local devicePartition=$(mount | grep "/mnt/wsl/" | awk '{print $1;}')
      local mountPoint=$(mount | grep "/mnt/wsl/" | awk '{print $3;}')
      mountPoint=${mountPoint%%/}
      if [[ -z ${devicePartition} ]]; then
        local index=1
        for d in $(cat /proc/partitions  | awk '{print $4;}' | grep -E "sd.*[[:digit:]]"); do
          # reverse line order 1) sed '1!G;h;$!d' 2) sed -n '1!G;h;$p'
          # 3) awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' 4) tac

          # find /mnt/wsl/* -maxdepth 0 -type d | awk "NR == ${index}"
          mountPoint=$(find /mnt/wsl/* -maxdepth 0 -type d | sed "${index}q;d")

          devicePartition=/dev/${d}
          [[ -z ${mountPoint} || ! -d ${mountPoint} ]] || [[ -z ${devicePartition} || ! -b ${devicePartition} ]] || sudo mount ${devicePartition} ${mountPoint}
          index=$[${index}+1]
        done
      fi
      INSTANCE_NUM=${INSTANCE_NUM:=1}
      devicePartition=$(mount | grep "/mnt/wsl/" | awk '{print $1;}' | head -${INSTANCE_NUM} | tail -1)
      mountPoint=$(mount | grep "/mnt/wsl/" | awk '{print $3;}' | head -${INSTANCE_NUM} | tail -1)
      if [[ -z ${devicePartition} ]]; then
        [[ -d ${ACC_BUILD_DIR} ]] && { readlink -f ${ACC_BUILD_DIR} | grep -E '^/mnt/[[:alpha:]]/.*' > /dev/null; } && echo "${YELLOW_COL}WARN:${RESET_COL} Build folder on mounted windows filesystem has strong negative performance bearing. Try using a native linux (virtual) disk..Run initWSL from with in cygwin to create one."
      elif [[ X${mountPoint%build} = X${mountPoint} ]]; then
        echo "Using ${devicePartition}(mounted on ${mountPoint}) to mount on ${ACC_BUILD_DIR}"
        [[ !  ${ACC_BUILD_DIR} ]] && mkdir -p ${ACC_BUILD_DIR}
        [[ -z ${mountPoint}    ]] || sudo umount ${mountPoint}
        sudo mount ${devicePartition} ${ACC_BUILD_DIR}
        sudo chown $(whoami):$(id -gn) ${ACC_BUILD_DIR}
      fi
        mount -t ext4 | sort -r -k 1
    fi
  fi
  # Mount indshare
  local l_team_loc=/mnt/${TEAM_SHARE_SERVER%%.*}/$(echo ${TEAM_SHARE_LOCATION} | awk -F '\' '{print $(NF-1);}')/
  local l_user_loc=/mnt/${TEAM_SHARE_SERVER%%.*}/$(echo ${USER_SHARE_LOCATION} | awk -F '\' '{print $(NF-1);}')/
  local l_team_cache=/mnt/${TEAM_SHARE_SERVER%%.*}/$(echo ${TEAM_SHARE_CACHE} | awk -F '\' '{print $(NF-1);}')/
  [[ ! -d ${l_team_loc} ]] && sudo mkdir -p ${l_team_loc}
  [[ ! -d ${l_user_loc} ]] && sudo mkdir -p ${l_user_loc}
  [[ ! -d ${l_team_cache} ]] && sudo mkdir -p ${l_team_cache}
  if isHostAlive ${TEAM_SHARE_SERVER}; then
    mount -t cifs | grep ${TEAM_SHARE_SERVER%%.*} > /dev/null 2>&1
    if [ $? -ne 0 ]; then
      local LDAP_PASS
      [[ ! -z ${ADB_LDAP_PASSWORD} ]] && LDAP_PASS=${ADB_LDAP_PASSWORD} || { read -s -p "Enter $(whoami)'s Adobe LDAP password:$(echo -e '\U0001F512')" LDAP_PASS; echo ; }
      sudo mount -t cifs -o username=$(whoami) -o password=${LDAP_PASS} -o uid=$(id -u) -o gid=$(id -g) ${TEAM_SHARE_LOCATION//\\//} ${l_team_loc}
      sudo mount -t cifs -o username=$(whoami) -o password=${LDAP_PASS} -o uid=$(id -u) -o gid=$(id -g) ${USER_SHARE_LOCATION//\\//} ${l_user_loc}
      sudo mount -t cifs -o username=$(whoami) -o password=${LDAP_PASS} -o uid=$(id -u) -o gid=$(id -g) ${TEAM_SHARE_CACHE//\\//} ${l_team_cache}
    fi
    mount -t cifs | grep ${TEAM_SHARE_SERVER%%.*} > /dev/null 2>&1
    [[ $? -eq 0 ]] && TEAM_SHARE_LOCATION=${l_team_loc} && USER_SHARE_LOCATION=${l_user_loc} && TEAM_SHARE_CACHE=${l_team_cache}
  fi
}
function loadProcessorCount {
  [[ $EFFECTIVE_PROCESSOR_COUNT -gt 0 ]] && return
  cacheEnvVar -f -c EFFECTIVE_PROCESSOR_COUNT
  if isCygwin; then
    local get_EffectiveProcessorCmd="((Get-CimInstance Win32_Processor).NumberOfLogicalProcessors | Measure-Object -Sum).Sum"
    [[ $PWSHELL_VERSION =~ ^5 ]] && get_EffectiveProcessorCmd="((Get-WmiObject Win32_Processor).NumberOfLogicalProcessors | Measure-Object -Sum).Sum"
    export EFFECTIVE_PROCESSOR_COUNT=$(trim $(wps -Command ${get_EffectiveProcessorCmd}))
  else
    export EFFECTIVE_PROCESSOR_COUNT=$(cat /proc/cpuinfo  | grep -E "\s*processor\s+:" | wc -l)
  fi
  cacheEnvVar EFFECTIVE_PROCESSOR_COUNT
}
function makeCamp {
  local forceBuild
  local branchName
  local cleanBuild
  local freeProcessors
  local doQuiteBuild
  loadProcessorCount
  [[ $# -eq 0 ]] && echo -e "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [options] [branch]\n\t[-[-]c,C (clean buld)]\n\t[-[-]f,F (force git pull and build)]\n\t[-[-]n,N (run only nlconf ..Do not build)]\n\t[-[-][q,Q (quite build)]\n\t[-[-]x,X (count of 'x' is processors(out of ${EFFECTIVE_PROCESSOR_COUNT})spared/unused while building)]\n\t[-[-]h,H (help)]" && return 1
  local doBuild=1
  while [ ! -z "$1" ]
  do
    if   [[ $1 =~ ^[-]+[hH].* ]]; then
      echo -e "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [options] [branch]\n\t[-[-]c,C (clean buld)]\n\t[-[-]f,F (force git pull and build)]\n\t[-[-]n,N (run only nlconf ..Do not build)]\n\t[-[-][q,Q (quite build)]\n\t[-[-]x,X (count of 'x' is processors(out of ${EFFECTIVE_PROCESSOR_COUNT}) spared/unused while building)]\n\t[-[-]h,H (help)]"
      return 0
    elif [[ $1 =~ ^[-]+[fF].* ]]; then
      forceBuild=$1
      cleanBuild=1
      doBuild=1
    elif [[ $1 =~ ^[-]+[cC].* ]]; then
      cleanBuild=1
      doBuild=1
    elif [[ $1 =~ ^[-]+[nN].* ]]; then
      doBuild=0
    elif [[ $1 =~ ^[-]+[qQ].* ]]; then
      doQuiteBuild=1
      doBuild=1
    elif [[ $1 =~ ^[-]+[xX].* ]]; then
      freeProcessors=$(nchars x ${1,,})
      doBuild=1
    elif [[ -z ${branchName} ]] && [[ ${1:0:1} != '-' ]]; then
      branchName=$1
      doBuild=1
    else
      echo -e "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [options] [branch]\n\t[-[-]c,C (clean buld)]\n\t[-[-]f,F (force git pull and build)]\n\t[-[-]n,N (run only nlconf ..Do not build)]\n\t[-[-][q,Q (quite build)]\n\t[-[-]x,X (count of 'x' is processors(out of ${EFFECTIVE_PROCESSOR_COUNT}) spared/unused while building)]\n\t[-[-]h,H (help)]"
      return 1
    fi
    shift
  done
  if [[ $cleanBuild -eq 1 ]]; then
    cd $CAMP_AC_ROOT/nl
    if [ -f $(getCampRoot)/nl/build/ncs/conf/serverConf.xml ]; then
      local backUpDir=$(getBackupLocation '')
      echo "${GREEN_COL}INFO:${RESET_COL} Back-up campaign config file(s) to ${backUpDir} folder."
      mkdir -p ${backUpDir}
      cp -p -v -i $(getCampRoot)/nl/build/ncs/conf/*.xml ${backUpDir}/
    fi
    echo "${GREEN_COL}INFO:${RESET_COL} Deleting build folder contents"
    rm -rf $(getCampRoot)/nl/build/*
    if [ $? -ne 0 ]; then
      echo "${RED_COL}ALERT:${RESET_COL} Some files in build folder are in use. Please delete build folder manually."
      return;
    fi
    if isHostAlive artifactory.${ADOBE_CORP_DOMAIN}; then
      echo "${GREEN_COL}INFO:${RESET_COL} Cleaning artifactory cache folder"
      rm -rf $(getCampRoot)/../artifacts_cache
    fi
    if isHostAlive git.${ADOBE_CORP_DOMAIN}; then
      pushd $(getCampRoot)/../globalmessages
      git pull
      popd
      pushd $(getCampRoot)/../v6SOAPAPI
      git pull
      popd
    fi
  fi
  if [ ! -z $forceBuild ]; then
    echo "${RED_COL}${BOLD}ALERT:${RESET_COL} You are about to remove all of campaign source: $(getCampRoot), global messages and integro tests folders!!!"
    if [[ ! $forceBuild =~ ^[-]+[fF][oO].* ]]; then
      readEx "Are you sure? Press any key to continue Else Press Ctrl+C to abort...Waiting for " 5 " seconds..."
    fi
    stopCampaign
    cd $(dirname $(getCampRoot))
    echo "${GREEN_COL}INFO:${RESET_COL} Deleting campaign root folder"
    rm -rfv $(getCampRoot)
    if isHostAlive artifactory.${ADOBE_CORP_DOMAIN}; then
      echo "${GREEN_COL}INFO:${RESET_COL} Cleaning artifactory cache folder"
      rm -rfv artifacts_cache
    fi
    echo "${GREEN_COL}INFO:${RESET_COL} Deleting globalmessages folder"
    rm -rf globalmessages
    echo "${GREEN_COL}INFO:${RESET_COL} Deleting integro folder"
    rm -rf v6SOAPAPI
    git clone git@git.${ADOBE_CORP_DOMAIN}:Campaign/ac.git
    git clone git@git.${ADOBE_CORP_DOMAIN}:Campaign/globalmessages.git
    git clone git@git.${ADOBE_CORP_DOMAIN}:AdobeCampaignQE/v6SOAPAPI.git
    git clone git@git.${ADOBE_CORP_DOMAIN}:Campaign/acc-web-ui.git
    cd $CAMP_AC_ROOT/nl
    isWSL && [[ ! -e build ]] && { [[ -d ${HOME}/build ]] || mkdir ${HOME}/build; } && ln -s ${HOME}/build/ build
    gSync -a
    if [ -z $branchName ]; then
      branchName=$(currentBranch)
    fi
  fi
  if [ ! -z $branchName ]; then
    cd $CAMP_AC_ROOT/nl
    echo "${GREEN_COL}INFO:${RESET_COL}   Setting up \"$branchName\" branch ..."
    git stash
    [[ $branchName != $(currentBranch) ]] && git checkout -b $branchName
    git pull
    [[ $branchName != $(currentBranch) ]] && git push -u origin $branchName
    git stash apply
    # Since we have fresh code from git now...we need to reset env
    cacheEnvVar CUR_CAMP_GIT_BRANCH $(currentBranch)
    initBuildEnv
  else
    cd $CAMP_AC_ROOT/nl
    local CUR_BRANCH=$(currentBranch)
    if [ "$CUR_BRANCH" = "master" ]; then
      git stash
      git checkout $MASTER_BRANCH
      git branch -d master
    fi
  fi
  if [[ $(fCount "$CAMP_AC_ROOT/nl/build") -eq 0 ]]; then
    local iRC
    wcinstall cmake -q
    cd $CAMP_AC_ROOT/nl
    source buildnumber.sh
    isCygwin || [[ X"$(git config --global --get core.autocrlf)" = X"false" ]] || { echo "ALERT: core.autocrlf must be set to 'false', Else you may see build issues" | STDERR; }
    # nlconf -translate all  # To generate language specific build.
    if exec_command_exists nlconf; then
      local logicalProcessors
      if isCygwin && [[ ! -z ${freeProcessors} ]]; then
        local effectiveProcessors=$(getCmdValue 'wps -Command "${get_EffectiveProcessorCmd}"')
        if [[ ${effectiveProcessors} -gt ${freeProcessors} ]] && logicalProcessors=$[${effectiveProcessors}-${freeProcessors}]; then
          sed -r -i "s,(set\(CMAKE_C.*)/MP(.*),\1/MP${logicalProcessors}\2," ${CAMP_AC_ROOT}/wpp/wpp.cmake
          sed -r -i "/[\$]+/! s,^(\s*)(set\(CMAKE_CXX_FLAGS_RELEASE\s+\")(.*)\"\),\1\2\3 /MP${logicalProcessors}\"\)," ${CAMP_AC_ROOT}/wpp/wpp.cmake
          echo "${GREEN_COL}INFO:${RESET_COL} Will use ${YELLOW_COL}${logicalProcessors}/${effectiveProcessors}${RESET_COL} Processors while building"
        fi
      fi
      if [ "$(getIDEVersion)" = "Microsoft Visual Studio 2012" ]; then
        if [ "X${BUILD_BIT_WIDE}" = "X32" ]; then
          export GENERATOR=$(echo $GENERATOR | sed -r 's/^(.*) Win64$/\1/')
          export CMKFLAGS="-A Win32"
        fi
        nlconf all
      else
        local VS2019_CHANGE_BUILD_NUMBER=9120
        if [[ ${BUILD_NUMBER} -lt ${VS2019_CHANGE_BUILD_NUMBER} ]]; then
          export BUILD_BIT_WIDE=32
          readEx "Build Platform ?([32]/64). Choose in " 5 " seconds. => "
          response=${response:0:2}
          if [ "X${response,,}" == "X64" ] ;  then
            export BUILD_BIT_WIDE=64
          fi
          echo "Building for ${BUILD_BIT_WIDE} bit"
          echo "cherry-pick change for building in VS2019"
          local GIT_ROOT=$(git rev-parse --show-toplevel)
          git checkout -f
          local vs2019_build_files
          readarray vs2019_build_files <<<"$(git cherry-pick -exn -m 1  0b15b1e | grep  CONFLICT)"
          for line in "${vs2019_build_files[@]}"; do
            if [ ! -z "$(echo "${line}" | cut -d ':' -f1 | grep delete)" ]; then
              rm -f "${GIT_ROOT}/$(echo "${line}" | cut -d':' -f2 | sed -r 's/^\s+//g' | cut -d' ' -f1)"
            fi
            local f=$(echo ${line} | rev | cut -d ' ' -f1 | rev)
            if [ -z ${f} ]; then
              continue
            fi
            f="${GIT_ROOT}/${f}"
            if [ ! -f ${f} ]; then
              continue
            fi
            readEx "Resolve conflicts in ${YELLOW_COL}${f}${RESET_COL}...Opening merged file(${f}) in editor " 5 " seconds...Please edit/save to resolve it."
            editor "${f}"
            flushInput
            local yn
            read -p "\nAre you done with resolve of conflict in ${f} ? ([y]/n) " yn
            yn=${yn:0:1}
            if [ "X${yn,,}" == "Xn" ] ;  then
              echo "${YELLOW_COL}WARN:${RESET_COL} Skipping ${YELLOW_COL}${f}${RESET_COL}...Ignoring conflicts may lead to build issues!"
            else
              echo "Adding $f to list of staged files...Commit of the changes will have to be done explicitly and manually."
              git add "${f}"
            fi
          done
          if [ -f ${CAMP_AC_ROOT}/nl/artifacts/protobuf.cmake ]; then
            #cat ${CAMP_AC_ROOT}/nl/artifacts/protobuf.cmake  | grep -B100 '"win32"' | head -n -1
            #cat ${CAMP_AC_ROOT}/nl/artifacts/protobuf.cmake  | grep -A100 '"win32"' | tail -n +5
            cat ${CAMP_AC_ROOT}/nl/artifacts/protobuf.cmake  | sed -r -n -e '1,/elseif.*"win32".*/p' | head -n -1 > /tmp/win32_protobuf_before.tmp
            cat ${CAMP_AC_ROOT}/nl/artifacts/protobuf.cmake  | sed -r -e '1,/elseif.*"win32".*/d' | sed -r -n -e '/elseif/,$p' > /tmp/win32_protobuf_after.tmp
            cat ${CAMP_AC_ROOT}/nl/artifacts/protobuf.cmake  | grep -A3 '"win32"' | sed -r 's,SHA1.*,SHA1 \"0a5f921cde7653c613f2ad8a94c8469ef8e90473\"),' | sed -r 's,PROTOBUFFILE.*,PROTOBUFFILE \"protobuf_2.6.1-2-win32.tgz\"),' > /tmp/win32_protobuf_modified.tmp
            cat /tmp/win32_protobuf_before.tmp /tmp/win32_protobuf_modified.tmp /tmp/win32_protobuf_after.tmp > ${CAMP_AC_ROOT}/nl/artifacts/protobuf.cmake
            rm -rf /tmp/win32_protobuf_*tmp
            git add ${CAMP_AC_ROOT}/nl/artifacts/protobuf.cmake
          elif  isHostAlive artifactory.${ADOBE_CORP_DOMAIN}; then
            echo "${GREEN_COL}INFO:${RESET_COL}   Downloading and extracting protobuf binaries from artifactory."
            if isCygwin; then
              pushd ${CAMP_AC_ROOT}/win32
              download https://artifactory.${ADOBE_CORP_DOMAIN}/artifactory/list/generic-campaign-artifacts-dev/protobuf/protobuf_2.6.1-2-win32.tgz
              /bin/gzip -d -c protobuf_2.6.1-2-win32.tgz | tar xvf -
              popd
              pushd ${CAMP_AC_ROOT}/win64
              download https://artifactory.${ADOBE_CORP_DOMAIN}/artifactory/list/generic-campaign-artifacts-dev/protobuf/protobuf_2.6.1-4-win64.tgz
              /bin/gzip -d -c protobuf_2.6.1-4-win64.tgz | tar xvf -
              popd
            else
              local os=$(cat /etc/os-release | grep ^ID= | sed 's,^ID=,,')
              local osVersion=$(cat /etc/os-release | grep ^VERSION_ID= | sed 's,^VERSION_ID=,,' | sed 's,\",,g')
              if [[ ${os,,} = "ubuntu" ]]; then
                os="debian"
                [[ $osVersion =~ 21\..* ]] && osVersion=11
                [[ $osVersion =~ 18\..* || $osVersion =~ 19\..* || $osVersion =~ 20\..* ]] && osVersion=10
                [[ $osVersion =~ 17\..* || $osVersion =~ 16\..* ]] && osVersion=9
                [[ $osVersion =~ 15\..* || $osVersion =~ 14\..* ]] && osVersion=8
                [[ $osVersion =~ 13\..* || $osVersion =~ 12\..* || $osVersion =~ 11\..* ]] && osVersion=7
              fi
              pushd ${CAMP_AC_ROOT}/linux_${os:0:3}${osVersion}
              download https://artifactory.${ADOBE_CORP_DOMAIN}/artifactory/list/generic-campaign-artifacts-dev/protobuf_2.6.1-1-${os:0:3}${osVersion}_amd64.tgz
              /bin/gzip -d -c protobuf_2.6.1-1-${os:0:3}${osVersion}_amd64.tgz | tar xvf -
              popd
            fi
            else
            echo "Do not know how to download artifactory.based third-party components. Please ensure artifactory is available or else copy libs to appropriate directory." | STDERR
          fi
          if [ "X${BUILD_BIT_WIDE}" = "X32" ]; then
            echo "${GREEN_COL}INFO:${RESET_COL}   Modifying modapache(used in nlsrv module)..."
            mv -f ${CAMP_AC_ROOT}/wpp/web/modapache22.cpp ${CAMP_AC_ROOT}/wpp/web/modapache22_orig.cpp
            mv -f ${CAMP_AC_ROOT}/wpp/web/modapache20.cpp ${CAMP_AC_ROOT}/wpp/web/modapache20_orig.cpp
            echo '#include "wpp.h"' > ${CAMP_AC_ROOT}/wpp/web/modapache20.cpp
            cp -f ${CAMP_AC_ROOT}/wpp/web/modapache24.cpp ${CAMP_AC_ROOT}/wpp/web/modapache22.cpp
            git add ${CAMP_AC_ROOT}/wpp/web/modapache22.cpp
            git show @:../wpp/web/modapache.cpp | tr '\n' '\f' | sed -r 's/#if[^#]+defined\(APACHE24\)\f[^#]+GetSBContentType[^#]+#endif[^#]+#if defined\(APACHE22\)\f/#if 1\f/' | tr '\f' '\n' > ${CAMP_AC_ROOT}/wpp/web/modapache.cpp
            git add ${CAMP_AC_ROOT}/wpp/web/modapache.cpp
          fi
          mkdir -p ${CAMP_AC_ROOT}/java/tomcat-7/endorsed
          local stashMsg="Changes for Building branch on VS2019"
          if [[ -z $(git stash list --branches="$(currentBranch)" --grep="${stashMsg}") ]]; then
            echo "${GREEN_COL}INFO:${RESET_COL} Stashing ${stashMsg}"
            git stash --keep-index -m "${stashMsg}"
          fi
          if isCygwin; then
            if [ "X${BUILD_BIT_WIDE}" = "X32" ]; then
              export CMKFLAGS="-A Win32"
              export GENERATOR=$(echo $GENERATOR | sed -r 's/^(.*) Win64$/\1/')
            fi
            nlconf -translate all
          else
            nlconf -debug -translate all
          fi
        else
          if isCygwin; then
            if [ "X${BUILD_BIT_WIDE}" = "X32" ]; then
              export CMKFLAGS="-A Win32"
              export GENERATOR=$(echo $GENERATOR | sed -r 's/^(.*) Win64$/\1/')
            fi
            nlconf -unit_test all
          else
            nlconf -debug -unit_test all
          fi
        fi
      fi
      iRC=$?
      [[ ! -z logicalProcessors ]] && git restore ${CAMP_AC_ROOT}/wpp/wpp.cmake
      ! isCygwin && [[ $iRc -eq 0 ]] && initBuildEnv # Updates LD_LIBRARY_PATH to include ACC specific thirdparty libs.
      [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} nlconf returned error."; return ${iRc}; }
    else
      echo "${RED_COL}ALERT:${RESET_COL} You do not seem to have campaign source code"
      echo "${RED_COL}ALERT:${RESET_COL} To setup fresh campaign dev/src Execute: ${YELLOW_COL}makeCamp  -f${RESET_COL}"
    fi
  fi
  if ! exec_command_exists javac; then
    echo "${RED_COL}ALERT:${RESET_COL} javac not found!"
    echo "${RED_COL}ALERT:${RESET_COL} Please ensure java 11 is insalled and JAVA_HOME, JDK_HOME, JRE_HOME e.t.c variables are all defined."
    echo "${RED_COL}ALERT:${RESET_COL} Please ensure JDK bin and JRE bin are part of your system path variable."
  else
    if [ $doBuild -eq 1 ]; then
      local JAVA11_CHANGE_BUILD_NUMBER=9569
      isCygwin && [[ ${BUILD_NUMBER} -lt ${JAVA11_CHANGE_BUILD_NUMBER} ]] && [[ $(javac -version 2>&1 | awk '{print $2;}' | awk -F"." '{print $1+$2;}') -gt 9 ]]  && { 
      echo "${YELLOW_COL}WARN:${RESET_COL} You are building ACC which needs java 8.However you have $(javac -version 2>&1 | awk '{print $2;}')";
      echo "You may choose to install older java by using for e.g using ${YELLOW_COL}wcinstall java -f 8${RESET_COL}"; }
      cd $CAMP_AC_ROOT/nl
#      readarray -td\\ dnames <<<"$(where devenv.exe)"; declare -p dnames
#      i=0
#      echo ${dnames[@]} # All elements in array
#      echo ${!dnames[@]} # Array of indexes 0 1 2 3 4 5
#      for s in "${dnames[@]}"
#      do
#        echo ${dnames[$i]}
#        i=$[$i+1]
#        echo "$s"
#        echo "$i out of ${#dnames[@]}"
#      done
      if isDevToolAvailable ; then
        local yn
        if [[ $doQuiteBuild -eq 1 ]]; then
            yn='Y'
        else
            flushInput
            read -p "Do you want to build campaign with $(getIDEVersion)? ([y]/n) " yn
            yn=${yn:0:1}
        fi
        if [ "X${yn,,}" != "Xn" ] ;  then
          echo "${GREEN_COL}INFO:${RESET_COL} Launching $(getIDEVersion)"
          echo "${GREEN_COL}INFO:${RESET_COL} Building solution...Run ${YELLOW_COL}setupCampaignDevServer${RESET_COL} afterwards if you need to setup campaign instance from scratch"
          if [[ $doQuiteBuild -eq 1 ]]; then
            buildsolutionInIDE ${cleanBuild}
          else
            ATTACH_TO_TERMINAL=1 buildsolutionInIDE ${cleanBuild} # Build nlserver
          fi
          # Building nlclient/ACC client console.
          if isCygwin && [[ -z $doQuiteBuild ]]; then
            if [ "X${BUILD_BIT_WIDE}" = "X32" ]; then
              ATTACH_TO_TERMINAL=1 DELAY_LAUNCH=$[3200/${EFFECTIVE_PROCESSOR_COUNT}] launch  "$(findW -i "${VS_IDENTIFIER}" -u devenv.exe)" build/ncs.sln /build "Release|Win32" /project nlclient
            else
              ATTACH_TO_TERMINAL=1 DELAY_LAUNCH=$[3200/${EFFECTIVE_PROCESSOR_COUNT}] launch  "$(findW -i "${VS_IDENTIFIER}" -u devenv.exe)" build/ncs.sln /build "Release|x64" /project nlclient
            fi
          fi
        fi
      else
        echo "${RED_COL}ALERT:${RESET_COL} IDE $(getIDEVersion) not found !!!..Please install compatible Visual Studio."
      fi
    fi
  fi
}
function initBuildEnv {
#  _TS initBuildEnv
  local ENV_SH_FILE="${CAMP_AC_ROOT}/nl/env.sh"
  [[ ! -f "${ENV_SH_FILE}" ]] && return 1;
  local envsh_md5=$(${OPENSSL_BIN} dgst -md5 ${ENV_SH_FILE} | awk '{print $2}')
  local camp_env="$CAMP_AC_ROOT/../acc-dev/acc-dev-setup/env.sh"
  local found_custom_baked_env_sh=1
  if [ ${envsh_md5} != $(cat ${camp_env} | grep "# optimized env.sh" | cut -d ' ' -f4) ]; then
    found_custom_baked_env_sh=0
    local git_hist_Cmd="git -C $(native $(dirname ${camp_env}))"
    ${git_hist_Cmd} checkout -f -- env.sh
    local found_custom_baked_env_sh=0
    # _TE initBuildEnv $LINENO
    for c in $(${git_hist_Cmd} log --pretty=format:"%h" --no-patch -- ${camp_env}); do
      if [[ ${envsh_md5} = $(${git_hist_Cmd} show ${c}:./$(basename ${camp_env}) | grep "# optimized env.sh" | cut -d ' ' -f4) ]]; then
        ${git_hist_Cmd} show ${c}:./$(basename ${camp_env}) > ${camp_env}
        found_custom_baked_env_sh=1
        break;
      fi
    done
  fi
#  _TE initBuildEnv $LINENO
  if [ ! -f "$camp_env" ] || [ ${found_custom_baked_env_sh} -eq 0 ]; then
    echo "Not using custom baked env.sh. env.sh has probably changed..." | STDWARN
    camp_env="${ENV_SH_FILE}"
  fi
  if [ -f "$camp_env" ]; then
    local CAMP_ARCH="Win64"
    if [ "X${BUILD_BIT_WIDE}" = "X32" ]; then
      CAMP_ARCH=""
    fi
    local DEF_GENERATOR
    if isDevToolAvailable ; then
      local ide_Version="$(getIDEVersion | rev | cut -d ' ' -f 1 | rev)" # setup VSINSTALLDIR and IDE_VERSION
      wcinstall cmake -q
#      _TE initBuildEnv $LINENO
      if isCygwin; then
        DEF_GENERATOR=$(cmake --help | sed -e '0,/Generators/d' | grep -E "Visual.*Studio.*${ide_Version}" | sed -r 's/^(\s||[*])*//g' | cut -d '=' -f1 | sed  -e "s/\[arch\]/${CAMP_ARCH}/" | sed -r "s/\s+$//g")
#        _TE initBuildEnv $LINENO
        pushd $CAMP_AC_ROOT/nl > /dev/null 2>&1
        local TEMP_IFS=$IFS
#        _TE initBuildEnv $LINENO
        source $camp_env
        IFS=$TEMP_IFS
#        _TE initBuildEnv $LINENO
        cleanPaths LIB
#        _TE initBuildEnv $LINENO
        popd > /dev/null 2>&1
      else
        DEF_GENERATOR='Unix Makefiles'
        pushd $CAMP_AC_ROOT/nl > /dev/null 2>&1
        source $camp_env
        # do not know why cleanPaths is bothering Visual studio Debugger when it attaches itself to unix systems.
        [[ $- = *i* ]] && cleanPaths LD_LIBRARY_PATH
        popd > /dev/null 2>&1
      fi
    else
      if isCygwin; then
        echo "${RED_COL}ALERT:${RESET_COL} IDE $(getIDEVersion) not found !!!..Please install compatible Visual Studio."
      else
        echo "${RED_COL}ALERT:${RESET_COL} IDE devtools not found !!!..Please install build-essentials pkgs."
      fi
    fi
    # GENERATOR is reqd for invoking nlconf below.
    export GENERATOR=${GENERATOR:=${DEF_GENERATOR}}
  fi
#  _TE initBuildEnv $LINENO
}
function fetchEnvInfo {
  cacheEnvVar ORG_UNIT_NAME "Adobe Campaign Classic"
#  cacheEnvVar PWSHELL_VERSION $(getCmdValue "wps  -Command 'Write-Host \$PSVersionTable.PSVersion'")
#  cmd="wps  -Command '\$p=Start-Process powershell -NoNewWindow -PassThru; Start-Sleep -Milliseconds 0; Stop-Process -ID \$p.id'"
#  getCmdValue "$cmd" | grep "https" | sed -r 's/.*(https.*)/\1/g'
  if isCygwin; then
    getIDEVersion
  fi
  cd $CAMP_AC_ROOT/nl
  local curBranch=$(git branch --show-current)
  if [ -z ${curBranch} ]; then
    curBranch=$(git name-rev --name-only --exclude=tags/* @ | cut -d '/' -f3 | sed 's/~.*//')
  fi
  if [ ! -z ${curBranch} ]; then
    cacheEnvVar -f CUR_CAMP_GIT_BRANCH ${curBranch}
  fi
  # when running in background(and in separate shell)
  # launch pdump only if previous call to pdump has finished.
  local pdumpIsRunning
  jobs -l | grep "nlserver pdump" > /dev/null
  [[ $? -eq 0 ]] && pdumpIsRunning=1
  if exec_command_exists nlserver && [[ -z $pdumpIsRunning ]]; then
    { (( nlpdump 1 | tee >( tail -n +2 | LC_ALL=C sort | column -t -s ' ' >&3) | head -n 1) 3>&1) > /tmp/${FUNCNAME[0]}.tmp; mv -f /tmp/${FUNCNAME[0]}.tmp /tmp/nlpdump; } &
  fi
}
###############################################################################
# uptil here, functions have been ported to linux.
###############################################################################
# conversion marker: 3
function cWSL {
# https://learn.microsoft.com/en-us/windows/wsl/wsl2-mount-disk
# https://joeferguson.me/adding-another-disk-to-wsl2/
# https://www.nucleustechnologies.com/blog/ways-to-mount-and-unmount-vhd-vhdx-files/#:~:text=With%20the%20help%20of%20Windows%20PowerShell%20cmdlet%2C%20you,VHD%2FVHDX%20files%3A%20Mount-DiskImage%20-ImagePath%20%E2%80%9Clocation%20of%20VHD%20file%E2%80%9D

# Before running initWSL you need to create a virtual disk with through Windows UI(Create and format hard disk -> Action -> Create VHD) or via PS commandlet.
# PS: New-VHD -Path "D:\build\acc_build1.vhd" -Fixed -SizeBytes 4GB
# PS: wsl --mount \\.\PhysicalDrive3 --bare
# Launch a new Debian terminal.
# DEB: sudo gparted # run gparted and create a single partition with ext4 filesystem.
# PS: wsl --unmount \\.\PhysicalDrive3

  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) ] [-n (do not restart WSL)] [ -l(list all attached virtual disks)] [vhd path1(default: $(readlink -f $CAMP_AC_ROOT/../acc_build.vhd))] [vhd path2] ..." && return

  local getVDiskCmd="\$loc=Get-Disk | Where-Object { \$_.Model -match 'Virtual Disk' }  | Select-Object -Property @{N='id';E={\$_.ObjectId -replace '^.*\\\\\\\\\?\\\\([^{]+).*','\$1' -replace '#', '' }}, Location; \$info=Get-CimInstance -query 'SELECT * from Win32_DiskDrive' | Where-Object { \$_.Model -eq 'Microsoft Virtual Disk' } | Select-Object -Property @{N='id';E={(\$_.PNPDeviceID -replace '\\\\','').tolower()}}, DeviceID, @{N='Size_GB';E={\$_.Size / 1GB}};\$loc | Join-Object \$info -On id | Select-Object -Property Location, DeviceID, Size_GB"

  _CONTAINS -l "$@" && wps -Command "${getVDiskCmd}" && return
  local devicePath diskNumber
  local vhdPaths="$@" i=0
  [[ -z $vhdPaths ]] && vhdPaths=$(native $(readlink -f $CAMP_AC_ROOT/../acc_build.vhd)) && [[ ! -f $vhdPaths ]] && { echo "Copying Virtual Disk ..." && cp ${TEAM_SHARE_LOCATION}/acc_build.vhd.gz $CAMP_AC_ROOT/../ && echo "Extracting/Creating Virtual Disk... " && gunzip $CAMP_AC_ROOT/../acc_build.vhd.gz; }
  for p in ${vhdPaths[@]}; do
    [[ -d $(ustyle "$p") ]] && { echo "Including all vhds in directory $p" | STDWARN; for f in $p/*.vhd!(.*); do vhdPaths[${i}]=$(native "$f") i=$[$i+1]; done; continue; }
    [[ -f $(ustyle "$p") ]] || { echo "No Virtual Disk @ $p" | STDERR; continue; }
    vhdPaths[${i}]=$(native "$p")
    i=$[$i+1]
  done
  echo "Mounting ${vhdPaths[@]}"
  if ! _CONTAINS -n "$@"; then
    wps -Command 'wsl --shutdown; Restart-Service vmcompute; wsl -l --all -v'
    local cmd="\$loc=Get-Disk | Where-Object { \$_.Model -match 'Virtual Disk' }  | Select-Object -Property @{N='id';E={\$_.ObjectId -replace '^.*\\\\\\\\\?\\\\([^{]+).*','\$1' -replace '#', '' }}, Location; \$info=Get-CimInstance -query 'SELECT * from Win32_DiskDrive' | Where-Object { \$_.Model -eq 'Microsoft Virtual Disk' } | Select-Object -Property @{N='id';E={(\$_.PNPDeviceID -replace '\\\\','').tolower()}}, DeviceID, @{N='Size_GB';E={\$_.Size / 1GB}};\$loc | Join-Object \$info -On id | Select-Object -Property Location, DeviceID, Size_GB"
    local vdisks="$(wps -Command "${getVDiskCmd}")"
    vdisks=$(trim "${vdisks}")
    echo "List of already attached Virtual drives on Windows:"
    echo "${vdisks}"
    [[ -z ${vdisks} ]] || echo "Dismounting all virtual disks ..."
    for p in $(echo "${vdisks}" | tail -n +3 | awk '{print $1;}'); do
      p=$(trim "$p");
      [[ ! -z $p ]] && wps -Command "Dismount-DiskImage -ImagePath ${p}"
    done
  fi
  for p in ${vhdPaths[@]}; do
    [[ $(ustyle "$p") = $(native $(readlink -f $CAMP_AC_ROOT/../acc_build.vhd)) ]] && [[ ! -f $(native $(readlink -f $CAMP_AC_ROOT/../acc_build.vhd)) ]] && { echo "Copying Virtual Disk ..." && cp ${TEAM_SHARE_LOCATION}/acc_build.vhd.gz $CAMP_AC_ROOT/../ && echo "Extracting/Creating Virtual Disk... " && gunzip $CAMP_AC_ROOT/../acc_build.vhd.gz; }
    local diskInfo=$(wps -Command "Mount-DiskImage -ImagePath ${p} | Select-Object DevicePath, Number | Format-Table -hidetableheaders")
    diskInfo=$(trim "${diskInfo}")
    devicePath=$(echo ${diskInfo} | awk '{print $1}')
    diskNumber=$(echo ${diskInfo} | awk '{print $2}')
    echo "Ensuring that Disk is set offline before tryng to hand it over to WSL for mounting..."
    wps -Command "Set-Disk -Number ${diskNumber} -IsOffline \$true"
    echo "Requesting WSL to mount ${YELLOW_COL}${devicePath}${RESET_COL}"
    wps -Command "wsl --mount '${devicePath}' -p 1"
  done
  local updateRoutingTable_Cmd="\$if=(Get-NetIPAddress -AddressFamily IPv4 | Where-Object { \$_.InterfaceAlias -like '*v*eth*WSL*'} | Select-Object -Index 0); route add 10.0.0.253 MASK 255.255.255.255 \$if.IPAddress METRIC 3 IF \$if.ifIndex; route add 10.0.0.0 MASK 255.255.255.0 10.0.0.253 METRIC 5 IF \$if.ifIndex; netsh interface ipv4 set interface \$if.ifIndex metric=20"
  wps -Command "${updateRoutingTable_Cmd}" 2> /dev/null
}

function wcrun {
  function __invoke {
    local __bin=$1
    shift
    echo "Invoking ${YELLOW_COL}${__bin} $@${RESET_COL}"
    local aliasList="$(alias | sed -E -r "s,^alias[[:space:]]+([^=]+)=[']?([^'[:space:]]+).*,\2 \1," | grep -E "^${__bin}\s+" | cut -d ' ' -f2 | xargs)"
    [[ ! -z ${aliasList} ]] && echo "Aliases: ${YELLOW_COL}${aliasList}${RESET_COL}"
    ${__bin} "$@"
    return $?
  }
  local operation=$1
  shift
  local iRc=0
  local iRc2
  case "${operation,,}" in
    make* | build*)
      __invoke makeCamp "$@"
    ;;
    acc* | nls* | server* | camp* | restart* | start*)
      __invoke restartCampaign "$@"
      iRc=$?
      echo "Use ${YELLOW_COL}stopCampaign/cst${RESET_COL} to stop a running instance"
    ;;
    apa*)
      __invoke apache "$@"
    ;;
    client*|cons*|nlc*)
      __invoke nlclient "$@"
    ;;
    capture*| screen* | grab*)
      __invoke captureScreen "$@"
    ;;
    auto*|test*)
      __invoke runautotests "$@"
    ;;
    smtp*|mail*)
      __invoke runFakeSmtpServer "$@"
    ;;
    smpp*|sms*)
      __invoke runFakeSmppServer "$@"
    ;;
    wsl|deb*|ub*|lin*|unix*)
    __invoke initWSL "$@"
    ;;
    vpn*|connect*)
      __invoke connectVPN "$@"
      iRc=$?
      echo "Use ${YELLOW_COL}disconnectVPN/dv${RESET_COL} to disconnect from VPN"
    ;;
    pop3*|inmail*)
      __invoke runInMailServer "$@"
    ;;
    *)
      echo "${RED_COL}${BOLD}Unsupported Operation${RESET_COL}"
      iRc=1
    ;;
  esac
  unset -f __invoke
  iRc2=$?
  [[ $iRc -ne $iRc2 ]] && return $[$iRc+$iRc2]
  return 0
}
function wcinstall {
  local appName=$1
  shift
  case "${appName,,}" in
    apache* | web* | httpd*)
      installApache "$@"
    ;;
    campinst*)
      setupCampaignDevServer "$@"
    ;;
    campst*)
      installStandardCampaignPackages "$@"
    ;;
    cmake*)
      if isCygwin; then
        installCmakeForWindows "$@"
      elif ! exec_command_exists cmake; then
        aptS install cmake
      fi
    ;;
    rootcert*)
      registerRootCert
      genSSLCerts "$@"
    ;;
    cert*|sslcerts*)
      genSSLCerts "$@"
    ;;
    os|osenv*)
      setupOS "$@"
    ;;
    cygwin*)
      installCygwin "$@"
    ;;
    debian9)
      installDebian9  "$@"
    ;;
    grad*)
        installgradle "$@"
    ;;
    git*)
        installgit "$@"
    ;;
    pr|gh*)
        installgh "$@"
    ;;
    javaide|intell*)
        installIntelliJ "$@"
    ;;
    java*|jdk*|jre*)
      installJava "$@"
    ;;
    maven|mvn)
      installMaven
    ;;
    node*)
      installNode "$@"
    ;;
    nr|new|relic|newrelic*)
      installNewRelicAgent "$@"
    ;;
    perf*)
      setup_perf_stk "$@"
    ;;
    pwsh|wps|powershell*)
      installPowershell "$@"
    ;;
    postgres*)
      installPostgres "$@"
    ;;
    python*)
      installPython3 "$@"
    ;;
    sfc|snowflake*)
      installSnowflakeOdbcDriver "$@"
      installSnowflakeClient "$@"
    ;;
    sharedmemtools|shm*)
      installShmemTools "$@"
    ;;
    sshkeys*)
      setupSSHKeys "$@"
    ;;
    sqlcmd|mssqlc*)
      installsqlcmdClient "$@"
    ;;
    *tesseract*)
      installTesseract "$@"
    ;;
    vault*)
      setupVault "$@"
    ;;
    visualstudio* | vs*)
      installVisualStudio "$@"
    ;;
    video* | ffmpeg*)
      installffmpeg "$@"
    ;;
    *)
      echo "Product ${RED_COL}${BOLD}${appName}${RESET_COL} not available for install."
      echo "${RED_COL}ALERT:${RESET_COL}  ${FUNCNAME[0]} Falling back to platform provided package manager"
      aptS "$@" install ${appName}
      local iRc=$?
      if [ $iRc -ne 0 ]; then
        echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <product-name>"
      fi
      return $iRc
    ;;
  esac
  return $?
}
function refreshEnvPath_Windows {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
#  local NEW_SYS_PATH="$(reg query 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' /v PATH | tr -d '\r' | sed -r 's,\s\s+,\t,g' | awk -F '\t' '{ print $4; }' | grep -v -E '^\s*$')"
  local NEW_SYS_PATH="$(wps -Command "(Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment').Path" | sed -r 's,\r$,,g')"
  local expandVars
  [[  $(nchars % ${NEW_SYS_PATH}) -eq 0 ]] && expandVars=() || read -a expandVars <<< $(echo ${NEW_SYS_PATH} | sed -r 's,[^%]*%([^%]+)%[^%]*,\1 ,g')
  while [[ ${#expandVars[@]} -gt 0 ]]; do
    for v in ${expandVars[@]}; do
      echo $v | STDERR
      local varVal="$(wps -Command "\$env:${v}" | sed -r 's,\r$,,g')"
      [[ -z ${varVal} ]] && echo "$v undefined" | STDERR
      echo $varVal | STDERR
      NEW_SYS_PATH="$(echo ${NEW_SYS_PATH} | sed -r "s,%${v}%,${varVal},g")"
    done
    [[  $(nchars % ${NEW_SYS_PATH}) -eq 0 ]] && expandVars=() || read -a expandVars <<< $(echo ${NEW_SYS_PATH} | sed -r 's,[^%]*%([^%]+)%[^%]*,\1 ,g')
  done
  NEW_SYS_PATH=${NEW_SYS_PATH//\\/\\\\}
  NEW_SYS_PATH=${NEW_SYS_PATH//(/\\(}
  NEW_SYS_PATH=${NEW_SYS_PATH//)/\\)}
  NEW_SYS_PATH=$(cygpath -pu "${NEW_SYS_PATH}" | sed -r 's|\/\(|\(|g' | sed -r 's|\/\)|\)|g')
#  export PATH="${PATH}:${NEW_SYS_PATH}"
  export RARE_SQ1=${RARE_SQ1:=$(getUUID)}
  echo "${PATH}" | sed 's| |${RARE_SQ1}|g' | sed 's|:|\n|g' > /tmp/paths.tmp
  local oldpaths
  readarray oldpaths < /tmp/paths.tmp
  rm -rf /tmp/paths.tmp
  local i=0
  local p
  local path_new
  for p in "${oldpaths[@]}"
  do
    p=$(getCmdValue "echo \"${p}\"")
    p=$(echo "$p" | sed -r 's|\/$||g' | sed -r 's|\s+$||g')
    oldpaths[$i]="$p"
    i=$[$i+1]
  done
  for path_new in $(echo "${NEW_SYS_PATH}" | sed "s| |${RARE_SQ1}|g" | sed 's|:|\n|g')
  do
    local np=$(getCmdValue "echo \"${path_new}\"")
    np=$(echo "$np" | sed -r 's|\/$||g' | sed -r 's|\s+$||g')
    local exists=0
    for p in "${oldpaths[@]}"
    do
      if [ "${p}" = "${np}" ]; then
        exists=1
        break
      fi
    done
    if [ $exists -eq 0 ]; then
      np=$(echo ${np} | sed "s/${RARE_SQ1}/ /g")
      echo "Adding dir ${YELLOW_COL}${np}${RESET_COL} to system PATH"
      export PATH="$PATH:${np}"
    fi
  done
#    echo "${PATH}" | sed 's| |zz|g' | sed 's|:|\n|g' > 1.tmp
#     readarray dnames < 1.tmp
#    readarray -td\\ dnames <<<"$(echo "$PATH" | cut -d ':' )"; declare -p dnames
#    readarray -td\\ dnames <<<"$(where devenv.exe)"; declare -p dnames
#    i=0
#    echo ${dnames[@]}   # All items with each item space separated.
#    echo "${dnames[@]}" # All items with each item on separate row.
#    echo ${!dnames[@]}  # Array of indexes 0 1 2 3 4 5
#    for s in "${dnames[@]}"
#    do
#      echo ${dnames[$i]}
#      i=$[$i+1]
#      echo "$s"
#      echo "$i out of ${#dnames[@]}"
#    done
}
function setupCygwinEnv {
! isCygwin && return
local runAsAdmin='True'
[[ "$(sed 's/.*/\U&/' <<< X${RUN_AS_ADMIN:0:1})" =~ X[Y1T] ]] || { runAsAdmin=$(trim $(wps -Command "[Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544'")) && [[ ${runAsAdmin,,} = "true" ]] && cacheEnvVar -f RUN_AS_ADMIN True; }
if [[ ${runAsAdmin,,} = "false" ]]; then
  cacheEnvVar -f -c RUN_AS_ADMIN
  echo "Start Cygwin ACC setup with ${YELLOW_COL}'Run As Admin'${RESET_COL} privilege."
  readEx "Press any key to continue... Else this terminal will Exit in " 5 " seconds."
  [[ $? -ne 0 ]] && exit
fi
check_CAMP_AC_ROOT
[[ ! -d $CAMP_AC_ROOT ]] && echo "Please ensure CAMP_AC_ROOT env variable points to existing directory" && return 1
if ! exec_command_exists apt-cyg || [ "X${1,,}" = "X-f" ]; then
  trim "$(wps -Command '(Get-DnsClientGlobalSetting).SuffixSearchList')" | grep ${ADOBE_CORP_DOMAIN} > /dev/null
  [[ $? -eq 0 ]] || wps -Command "Set-DnsClientGlobalSetting -SuffixSearchList @('${ADOBE_CORP_DOMAIN}')"
  [[ $(whoami) =~ ^[[:alnum:]]+$ ]] || updateUser
  [[ ${COMPUTERNAME,,} =~ $(whoami) ]] || { echo "Your computer-name ${YELLOW_COL}${COMPUTERNAME}${RESET_COL} can be a more friendly/identifiable name."; 
    readEx "Press any key to continue with existing name...Else exit the terminal and manually change your computer name, reboot the machine and re-execute ${FUNCNAME[0]} " 10 " seconds left."; [[ $? -eq 0 ]] || exit; }
  setupSSHKeys
  for f in Downloads .ssh; do
    [[ -e ~/$f ]] || { local d="$(getUsersFolder $f)"; [[ -d ${d} ]] && ln -s ${d} ~/$f ; }
  done
  if ! exec_command_exists wget; then
    echo "You do not seem to have wget...You should install and and ensure it in your path"
    echo "Now trying curl"
    if ! exec_command_exists curl; then
      echo   "Oops!!!...You do not have curl either."
      echo   "You do not  seem to have curl/wget installed on your machine. Please open ${OSTYPE} again after ensuring curl/wget exists and is available in PATH."
      readEx "Closing terminal in " 10 " seconds... Press Ctrl+C to abort or any other key to exit this session."; exit
    fi
  fi
  [[ -f apt-cyg ]] && rm -f apt-cyg
  download https://raw.githubusercontent.com/kou1okada/apt-cyg/master/apt-cyg
  if [ $? -ne 0 ];  then
    [[ -f apt-cyg ]] && rm -f apt-cyg
    download https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
  fi
  [[ -f apt-cyg ]] && chmod +x apt-cyg && mv -f apt-cyg /usr/local/bin/
  rm -rf /tmp/.*
  rm -rf /tmp/*
  if ! exec_command_exists aptS && exec_command_exists apt-cyg; then
    function aptS { apt-cyg $@ ; }
  fi
  if ! exec_command_exists aptS; then
    echo "apt/apt-cyg not found. Could not download apt/apt-cyg pkg."
    return 1
  fi
  echo "Cygwin installer setup file is @ ${YELLOW_COL}/etc/setup/setup.rc${RESET_COL}"
  cat /etc/setup/setup.rc | grep -A1 last-cache
  cat /etc/setup/setup.rc | grep -A1 last-mirror
  echo "Use  ${YELLOW_COL}aptS mirrors-list-long or aptS mirrors-list-online to list all mirrors"
  echo "Use  ${YELLOW_COL}aptS -c <platform-path>${RESET_COL} to change cache folder"
  echo "Use  ${YELLOW_COL}aptS -m <url>${RESET_COL} to change cygwin mirror"
  echo "You can run also run ${YELLOW_COL}python $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/utils.py cygmirror${RESET_COL} to find out fastest mirrors. Use windows python3"
  readEx "Press Ctrl+C to abort...Then reset apt-cyg params appropriately and restart setup process again, Else press any other key to continue as is" 5
  aptS update
  # nss Installs certutil which clashes with windows own certutil.
  aptS install wget curl nss mkfontdir python3-devel
  if ! exec_command_exists wget  || [ -z "$(wget -V | head -n 1 | grep -i wget)" ]; then
    echo "You either do not have curl/wget installed on your machine or your cygwin is bad/corrupt/out of date."
    echo "You can run ${YELLOW_COL}aptS dist-upgrade${RESET_COL} to repair cygwin."
    read -p "Please open ${OSTYPE} again after ensuring curl/wget exists and is available in PATH. Press Ctrl+C to abort or any other key to exit this session." -t 10
    exit
  fi
  kill -9 %%
  kill -9 %%
  updateUser
  aptS update
  aptS update-setup
  aptS upgrade-self
  [[ "X${1,,}" = "X-f" ]] && { echo $2 | aptS dist-upgrade; }
  aptS update
  aptS install btop
  local pw_execution_policy_Cmd="-Command Set-ExecutionPolicy Unrestricted -Scope CurrentUser"
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"$pw_execution_policy_Cmd\" -WindowStyle hidden -Verb RunAs"
  echo "Stopping windows openssh(ssh-agent) service..We need to use ${OSTYPE}'s ssh-agent"
#  win_creds=$(getCmdValue "cmd /c '$(where whoami | grep Windows)'")
#  runas /profile /savecred /user:${win_creds} "wps  -Command 'Set-Service ssh-agent -StartupType Manual;  Stop-Service ssh-agent'"
#  runas /profile /savecred /user:${win_creds} "wps  -Command 'Set-Service ssh-agent -StartupType Manual'"
  local stop_windows_builtin_ssh_Cmd="-Command  Stop-Service ssh-agent"
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"$stop_windows_builtin_ssh_Cmd\" -WindowStyle hidden -Verb RunAs"
  local SSHD_PID=$(ps -e | grep sshd |  sed -r 's/[[:space:]]+/ /g' | cut -d ' '  -f2) && [[ ! -z ${SSHD_PID} ]] && kill -TERM ${SSHD_PID}
  local remove_cygsshd_Cmd="-Command  Stop-Service -Name cygsshd; Remove-Service -Name cygsshd; sc delete cygsshd"
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"$remove_cygsshd_Cmd\" -WindowStyle hidden -Verb RunAs"
  aptS remove openssh
  aptS install openssh
  sed -i -r "s,^.*PermitUserEnvironment.*,PermitUserEnvironment yes," /etc/sshd_config
  local restart_cygwin_sshd_Cmd="-Command Set-Service cygsshd -StartupType Manual; Restart-Service -Name cygsshd"
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"${restart_cygwin_sshd_Cmd}\" -WindowStyle hidden -Verb RunAs"
#  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v 001_cygsshd_no_vpn /t REG_SZ /d "pwsh -Command \"Start-Process pwsh  -ArgumentList '-Command C:\\cygwin64\\bin\\bash.exe --login -i -c onChangeVpnStatus' -WindowStyle hidden -Verb RunAs\""
# pwsh -Command "Start-Process pwsh  -ArgumentList '-Command C:\cygwin64\bin\bash.exe --login -i -c """""""". /usr/local/bin/cygsshd.sh""""""""' -Verb RunAs"
# pwsh -Command "Start-Process pwsh  -ArgumentList '-Command C:\cygwin64\bin\bash.exe --login -i -c """"""""onChangeVpnStatus""""""""' -Verb RunAs"
  local set_windows_builtin_ssh_Manual_Cmd="-Command Set-Service ssh-agent -StartupType Manual"
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"$set_windows_builtin_ssh_Manual_Cmd\" -WindowStyle hidden -Verb RunAs"
  if [ -z "$(findW -u psql)" ]; then
    aptS install postgresql-client
  fi
  aptS -X install gnupg
  aptS install openssl ping vim unzip zip dos2unix nc bc procps procps-ng jq rlwrap bash-completion
  if ! exec_command_exists git; then
    aptS install git
  fi
  if [ "X${1,,}" = "X-f" ]; then
      aptS remove git
      aptS install git
  else
    local gitv
    read -a gitv <<< "$(git --version | cut -d ',' -f1 | sed -r 's/^(.*?)(\s)([0-9\.]+)(\s*).*/\3/' | xargs -d '.')"
    if [[ ${gitv[0]} -lt 2 ]] || [[ ${gitv[0]} -eq 2 &&  ${gitv[1]} -lt 30 ]]; then
      aptS remove git
      aptS install git
    fi
  fi
  download https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash  ~/.git-completion.bash
  download https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh           ~/.git-prompt.bash
  # exec_command_exists updatedb && updatedb
  fetchEnvInfo
  wps -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name RegisteredOrganization -Value '${ORG_UNIT_NAME}'"
  wps -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name RegisteredOwner -Value '$(echo $(whoami) $(hostname) | sed -r 's,[^[:alnum:]], ,g')'"
  pushd $CAMP_AC_ROOT
  git init
  git config --global init.defaultBranch ${MASTER_BRANCH}
  git config --global user.name "$(getUserInfo -fullname)"
  git config --global user.email "$(whoami)@${ADOBE_DOMAIN}"
  git config --global core.autocrlf true
  git config --global pull.rebase true
  git config --global fetch.prune true
  git config --global diff.colorMoved zebra
  git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'
  git config --global alias.amend-to '!f() { SHA=`git rev-parse "$1"`; git commit --fixup "$SHA" && GIT_SEQUENCE_EDITOR=true git rebase --interactive --autosquash "$SHA^"; }; f'
  git config --global alias.root 'rev-parse --show-toplevel'
  git config --global alias.exec '!exec'
  git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
  git config --global alias.parent '!git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//"'
  git config --global alias.br "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
  # some more git aliases : https://github.com/laurentkempe/dotfiles/blob/master/git/.gitconfig.aliases
  popd
  if isHostAlive git.${ADOBE_CORP_DOMAIN}; then
    pushd $CAMP_AC_ROOT/..
    git clone git@git.${ADOBE_CORP_DOMAIN}:hparmar/acc-dev.git
    pushd $CAMP_AC_ROOT/../acc-dev
    git pull
    popd
    popd
  fi
  ${OPENSSL_BIN} s_client -brief -status -connect github.com:443 <<< "Q"
  if [ $? -eq 0 ]; then
    pushd $CAMP_AC_ROOT/..
    echo "${GREEN_COL}INFO: ${RESET_COL}${YELLOW_COL_COL}Removing old ble.sh${RESET_COL} ..." && rm -rf ble.sh
    git clone --recursive https://github.com/akinomyoga/ble.sh.git
    make -C ble.sh
    for f in $(find ./ble.sh/out -name "*.sh"); do
      d2u -f "$f"
    done
    source ${CAMP_AC_ROOT}/../ble.sh/out/ble.sh
    echo "${GREEN_COL}INFO:${RESET_COL} If you like ble(this new Bash Line Editor) integrated into shell, add ${YELLOW_COL} source \${CAMP_AC_ROOT}/../ble.sh/out/ble.sh ${RESET_COL} to ~/.before.sh"
    popd
  fi
  if [ -f "$CAMP_AC_ROOT/../acc-dev/acc-dev-setup/.bashrc" ]; then
    if [ -f ~/.bashrc ]; then
      rm -f .~/bashrc.old
      mv -f ~/.bashrc ~/.bashrc.old
    fi
    [[ -e ~/.bashrc ]] && rm -f ~/.bashrc
    ln -s $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/.bashrc ~/.bashrc
  fi
  eval "$(ssh-agent -s)"
  local UseWindowsPowerShell='-UseWindowsPowerShell'
  [[ $PWSHELL_VERSION =~ ^5 ]] && UseWindowsPowerShell=''
  local reRegisterAllAppsWithTaskBar_Cmd="Import-Module -Name Appx ${UseWindowsPowerShell} -WarningAction SilentlyContinue; Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$(\$_.InstallLocation)\AppXManifest.xml\"}"
  wps -Command "${reRegisterAllAppsWithTaskBar_Cmd}"

  Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”
  createShortCut
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  /f /v ShowSecondsInSystemClock /t REG_DWORD /d 1
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider"      /f /v HostsPriority /t REG_DWORD /d 0x0000001F
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider"      /f /v LocalPriority /t REG_DWORD /d 0x0000002F
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider"      /f /v DnsPriority   /t REG_DWORD /d 0x0000003F
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider"      /f /v NetbtPriority /t REG_DWORD /d 0x0000004F
  echo "Disabling IPv6 from all network interfaces"
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /f /v DisabledComponents /t REG_DWORD /d 0x000000FF
  local disableIPv6_on_windows_Cmd="-Command Disable-NetAdapterBinding -Name '*' -ComponentID ms_tcpip6"
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"${disableIPv6_on_windows_Cmd}\" -Verb RunAs"
  aptS remove nss
  registerRootCert
  wcinstall snowflake
  wcinstall gh
  local install_Invoke_Sqlcmd_Cmd="-Command Install-Module -Name SqlServer"
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"${install_Invoke_Sqlcmd_Cmd}\" -Verb RunAs"

  registerWithWindowsCredentialManager
  ! exec_command_exists clsie && echo "alias clsie='wps -Command \"RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 255\"'" >> ~/.before.sh
  ! exec_command_exists clsme && echo "alias clsme='rm -rf $(cygpath -u ${LOCALAPPDATA})/Packages/Microsoft.MicrosoftEdge_8wekyb3d8bbwe/AC/#*'" >> ~/.before.sh
  cacheEnvVar EXPERT_MODE yes
  cacheEnvVar -c EXPERT_MODE
  cacheEnvVar SECRET_PASSWORD 'ASK_HPARMAR@ADOBE.COM'
  cacheEnvVar -c SECRET_PASSWORD
  cacheEnvVar -c EXPERT_MODE
  cacheEnvVar VPN_PIN 1234
  cacheEnvVar -c VPN_PIN
  cacheEnvVar CUSTOM_TITLEBAR $(whoami),
  cacheEnvVar -c CUSTOM_TITLEBAR
  cacheEnvVar TIME_PROFILE_SCRIPT 1
  cacheEnvVar -c TIME_PROFILE_SCRIPT
  cacheEnvVar ATTACH_TO_TERMINAL 0
  cacheEnvVar VS_IDENTIFIER 2019
  cacheEnvVar ENABLE_GIT_PS1 1
  cacheEnvVar -c ENABLE_GIT_PS1
  cacheEnvVar GUI_DIFF_TOOL_NAME Examdiff.exe
  cacheEnvVar -c GUI_DIFF_TOOL_NAME
  cacheEnvVar BOOT_OPTIONS 255
  cacheEnvVar -c BOOT_OPTIONS
  echo "# [[ \$- == *i* ]] && source /cygdrive/d/campaign/ble.sh/out/ble.sh --noattach" >> ~/.before.sh
  echo "Setup is now complete..If you want to configure this cygwin  machine as ssh server, you can try with ${YELLOW_COL}ssh-host-config --name cygsshd${RESET_COL}"
  echo "It is now advised that you close and relaunch ${OSTYPE}."
  readEx "Closing terminal in " 10 " seconds... Press any key to continue working  in this session.";
  if [ $? -ne 0 ]; then
    openTerm -c -r
  fi
  refreshEnvPath_Windows
fi
}
function getIDEVersion {
  if [ -z ${IDE_VERSION+x} ]; then
    if isCygwin; then
      export IDE_VERSION="NaN"
      local devenvPath
      # if VS_IDENTIFIER is not set it or empty, it matches all.
      # You can choose to set it in "~/.before.sh" file e.g
      # export VS_IDENTIFIER=2019 or export VS_IDENTIFIER=11.0 e.t.c
      # or simply using bash function cacheEnvVar as 'cacheEnvVar VS_IDENTIFIER 2019'
      devenvPath="$(findW -i "${VS_IDENTIFIER}" -u devenv.exe)"
      if [ -z "${devenvPath}" ]; then
        return
      fi
      devenvPath="$(cygpath -w "${devenvPath}")"
      IDE_VERSION=$(wps  -Command \(Get-Item "\"${devenvPath}\""\).VersionInfo.FileDescription)
      IDE_VERSION=$(getCmdValue "echo \"${IDE_VERSION}\"")
      local vsVersion=$(wps  -Command \(Get-Item "\"${devenvPath}\""\).VersionInfo.ProductVersion)
      if [ ${vsVersion%%.*} -gt 15 ]; then
        cacheEnvVar WindowsSdkDir NA
      fi
      if [ -z "${VSINSTALLDIR+x}" ] || [ ! -d "${VSINSTALLDIR}" ] || [ ! -x "${VSINSTALLDIR}" ]; then
        while [ ! -z "$(echo "$devenvPath" | grep Common)" ]
        do
          devenvPath=$(dirname "$devenvPath")
        done
  #      export VSINSTALLDIR=${VSINSTALLDIR:=${devenvPath}}
        export VSINSTALLDIR="$(echo ${devenvPath} | sed 's,\\,\\\\,g')\\\\"
        if [ -z "${VSINSTALLDIR+x}" ] || [ ! -d "${VSINSTALLDIR}" ] || [ ! -x "${VSINSTALLDIR}" ]; then
          echo "${RED_COL}ALERT:${RESET_COL} Bad Environment variable VSINSTALLDIR.It may result into build issues."
        fi
      fi
    else
      IDE_VERSION="$(gcc --version | head -1)"
    fi
    cacheEnvVar -f IDE_VERSION
    cacheEnvVar -f VSINSTALLDIR
  fi
  echo "$IDE_VERSION"
}
# With VS2019, I think it comes installed by default.
function installCmakeForWindows {
  if exec_command_exists cmake || [ "X${1,,}" = "X-f" ]; then
    if [ $(which cmake | cut -d '/' -f2) != "cygdrive" ]; then
        echo "Removing cmake installed by ${OSTYPE}"
        aptS remove cmake
    else
      arg="${1:0:2}" # First two characters of $1.
      if [ $# -gt 0 ] && [ "${arg,,}" = "-q" ]; then
        true
        return
      elif [ $# -gt 0 ] && [ "${arg,,}" = "-f" ]; then # case insensitive compare
        echo "UnInstalling windows $(cmake --version)"
#        local uninstall_cmake_cmd="-Command Get-WmiObject -Class win32_product  -Filter  \"\"\"\"Name like \"\"\`''%cmake%\"\"\`''\"\"\"\" | ForEach-Object { Write-Host Write-Host Removing \"\"\`''\$_\"\"\`''...; \$_.Uninstall() }"
        local uninstall_cmake_cmd="-Command Get-CimInstance -Class win32_product -Filter  \"\"\"\"Name like \"\"\`''%cmake%\"\"\`''\"\"\"\" |  ForEach-Object -Process { Write-Host Removing \"\"\`''\$_\"\"\`''...; Invoke-CimMethod -InputObject \$_ -Name Uninstall }"
        wps -Command "Start-Process $PWSHELL  -ArgumentList '${uninstall_cmake_cmd}' -Wait -Verb RunAs"
      else
        echo "CMake for Windows already installed"
        echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -f(orce) | -q(uite) ]"
        where cmake | head -n 1
        cmake --version
        return
      fi
    fi
  fi
  pushd /tmp > /dev/null 2>&1
  local dlHost="https://github.com"
  cmake_git_url="$(curl -Ls -o /dev/null -w %{url_effective} "${dlHost}"/Kitware/CMake/releases/latest)"
  toggleXMLLintUse
  cmake_git_url=$(for i in {1..9}; do curl -Ls "${cmake_git_url}" | getXMLAttrVal include-fragment src $i | grep https | grep -i cmake | grep -i releases; [[ $? -eq 0 ]] && break; done;)
  cmake_git_url=${dlHost}"$(curl -Ls "$cmake_git_url"  | grep "<a href" | grep -E 'x(86_){0,1}64' | grep msi | getXMLAttrVal a href)"
  toggleXMLLintUse
  echo "Downloading cmake from ${YELLOW_COL}${cmake_git_url}${RESET_COL}"
  download $cmake_git_url cmake.msi
  if [ ! -f cmake.msi ]; then
    local msiInstaller=$(find ${TEAM_SHARE_LOCATION} -maxdepth 1 -iname cmake-*.msi  -type f -exec ls -1t "{}"  \; | sed 's#.*/##' | head -n 1)
    cp -r ${TEAM_SHARE_LOCATION}${msiInstaller} cmake.msi
  fi
  local install_cmake_Cmd="-Command Start-Process -Wait -FilePath $(getPlatformPath|sed 's/\\/\\\\/g')cmake.msi -ArgumentList \"\"\"\"ADD_CMAKE_TO_PATH=System /passive /qb /m\"\"\"\""
  wps -Command "Start-Process $PWSHELL  -ArgumentList '${install_cmake_Cmd}' -Wait -Verb RunAs"
  rm -rf cmake.msi
  refreshEnvPath_Windows
  where cmake | head -n 1
  cmake --version
  popd > /dev/null 2>&1
}
function buildsolutionInIDE {
  pushd -n . > /dev/null
  cd $CAMP_AC_ROOT/nl
  if isDevToolAvailable ; then
    if isCygwin; then
      if [ -f './build/ncs.sln' ]; then
        local devenvExt=".exe"
        local inBG=1
        [[ ${1,,} =~ ^[-]+v.* ]] && shift && devenvExt=".com" && unset inBG
        local buildOpt='/Rebuild'
        [[ -z $1 ]] && buildOpt='/Build'
        buildOpt="${buildOpt} Debug|"
        [[ "X${BUILD_BIT_WIDE}" = "X32" ]] && buildOpt="${buildOpt}Win32"
        [[ "X${BUILD_BIT_WIDE}" = "X64" ]] && buildOpt="${buildOpt}x64"
        [[ -z $inBG ]] && echo "${GREEN_COL}INFO:${RESET_COL} Background ${GREEN_COL}${buildOpt:1}${RESET_COL} in progress. The final status will be displayed on the screen when the build finishes." && launch  "$(findW -i "${VS_IDENTIFIER}" -u devenv${devenvExt})" build/ncs.sln ${buildOpt}
        [[ ! -z $inBG ]] && "$(findW -i "${VS_IDENTIFIER}" -u devenv${devenvExt})" build/ncs.sln ${buildOpt}
      else
        echo "${RED_COL}ALERT:${RESET_COL} IDE solution file not found. if you have campaign source in the correct location, Try running ${YELLOW_COL}makeCamp -c ${RESET_COL} to recreate the solution file"
      fi
    else
      make -C build/
      local cpCmd="$(which cp) -f -p -v"
      ${cpCmd} ${CAMP_AC_ROOT}/nl/build/nlsrvmod/libnlsrvmod.so ${CAMP_AC_ROOT}/nl/build/ncs/bin/libnlsrvmod.so
      ${cpCmd} ${CAMP_AC_ROOT}/nl/build/ncs/datakit/xtk/${CAMP_LANG}/schema/* ${CAMP_AC_ROOT}/nl/build/ncs/datakit/xtk/${CAMP_LANG}/
    fi
  else
    echo "${RED_COL}ALERT:${RESET_COL} IDE $(getIDEVersion) not found !!!..Please install compatible build tools."
  fi
  popd > /dev/null
}
# function t {
#   local posN=1
#   for i in $@; do
#     if [ "$i" = "-h" ]; then
#       echo "Removing -h argument @ ${posN} position"
#       local posNext=$[${posN}+1]
#       echo "its value is ${!posNext}"
#       set -- "${@:1:posN-1}" "${@:posN+1}"
#       posN=$[${posN}-1]
#     fi
#     posN=$[${posN}+1]
#   done
#   echo "Final Arglist: $@"
# }
function setupOS {
  if isCygwin; then
    setupCygwinEnv "$@" &
  else
    setupDebianEnv "$@" # No BG..Since it also tries to mount indshare and change env var $TEAM_SHARE_LOCATION.
  fi
}
function welcome {
  local CAMPAIGN_MS_VS_STUDIO_VERSION="Microsoft Visual Studio 2019"
  echo -e "Why read wiki when there is a script to guide you through campaign dev setup on \n${YELLOW_COL}$(getOS):$(head /proc/version)${RESET_COL}"
  echo "Welcome to $ORG_UNIT_NAME dev setup."
  if isCygwin; then
    [[ -z $PWSHELL_VERSION ]] && cacheEnvVar PWSHELL_VERSION $(trim  $(wps  -Command 'Write-Host $PSVersionTable.PSVersion'))
    echo "${GREEN_COL}INFO:${RESET_COL} Using powershell version: ${YELLOW_COL}${PWSHELL_VERSION}${RESET_COL}"
    if [[ ! -z ${SHOW_POWERSHELL_BANNER} ]]; then
    #  local pwlogo_cmd="wps  -Command '\$p=Start-Process $PWSHELL -NoNewWindow -PassThru; Start-Sleep -Milliseconds 0; Stop-Process -ID \$p.id'"
#      local nTrimFromBottom=3
#     [[ $PWSHELL_VERSION =~ ^5 ]] && nTrimFromBottom=2
#      local pwlogo_cmd='wps -Command "echo Exit | Out-File -FilePath \$env:TEMP\inp.txt -encoding ASCII; Start-Process '${PWSHELL}' -NoNewWindow -RedirectStandardInput \$env:TEMP\inp.txt" | head -n -'"$nTrimFromBottom ; rm -f $TEMP/inp.txt"
#      local pwlogo="$(getCmdValue "${pwlogo_cmd}")"
      local pwlogo=$(wps  <<< $(echo Exit) | head -n -1)
      echo "${pwlogo}" | grep -i upgrade > /dev/null
      [[ $? -eq 0 ]] && echo "${pwlogo}" | grep -E -v '^\s+$'
    fi
  fi
  # getCmdValue "$cmd" | grep "https" | sed -r 's/.*(https.*)/\1/g'
  local pathCount=$(echo $PATH | sed "s,:/,\n/,g" | sort | wc -l)
  local uniqPathCount=$(echo $PATH | sed "s,:/,\n/,g" | sort | uniq | wc -l)
#############################################
  local vsReq javaReq cmakeReq postgresReq downloadutilReq
  if ! isDevToolAvailable ; then
    vsReq="$CAMPAIGN_MS_VS_STUDIO_VERSION...You can install from "${TEAM_SHARE_LOCATION}
  fi
  if ! exec_command_exists java || ! exec_command_exists javac; then
    javaReq="JDK 1.8(64-bit) or higher.Download and installed from ${YELLOW_COL}https://artifactory-uw2.adobeitc.com/artifactory/list/binaries-azul-remote/ZuluCatalog/Zulu8/8.50/zulu8.50.0.22-sa-fx-jdk8.0.272-win_x64.msi${RESET_COL}"
  fi
  if isCygwin; then
    if ! exec_command_exists cmake  || [ $(which cmake | cut -d '/' -f2) != "cygdrive" ]; then
      cmakeReq="Windows cmake. Run 'wcinstall cmake' from ${OSTYPE} prompt to install it."
    fi
  fi
  if ! exec_command_exists wget && ! exec_command_exists curl; then
    downloadutilReq="wget or atleast curl is available in path."
  fi
  local req="$(for v in $(echo vsReq javaReq cmakeReq postgresReq downloadutilReq); do echo ${!v}; done)"
  if [ $(echo "$req" | grep -v -E '$^' | wc -l) -ne 0 ]; then
    echo "====${GREEN_COL}Software Requirements${RESET_COL}"
    echo "$req" | grep -v -E '$^' | STDERR
    echo "===="
  fi
#############################################
  local dupPathCheck pathCheck javaEnvCheck jdkCheck camp_ac_root_check
  if [ $pathCount -gt $uniqPathCount ]; then
    dupPathCheck="Duplicate paths exist in your Environment Variable ${YELLOW_COL}PATH${RESET_COL}"
    if [[ "$(sed 's/.*/\U&/' <<< X${EXPERT_MODE:0:1})" =~ X[Y1T] ]]; then
      echo $PATH | sed "s,:/,\n/,g" | sort > /tmp/cur.path
      echo $PATH | sed "s,:/,\n/,g" | sort | uniq > /tmp/expected.path
      git diff --word-diff=color /tmp/cur.path /tmp/expected.path
      rm -f /tmp/cur.path /tmp/expected.path
    fi
  fi
  if [ $(echo $PATH | wc -c) -gt 4096 ]; then
    pathCheck="   *. Environment Variable ${YELLOW_COL}PATH${RESET_COL} too long( > 4096 ).First try to remove any duplicates or else prune it."
  fi
  if [ -z "${JAVA_HOME}" ]; then
    javaEnvCheck="   * Ensure that env variables like JAVA_HOME, JDK_HOME are defined.\n        Typical value: "
    if isCygwin; then
      javaEnvCheck=${javaEnvCheck}'C:\Program Files\Zulu\zulu-8\jdk'
    else
      javaEnvCheck=${javaEnvCheck}'/usr/lib/jvm/java-8-openjdk-amd64'
    fi
  fi
  if ! exec_command_exists javac; then
    jdkCheck="   * Ensure that JDK_HOME/bin is in your system/User PATH variable."
  fi
  if [ -z $(getCampRoot) ]; then
    camp_ac_root_check="   *. Define CAMP_AC_ROOT Default value: /cygdrive/f/campaign/ac is assumed...Note it should have ${OSTYPE} style path."
  fi
  req="$(for v in $(echo dupPathCheck pathCheck javaEnvCheck jdkCheck camp_ac_root_check); do echo ${!v}; done)"
  if [ $(echo "$req" | grep -v -E '$^' | wc -l) -ne 0 ]; then
    echo "====${GREEN_COL}Things to take care of${RESET_COL}"
    echo "$req" | grep -v -E '$^' | STDERR
    echo "===="
  fi
  # echo "export LD_LIBRARY_PATH=/usr/lib/oracle/instantclient_19_9" > ~/.bashrc
  # echo "export PATH=$PATH:$LD_LIBRARY_PATH" > ~/.bashrc
  # head /usr/local/neolane/nl6/conf/config-a*.xml
  # sqlplus accintg_dev22/accintg_dev22@ora19c-sj1.rd.campaign.adobe.com:1521/ORCLPDB
  # SQL>  SELECT sys_context('USERENV', 'CURRENT_SCHEMA') FROM dual;
  # SYS_CONTEXT('USERENV','CURRENT_SCHEMA')
  # --------------------------------------------------------------------------------
  # ACCINTG_DEV22
  # SQL>  DESCRIBE ACCINTG_DEV22.nmstrackinglogrcp;
  echo "${GREEN_COL}INFO:${RESET_COL}"
  echo " 1. Quick References         : ${YELLOW_COL}${BOLD}1. wcinstall <tab> 2. wcrun <tab> 3. Try auto-complete as much as possible.${RESET_COL}"
  echo " 2. ACC India Team wiki      : ${YELLOW_COL}https://adobe.ly/cin${RESET_COL}"
  echo " 3. ACC product   releases   : ${YELLOW_COL}https://wiki.${ADOBE_CORP_DOMAIN}/display/neolane/Adobe+Campaign+Classic+Completed+Releases${RESET_COL}"
  echo " 4. UTF-Pipeline  instances  : ${YELLOW_COL}https://orchestration.ci.${ADOBE_CORP_DOMAIN}/job/utf-pipeline/build${RESET_COL}"
  echo " 5. rd-dev        instances  : ${YELLOW_COL}https://campaign-rd.ci.${ADOBE_CORP_DOMAIN}/job/rd-dev_request/build${RESET_COL} -- ssh user: prod"
  echo " 6. acc-integ prov instances : ${YELLOW_COL}https://acc-test-dev.ci.${ADOBE_CORP_DOMAIN}/view/Provisioning/job/itcloud_provisioning/${RESET_COL} -- ssh user: prod"
  echo " 7. IT cloud      instances  : ${YELLOW_COL}https://atscloud.corp.adobe.com/${RESET_COL}"
  echo " 8. ACC JSAPI     Dev Docs   : ${YELLOW_COL}https://experienceleague.${ADOBE_DOMAIN}/developer/campaign-api/api/p-1.html${RESET_COL}"
  echo " 9. ACC UI Widgets Goldmine  : ${YELLOW_COL}https://$(hostname --fqdn)/nl/test/js/widgets-all.html${RESET_COL} -- jQuery UI based widgets for old ACC console(and its web oriented) interface"
  echo -e "10. Splunk Logs search       : ${YELLOW_COL}https://splunk.or1.adobe.net/en-US/app/search/search${RESET_COL}\n\tSample search string : ${YELLOW_COL}index=\"campaign_prod\" host=\"wsu-mkt-prod*\" sourcetype  IN (webmdl_log, weblog) error | reverse${RESET_COL}"
  echo -e "11. ACC Builds\n\tOld\t\t     : ${YELLOW_COL}"'\\\du1isi0\\share\\rd_priv'"${RESET_COL}\n\t\t\t     : ${YELLOW_COL}"'\\\du1isi0\\share\\rd_arch'"${RESET_COL}\n\t\t\t       Request access to the group DU1ISI0_RD_PRIV_RO from the IAM portal ${YELLOW_COL} https://iam.${ADOBE_CORP_DOMAIN}${RESET_COL}"
  echo -e "\tNew\n\ti.  Login (okta)     :${YELLOW_COL} https://artifactory-uw2.adobeitc.com ${RESET_COL} \n\tii. Download URL     : ${YELLOW_COL}https://artifactory-uw2.adobeitc.com/artifactory/generic-campaign-acc-artifacts-release${RESET_COL}"
  echo "12. Get latest .bashrc       : ${YELLOW_COL}git clone git@git.${ADOBE_CORP_DOMAIN}:hparmar/acc-dev.git $(dirname $(getCampRoot))/acc-dev${RESET_COL}"
  echo -ne '\tStable Version       : '; echo "${YELLOW_COL}cp '${TEAM_SHARE_LOCATION}.bashrc' ~ ${RESET_COL}"
  echo -e "13. UCO Framework\t     : ${YELLOW_COL}https://uco.adobe-campaign.com/${RESET_COL}"
  echo "14. Env variable 'DEFAULT_PASSWORD' sets default password used by script. Use command ${YELLOW_COL}'cacheEnvVar DEFAULT_PASSWORD xxxxxx'${RESET_COL} to set new password."
  if isCygwin && [[ ! -z "${TERMINATING_CONSOLE_WIN_PID}" ]]; then
#    ps -W | tr -s '[:blank:]' | cut -d ' ' -f5 | grep ${TERMINATING_CONSOLE_WIN_PID} > /dev/null
#    if [ $? -eq 0 ]; then
      tskill ${TERMINATING_CONSOLE_WIN_PID} > /dev/null 2>&1
#      taskkill /F /FI "PID eq ${TERMINATING_CONSOLE_WIN_PID}" /IM cmd.exe
#    fi
    cacheEnvVar -f -c TERMINATING_CONSOLE_WIN_PID
  fi
}
function getCampPIDs {
  isCygwin && tasklist | grep -E 'nlserver|httpd' | awk '{print $2;}' | xargs
  isCygwin || ps -e -o pid,cmd | grep -E 'nlserver' | grep -v grep | sed -r 's,^\s+,,' | awk '{print $1;}' | xargs
}
function isCampAlive {
  nlserver pdump | grep -E "^watchdog|syslogd@|web@" > /dev/null
  [[ $? -eq 0 ]] && true || false
}

function stopCampaign {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | -c(clean up log apache/acc log files/folders) ]" && return
  pushd ${NL_DBG_BIN_DIR} > /dev/null
  local bgcount=$(jobs | wc -l)
  apache stop
  nls shutdown
  local Attempts=3

  while [[ $[$(jobs | wc -l) - ${bgcount}] -gt 0 || -n $(getCampPIDs) ]]; do
    sleep 2
    Attempts=$[$Attempts-1]
    [[ $Attempts -lt 1 ]] && break
  done
  if [[ -n $(getCampPIDs) ]]; then
    echo "Terminating defunct nlserver processes ..."
    if isCygwin; then
        taskkill /F /IM nlserver.exe
    else
      for pid in $(getCampPIDs); do
        sudo kill -TERM ${pid}
        echo "SUCCESS: The process with PID ${pid} has been terminated."
      done
      for pid in $(getCampPIDs); do
        sudo kill -9 ${pid}
        echo "SUCCESS: The process with PID ${pid} has been killed."
      done
      [[ -z ${USERPATH} ]] || sudo rm -f ${USERPATH}/.shm*
    fi
  fi
  true > /tmp/nlpdump
  if _CONTAINS -c "$@" ; then
    echo "${GREEN_COL}INFO${RESET_COL}:  Deleting Apache and nlserver log files...(Tracking data/log is retained)"
    isCygwin && { rm -rf $(cygpath -u ${APACHE_ROOT})logs/* ; echo; } || sudo rm -rf /var/log/apache2/*
    find ${CAMP_AC_ROOT}/nl/build/ncs/var -type d -iname *log* -not -path "*/redir/*" -exec rm -rf {} \;
    mkdir -p ${CAMP_AC_ROOT}/nl/build/ncs/var/res
  fi
  popd > /dev/null
}

function genSSLCerts {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) ] [< Sequence id >= 2 > <hostname> | 2 '*.<domian-name>']" && 
  echo "You can inspect generated pem certificate file using following command:" &&
  echo "${YELLOW_COL}cat '${APACHE_ROOT}server_cert.pem' | openssl x509 -text -nocert${RESET_COL}"  &&
  return
  local APACHE_CONF_DIR=${APACHE_ROOT}
  isCygwin && APACHE_CONF_DIR=$(cygpath -u ${APACHE_ROOT})conf
  [[ ! -e ${APACHE_CONF_DIR}/openssl.conf ]] && { echo "openssl.conf not found. You may want to reinstall Apache" | STDERR; return 2; }
  [[ ! -e ${APACHE_CONF_DIR}/httpd.conf ]] && { echo "httpd.conf not found. You may want to reinstall Apache" | STDERR; return 3; }
  sudo chown -R $(whoami) ${APACHE_CONF_DIR}
  echo "${GREEN_COL}INFO:${RESET_COL} Using ${OPENSSL_BIN} $(${OPENSSL_BIN} version)"
  local cname=$(hostname --fqdn)
  local cpCmd="$(which cp) -f -p"
  local mvCmd="$(which mv) -f"

  case $# in
    0)
    ;;
    2)
      if [ "$1" -ge 2 ] 2> /dev/null
      then
        cname=$2
        if [ "${cname:0:1}" = "*" ]; then
          shift
          shift
        fi
      else
        echo "${RED_COL}ALERT:${RESET_COL} Seq id should be a number >=  2 "
        echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} <Sequence id 2 or higher> <hostname>"
        return 1
      fi
    ;;
    *)
      echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <Sequence id 2 or higher> <hostname>"
      return 1
  esac
  local userFullName="$(getUserInfo -fullname)"
  local ORG_NAME="$(getUserInfo -org)"
  local tmpFolder=${TMP}/${FUNCNAME[0]}
  [[ -e ${tmpFolder} ]] && rm -rf ${tmpFolder}
  mkdir ${TMP}/${FUNCNAME[0]}
  ${cpCmd} ${APACHE_CONF_DIR}/openssl.conf ${tmpFolder}/
  ${cpCmd} ${APACHE_CONF_DIR}/httpd.conf ${tmpFolder}/
  pushd ${tmpFolder}/
  sed -r -i "s/^\s*commonName.*/commonName = ${cname}/g" ./openssl.conf
  sed -r -i "s/^\s*organizationalUnitName.*/organizationalUnitName = ${ORG_UNIT_NAME}/g" ./openssl.conf
  sed -r -i "s/^\s*organizationName.*/organizationName = ${ORG_NAME}/g" ./openssl.conf
  sed -r -i "s/^#\s*x509_extensions.*/x509_extensions = v3_req/g" ./openssl.conf
  sed -r -i "s/^\s*default_bits.*/default_bits = 4096/g" ./openssl.conf
  sed -r -i "s/^\s*keyUsage.*/keyUsage = critical,digitalSignature,keyAgreement,nonRepudiation,keyEncipherment/g" ./openssl.conf
  sed -r -i "s/^\s*# extendedKeyUsage(.*)/extendedKeyUsage\1/g" ./openssl.conf
  sed -r -i "s/^\s*emailAddress.*/emailAddress = $(whoami)@${ADOBE_DOMAIN}/g" ./openssl.conf
  sed -r -i "s/^\s*name.*/name = ${userFullName}/g" ./openssl.conf
  sed -r -i "s/^\s*DNS\.1 .*/DNS\.1 = ${cname}/g" ./openssl.conf
  if [ ! -z $1 ]; then
    sed -r -i "s/^\s*DNS\.$1 .*//g" ./openssl.conf
    sed -r -i "/^\s*DNS\.1 .*/a DNS\.$1 = $2\.$(hostname -d)" ./openssl.conf
  fi
  local default_bits=$(getCmdValue "cat openssl.conf | grep -n '^\s*default_bits' | cut -d '=' -f2 | sed s/\ //g")
  rm -f server_private_key.pem server_cert.pem server_merged_public_and_private_key.pfx
  ${OPENSSL_BIN} genrsa -out server_private_key.pem  "$default_bits"
  local envSetupDir="$(readlink -f "${CAMP_AC_ROOT}/../acc-dev/acc-dev-setup")"
  local iRc=0
  local rootCA="${envSetupDir}/rootCA.pem"
  local rootCAKey="${envSetupDir}/rootCAKey.pem"
  if [ -f "${rootCA}" -a -f "${rootCAKey}" ]; then
    ${OPENSSL_BIN} req -config ./openssl.conf -new -sha256 -key server_private_key.pem -out signing_request.csr
    echo "Signing this new certificate with an existing root certificate @ ${rootCA}"
    echo "Ask hparmar@${ADOBE_DOMAIN} for root certificate signing password in case you are using existing(in git) root certificate."
    echo "Else enter password you used for generating your own root signing certificate"
    echo "********************************************************************"
    echo ""
    local passwordAttempts=3
    while [ $passwordAttempts -ne 0 ]
    do
      if [[ -z ${SECRET_PASSWORD+x} || ${passwordAttempts} -lt 3 ]]; then
        ${OPENSSL_BIN} x509 -req -in signing_request.csr -extensions v3_req -extfile ./openssl.conf -CA ${rootCA} -CAkey ${rootCAKey} -CAcreateserial -days 1095 -sha256 -out server_root_signed_cert.pem
      else
        ${OPENSSL_BIN} x509 -req -in signing_request.csr -extensions v3_req -extfile ./openssl.conf -CA ${rootCA} -CAkey ${rootCAKey} -CAcreateserial -days 1095 -sha256 -out server_root_signed_cert.pem  -passin pass:${SECRET_PASSWORD}
      fi
      iRc=$?
      passwordAttempts=$[$passwordAttempts-1]
      if [ $iRc -eq 0 ]; then
        break;
      fi
      echo "Bad password...Try again...Ask hparmar@${ADOBE_DOMAIN} for root certificate signing password if you are using existing(in git) root certificate." | STDERR
    done
    [[ $iRc -eq 0 ]] || { echo "Too many bad password attempts." | STDERR || return $(errno EPERM | cut -d ' ' -f2); }
    sudo ${mvCmd} server_root_signed_cert.pem server_cert.pem
    rm -f signing_request.csr
    rm -f ${rootCA%.*}.srl
    if isCygwin; then
      local CERT_UTIL="$(cygpath -w $(findW -i windows certutil))"
      local wp=$(getCmdValue getPlatformPath)
      local yn
      echo "Some ${YELLOW_COL}SMPP/SMS ${BOLD}'servers'${RESET_COL} running in secure mode may need certificate to present be in your machine's Personal(My) store."
      flushInput
      readEx "${RED_COL}ALERT:${RESET_COL} Skipping Register of this certificate in your machine's Personal(My) store. Continue in " 5 " seconds"
      if [[ $? -eq 0 ]]; then
        read -p "Do you want to register? (y/[n])" yn
        yn=${yn:0:1}
      else
        echo ""
      fi
      if [ "X${yn,,}" = "Xy" ] ;  then
        if [[ -z ${SECRET_PASSWORD+x} ]]; then
          echo "Merging private key into certificate and exporting as pfx as it is one the formats which supports embedding/exporting private key."
          echo "You will be asked(twice) for export password for PFX export.Use the same password third time when asked for PFX Import."
          ${OPENSSL_BIN} pkcs12 -inkey server_private_key.pem -in server_cert.pem  -export -out server_merged_public_and_private_key.pfx
          local delStoreCmd="-Command ${CERT_UTIL} -delstore My ${cname}"
          wps -Command "Start-Process $PWSHELL  -ArgumentList '$delStoreCmd' -Verb RunAs"
          # local add_pfx_to_StoreCmd="-Command ${CERT_UTIL} -f -importpfx ${wp}server_merged_public_and_private_key.pfx; sleep 3"
          local add_pfx_to_StoreCmd="-Command \$p=(Read-Host -AsSecureString Enter PFX Import Password); Import-PfxCertificate -Password \$p -FilePath ${wp}server_merged_public_and_private_key.pfx -CertStoreLocation Cert:\LocalMachine\My; sleep 3"
          wps -Command "Start-Process $PWSHELL -ArgumentList '$add_pfx_to_StoreCmd' -Verb RunAs"
        else
          ${OPENSSL_BIN} pkcs12 -inkey server_private_key.pem -in server_cert.pem  -export -out server_merged_public_and_private_key.pfx -passout pass:${SECRET_PASSWORD}
          local delStoreCmd="-Command ${CERT_UTIL} -delstore My ${cname}"
          wps -Command "Start-Process $PWSHELL  -ArgumentList '$delStoreCmd' -Verb RunAs"
          # local add_pfx_to_StoreCmd="-Command ${CERT_UTIL} -f -importpfx -p ${SECRET_PASSWORD} ${wp}server_merged_public_and_private_key.pfx; sleep 3"
          local add_pfx_to_StoreCmd="-Command \$p=ConvertTo-SecureString  -String \\\"${SECRET_PASSWORD}\\\" -AsPlainText -Force; Import-PfxCertificate -Password \$p -FilePath ${wp}server_merged_public_and_private_key.pfx -CertStoreLocation Cert:\LocalMachine\My; sleep 3"
          wps -Command "Start-Process $PWSHELL -ArgumentList '$add_pfx_to_StoreCmd' -Verb RunAs"
        fi
      fi
    fi
  else
    echo "Root signing certificate not found..Generating a self signed certificate"
    echo "If you want a root signed certificate use 'registerRootCert' command"
    echo "first to generate a root certificate and then run this command"
    echo ""
    ${OPENSSL_BIN} req -config ./openssl.conf -new -x509 -sha256 -key server_private_key.pem -days 1095 -out server_self_signed_cert.pem
    iRc=$?
    ${mvCmd} server_self_signed_cert.pem server_cert.pem
    if isCygwin; then
      local CERT_UTIL="$(cygpath -w $(findW -i windows certutil))"
      local wp=$(getCmdValue getPlatformPath)
      local delStoreCmd="-Command ${CERT_UTIL} -delstore Root $(hostname --fqdn)"
      wps -Command "Start-Process $PWSHELL  -ArgumentList '$delStoreCmd' -Verb RunAs"
      local addStoreCmd="-Command ${CERT_UTIL} -addstore Root ${wp}server_cert.pem"
      wps -Command "Start-Process $PWSHELL  -ArgumentList '$addStoreCmd' -Verb RunAs"
      flushInput
      local yn
      read -p "Do you want to register this certificate in your machine's Personal(My) store? (y/[n]) " yn
      yn=${yn:0:1}
      if [ "X${yn,,}" = "Xy" ] ;  then
        if [[ -z ${SECRET_PASSWORD+x} ]]; then
          echo "Merging private key into certificate and exporting as pfx as it is one the formats which supports embedding/exporting private key."
          echo "You will be asked(twice) for export password for PFX export.Use the same password third time when asked for PFX Import."
          ${OPENSSL_BIN} pkcs12 -inkey server_private_key.pem -in server_cert.pem  -export -out server_merged_public_and_private_key.pfx
          local delStoreCmd="-Command ${CERT_UTIL} -delstore My ${cname}"
          wps -Command "Start-Process $PWSHELL  -ArgumentList '$delStoreCmd' -Verb RunAs"
          # local add_pfx_to_StoreCmd="-Command ${CERT_UTIL} -f -importpfx ${wp}server_merged_public_and_private_key.pfx; sleep 3"
          local add_pfx_to_StoreCmd="-Command \$p=(Read-Host -AsSecureString Enter PFX Import Password); Import-PfxCertificate -Password \$p -FilePath ${wp}server_merged_public_and_private_key.pfx -CertStoreLocation Cert:\LocalMachine\My; sleep 3"
          wps -Command "Start-Process $PWSHELL -ArgumentList '$add_pfx_to_StoreCmd' -Verb RunAs"
        else
          ${OPENSSL_BIN} pkcs12 -inkey server_private_key.pem -in server_cert.pem  -export -out server_merged_public_and_private_key.pfx -passout pass:${SECRET_PASSWORD}
          local delStoreCmd="-Command ${CERT_UTIL} -delstore My ${cname}"
          wps -Command "Start-Process $PWSHELL  -ArgumentList '$delStoreCmd' -Verb RunAs"
          # local add_pfx_to_StoreCmd="-Command ${CERT_UTIL} -f -importpfx -p ${SECRET_PASSWORD} ${wp}server_merged_public_and_private_key.pfx; sleep 3"
          local add_pfx_to_StoreCmd="-Command \$p=ConvertTo-SecureString  -String \\\"${SECRET_PASSWORD}\\\" -AsPlainText -Force; Import-PfxCertificate -Password \$p -FilePath ${wp}server_merged_public_and_private_key.pfx -CertStoreLocation Cert:\LocalMachine\My; sleep 3"
          wps -Command "Start-Process $PWSHELL -ArgumentList '$add_pfx_to_StoreCmd' -Verb RunAs"
        fi
      fi
    fi
  fi
  echo "Moving  certificates to ${APACHE_ROOT} ..."
  [[ -f server_merged_public_and_private_key.pfx ]] && sudo ${cpCmd} server_merged_public_and_private_key.pfx $(ustyle "${APACHE_ROOT}")
  sudo ${cpCmd} server_cert.pem $(ustyle "${APACHE_ROOT}")
  sudo ${cpCmd} server_private_key.pem $(ustyle "${APACHE_ROOT}")
  popd

  return $iRc
}
function installApache {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | -f(force install) | -q(quite)] -- Installs apache from ${TEAM_SHARE_LOCATION}" && return
  local APACHE_CONF_DIR=${APACHE_ROOT}
  isCygwin && APACHE_CONF_DIR=$(cygpath -u ${APACHE_ROOT})conf
  local cpCmd="$(which cp) -f -p"
  local mvCmd="$(which mv) -f"
  [[ -e $(native ${TEAM_SHARE_LOCATION}Apache24_x64\\bin\\httpd.exe) ]] || { echo "You do not have permission to shared location ${TEAM_SHARE_LOCATION}..Please ask for enrollment to ${YELLOW_COL}INDSTORE_CAMPAIGN_ACC_INDIA_MUSTANG_RO${RESET_COL} group via ${YELLOW_COL}https://iam.${ADOBE_CORP_DOMAIN}${RESET_COL} from senior members of team" && return 2; }
  if [ ! -d "${APACHE_CONF_DIR}" ] || [ ! -e ${APACHE_CONF_DIR}/httpd.conf ] || [ "X${1,,}" = "X-f" ]; then
    [[ "X${1,,}" = "X-f" ]] && apache stop
    if isCygwin ; then
      [[ "X${1,,}" = "X-f" ]] && { rm -rf "${APACHE_ROOT}"; mkdir -p "${APACHE_ROOT}"; }
      if [ $(getCmdValue "wps  -Command '(Get-Service W3SVC* | measure).Count'") -ne 0 ]; then
        echo "Turning off Windows IIS Web service...Apache to be used instead."
        local stop_IIS_Web_Service_Cmd="-Command Stop-Service W3SVC"
        wps -Command "Start-Process $PWSHELL  -ArgumentList \"${stop_IIS_Web_Service_Cmd}\" -Verb RunAs"
        local disable_IIS_Web_Service_Cmd="-Command Set-Service W3SVC -StartupType Disabled"
        wps -Command "Start-Process $PWSHELL  -ArgumentList \"${disable_IIS_Web_Service_Cmd}\" -Verb RunAs"
      fi
      echo "Installing Apache...${BUILD_BIT_WIDE} bit"
      local watch
      exec_command_exists watch && watch -e -q -t -w 2>&1 | head -n 1 | grep -v unknown > /dev/null && watch=1
      if [[ -z $watch ]]; then
        echo "Installing ${YELLOW_COL}procps-ng${RESET_COL} package for ${YELLOW_COL}watch${RESET_COL} utility.."
        wcinstall procps-ng
      fi
      type watch > /dev/null
      if [ "X${BUILD_BIT_WIDE}" = "X32" ]; then
        $(cygpath -u ${TEAM_SHARE_LOCATION}Apache24_x86\\bin\\httpd.exe) -v
        if [[ -z $watch ]]; then
          ${cpCmd} -v -r ${TEAM_SHARE_LOCATION}Apache24_x86 $(dirname $(native ${APACHE_ROOT}))\\
        else
          ${cpCmd} -r ${TEAM_SHARE_LOCATION}Apache24_x86 $(dirname $(native ${APACHE_ROOT}))\\ &
          watch -w -e -t -q 8 "ps -p $! > /dev/null && echo Fetching Apache...${BUILD_BIT_WIDE} bit && du -hs -BK $(ustyle ${APACHE_ROOT}) || echo Finishing Copying..."
        fi
      else
        $(cygpath -u ${TEAM_SHARE_LOCATION}Apache24_x64\\bin\\httpd.exe) -v
        if [[ -z $watch ]]; then
          ${cpCmd} -v -r ${TEAM_SHARE_LOCATION}Apache24_x64 $(dirname $(native ${APACHE_ROOT}))\\
        else
          ${cpCmd} -r ${TEAM_SHARE_LOCATION}Apache24_x64 $(dirname $(native ${APACHE_ROOT}))\\ &
          watch -w -e -t -q 8 "ps -p $! > /dev/null && echo Fetching Apache...${BUILD_BIT_WIDE} bit && du -hs -BK $(ustyle ${APACHE_ROOT}) || echo Finishing Copying..."
        fi
      fi
        sudo ${cpCmd} $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/httpd.conf ${APACHE_CONF_DIR}
        sudo ${cpCmd} $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/openssl.conf ${APACHE_CONF_DIR}
        sudo ${cpCmd} ${APACHE_CONF_DIR}/mime.types ${APACHE_CONF_DIR}/../
        sudo ${cpCmd} $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/uploader.html ${APACHE_CONF_DIR}/../htdocs/
        sudo ${cpCmd} $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/save_file.py ${APACHE_CONF_DIR}/../htdocs/
        local pythonExeCount=$(wps -Command "(Get-Command python.exe).Source" | sed -r 's/[^\n[:print:]]//g' | wc -l)
        local pythonExe
        [[ ${pythonExeCount}  -eq 1 ]] && pythonExe=$(wps -Command "(Get-Command python.exe).Source" | sed -r 's/[^\n[:print:]]//g')
        [[ -z ${pythonExe} ]] && pythonExe="$(native $(which python))"
        [[ -z ${pythonExe} ]] && pythonExe="$(native $(which python3))"
        [[ -z ${pythonExe} ]] && echo "${RED_COL}ALERT:${RESET_COL} No python Found. Upload to apache may not work." || { echo "Setting python executable ${YELLOW_COL}${pythonExe}${RESET_COL} as shebang for python server side script for upload to apache web server."; sed -i "1s,.*,\#\!${pythonExe//\\//},g"  ${APACHE_CONF_DIR}/../htdocs/save_file.py; }
        sudo mkdir ${APACHE_CONF_DIR}/../htdocs/upload/
        [[ -h ~/upload ]] || sudo ln -s ${APACHE_CONF_DIR}/../htdocs/upload ~/upload
    else
      aptS install apache2
      [[ "X${1,,}" = "X-f" ]] && rm -f ${APACHE_ROOT}/httpd.conf
      if [[ ! -e ${APACHE_ROOT}/httpd.conf ]] ; then
        sudo systemctl stop apache2
        local apache_bkp_dir=/etc/apache2.$(date '+%d%b%Y_%H_%M_%S_%s')
        echo "Backing up default apache2 installation config folder to ${apache_bkp_dir}  ..."
        sudo ${mvCmd} ${APACHE_ROOT} ${apache_bkp_dir}
        sudo mkdir ${APACHE_ROOT}
        sudo ${cpCmd} $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/httpd.conf ${APACHE_CONF_DIR}
        sudo ${cpCmd} $CAMP_AC_ROOT/../acc-dev/acc-dev-setup/openssl.conf ${APACHE_CONF_DIR}
        pushd ${APACHE_ROOT}
        sudo ln -s /usr/lib/apache2/modules modules
        sudo touch ${apache_bkp_dir}/envvars
        sudo ln -s ${apache_bkp_dir}/envvars envvars
        sudo ln -s /etc/mime.types mime.types
        sudo ln -s /etc/init.d/apache2 apache2.init.startupScript.sh
        sudo chown -R $(id -un):$(id -gn) .
        echo "export USERPATH=$HOME" | sudo tee -a envvars
        cacheEnvVar USERPATH "${HOME}"
        popd > /dev/null
      fi
      ${cpCmd} ${CAMP_AC_ROOT}/nl/build/nlsrvmod/libnlsrvmod.so ${CAMP_AC_ROOT}/nl/build/ncs/bin/libnlsrvmod.so
      ${cpCmd} ${CAMP_AC_ROOT}/nl/build/ncs/datakit/xtk/${CAMP_LANG}/schema/* ${CAMP_AC_ROOT}/nl/build/ncs/datakit/xtk/${CAMP_LANG}/
      sudo mkdir ${APACHE_CONF_DIR}htdocs/
      sudo chown -R $(id -un):$(id -gn) ${APACHE_CONF_DIR}htdocs/
      sudo ${cpCmd} ${CAMP_AC_ROOT}/../acc-dev/acc-dev-setup/uploader.html ${APACHE_CONF_DIR}htdocs/
      sudo ${cpCmd} ${CAMP_AC_ROOT}/../acc-dev/acc-dev-setup/save_file.py ${APACHE_CONF_DIR}htdocs/
      local pythonExe
      [[ -z ${pythonExe} ]] && pythonExe="$(native $(which python))"
      [[ -z ${pythonExe} ]] && pythonExe="$(native $(which python3))"
      [[ -z ${pythonExe} ]] && echo "${RED_COL}ALERT:${RESET_COL} No python Found. Upload to apache may not work." || { echo "Setting python executable ${YELLOW_COL}${pythonExe}${RESET_COL} as shebang for python server side script for upload to apache web server."; sudo sed -i "1s,.*,\#\!${pythonExe//\\//},g"  ${APACHE_CONF_DIR}htdocs/save_file.py; }
      sudo mkdir ${APACHE_CONF_DIR}htdocs/upload
      sudo chown -R $(id -un):$(id -gn) ${APACHE_CONF_DIR}htdocs/upload/
      sudo chown $(id -un):$(id -gn) ${APACHE_CONF_DIR}htdocs/*.htm*
      sudo chown $(id -un):$(id -gn) ${APACHE_CONF_DIR}htdocs/*.py
      [[ -h ~/upload ]] || ln -s ${APACHE_CONF_DIR}htdocs/upload ~/upload
    fi
  fi
  if [[ "X${1,,}" != "X-q" ]]; then
    pushd ${APACHE_CONF_DIR}
    apache -v
    # Update apache config file with info
    local campRoot="$(native "$(getCampRoot)" | tr '\\' '/')"
    local host_aliases_regex="($({ cat /etc/hosts | grep -E "^$(getIP)" | awk -F"#" '{print $1;}' | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF;}'; hostname --fqdn; } | xargs -n1 | sort -r -f -u | xargs | sed -r -e 's,[[:space:]]+,|,g' -e 's,\.,\\\\\.,g'))"
    if isCygwin; then
      sed -r -i "s|^\s*Define CampaignRoot .*|Define CampaignRoot \"${campRoot}\"|" ./httpd.conf
      sed -r -i "s|^\s*ServerName .*|ServerName $(hostname --fqdn)|" ./httpd.conf
      sed -r -i "s|^\s*ServerAlias .*|ServerAlias \*\.$(hostname -d)|" ./httpd.conf
      sed -r -i "s,SetEnvIfNoCase Host \"\([^[:space:]]+\),SetEnvIfNoCase Host \"${host_aliases_regex},g" ./httpd.conf
      echo '<html><meta name="google" content="notranslate"><head><title>Apache Web server</title></head><body><p><br>'"$(apache -V | sed -r 's,^,<br>,g')"'</p></body><html>' > ${APACHE_CONF_DIR}/../htdocs/index.html
    else
      [[ -f httpd.conf ]] && { sudo cp -f apache2.conf apache2.conf.old; sudo cp httpd.conf apache2.conf; }
      sudo sed -r -i "s|^\s*Define CampaignRoot .*|Define CampaignRoot \"${campRoot}\"|" ./apache2.conf
      sudo sed -r -i "s|^\s*Define APACHE_OWNER .*|Define APACHE_OWNER \"$(id -un)\"|" ./apache2.conf
      sudo sed -r -i "s|^\s*Define APACHE_GROUP .*|Define APACHE_GROUP \"$(id -gn)\"|" ./apache2.conf
      sudo sed -r -i "s|^\s*ServerName .*|ServerName $(hostname --fqdn)|" ./apache2.conf
      sudo sed -r -i "s|^\s*ServerAlias .*|ServerAlias \*\.$(hostname -d)|" ./apache2.conf
      sudo sed -r -i "s,SetEnvIfNoCase Host \"\([^[:space:]]+\),SetEnvIfNoCase Host \"${host_aliases_regex},g" ./apache2.conf
      [[ ! -d logs ]] && sudo mkdir logs && sudo chown $(whoami) logs
      [[ ! -d htdocs ]] && sudo mkdir htdocs  && sudo chown $(whoami) htdocs
      sudo echo '<html><meta name="google" content="notranslate"><head><title>Apache Web server</title></head><body><p><br>'"$(apache -V | sed -r 's,^,<br>,g')"'</p></body><html>' > ${APACHE_CONF_DIR}/htdocs/index.html
      mv -f apache2.conf httpd.conf
      sudo ln -s httpd.conf apache2.conf
      sudo chown -R root ${APACHE_CONF_DIR}
    fi
    registerRootCert
    genSSLCerts
    popd > /dev/null
  fi
}

function installNewRelicAgent {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp)] -- Installs newrelic daemon/agent on debian" && return
  isCygwin &&  { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  [[ -f /usr/local/bin/newrelic-daemon ]] || echo "No existing Newrelic agent found."
  [[ -x /usr/local/bin/newrelic-daemon ]] || echo "Newrelic daemon is not executable."
  local newrelicURL='https://apt.camp-infra.adobe.net/nlserver7/pool/experimental/n/newrelic-daemon'
  local newrelicVersion='newrelic-daemon-1.3.0-4-deb10.deb'
  [[ -f /home/$(whoami)/Downloads/newrelic-daemon-1.3.0-4-deb10.deb ]] || wps -Command "Start-Process -Wait ${newrelicURL}/${newrelicVersion}"
  [[ -f /home/$(whoami)/Downloads/newrelic-daemon-1.3.0-4-deb10.deb ]] || { echo "Download failed" ; return 2; }
  dpkg-deb --extract /home/$(whoami)/Downloads/newrelic-daemon-1.3.0-4-deb10.deb /tmp/newrelic-daemon
  pushd /tmp/newrelic-daemon
  sudo cp  -f -p ./etc/systemd/system/newrelic-daemon.service /etc/systemd/system
  sudo cp  -f -p ./usr/local/newrelic/newrelic-daemon /usr/local/bin
  sudo chmod +x /usr/local/bin/newrelic-daemon
  sudo mkdir /var/log/newrelic
  sudo chown $(whoami):$(id -gn) /var/log/newrelic
  newrelic-daemon -v
  [[$? -eq 0 ]] || echo "${RED_COL}ALERT:${RESET_COL} New Relic daemon install failed !"
  newrelic-daemon
  [[$? -eq 0 ]] || echo "${RED_COL}ALERT:${RESET_COL} New Relic daemon launch failed !"

  echo "Newrelic daemon is now installed.Configuring all campaign instance(s) $({ readarray insts <<< $(getCampaignInstance 10); joinArray , "${insts[@]}" | tr -d '\n'; }) for new relic support."
  local nrLicenseKey nrLicenseKey2
  local encrypted_nrLicenseKey='raP+lvG04GcxKsjxkSNOm2+FKSdmHU0TghlRC+qU7gBfto/v3tH5jhfXXPZAVud8' # d0...e5 for Account: 1716029 - DX_Campaign_Engineering
  local encrypted_nrLicenseKey2='3U+3WWtYNiAM2RZT4ot4Ho0roJXwjZwVWK3ArOohUWNXV+wTF1Y7yQn7iFNvhGfq' # 8b...f5 for Account: 1189422 - DMA_Campaign_Dev
  if [ -z ${SECRET_PASSWORD+x} ]; then
    nrLicenseKey=$(echo ${encrypted_nrLicenseKey} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt)
    [[ $? -eq 0 ]] || { echo "Bad decryption key" | STDERR; }
    nrLicenseKey2=$(echo ${encrypted_nrLicenseKey2} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt)
  else
    nrLicenseKey=$(echo ${encrypted_nrLicenseKey} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${SECRET_PASSWORD})
    [[ $? -eq 0 ]] || { echo "Bad decryption key" | STDERR; }
    nrLicenseKey2=$(echo ${encrypted_nrLicenseKey2} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${SECRET_PASSWORD})
  fi
  [[ $? -eq 0 ]] || { echo "Bad decryption key" | STDERR; }
  nrLicenseKey=${nrLicenseKey:=${nrLicenseKey2}}
  export NEWRELIC_LIC_KEY=${NEWRELIC_LIC_KEY:=${nrLicenseKey}}
  [[ ${nrLicenseKey:0:2} = 'd0' && ${nrLicenseKey: -2} = 'e5' ]] && echo "${GREEN_COL}INFO:${RESET_COL} Using key # d0...e5 for New Relic 'Account: 1716029 - DX_Campaign_Engineering'"
  [[ ${nrLicenseKey:0:2} = '8b' && ${nrLicenseKey: -2} = 'f5' ]] && echo "${GREEN_COL}INFO:${RESET_COL} Using key # 8b...f5 for New Relic 'Account: 1189422 - DMA_Campaign_Dev'"

  for inst in $(getCampaignInstance 10); do
    nls config -instance:${inst} -newrelicaccount:${NEWRELIC_LIC_KEY}/ACC_${BUILD_NUMBER}_$(getCampaignDatabase ${inst})
  done
}
function installSnowflakeClient {
  local sfc_V='1.2.28'
  if ! exec_command_exists snowsql || [[ $1 = "-f" ]] || [[ $(trim $(snowsql -v | awk '{print $2;}')) != ${sfc_V} ]]; then
    pushd /tmp > /dev/null
    local sfcInstaller
    if isCygwin; then
      sfcInstaller=snowsql-${sfc_V}-windows_x86_64.msi
      download https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/${sfc_V%.*}/windows_x86_64/${sfcInstaller}
      chmod +x ${sfcInstaller}
      wps -Command "Start-Process ./${sfcInstaller}  -ArgumentList '/qb' -Wait"
      refreshEnvPath_Windows
    else
      sfcInstaller=snowsql-${sfc_V}-linux_x86_64.bash
      download https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/${sfc_V%.*}/linux_x86_64/${sfcInstaller}
      chmod +x ${sfcInstaller}
      sudo bash -c $(readlink -f ${sfcInstaller})
    fi
    popd > /dev/null
  fi
  sfsql -v
  echo -ne '!help\n!print Connection from client host\n!system hostname --fqdn\n!print Was successful.\n' > sfwelcome.cmd
  sfsql sf_tractorsupply_prod2_mkt -q '!source sfwelcome.cmd'
  rm -f sfwelcome.cmd
}

function installffmpeg {
    if ! exec_command_exists ffmpeg || [ "X${1,,}" = "X-f" ]; then
      if isCygwin; then
        pushd /tmp
        toggleXMLLintUse
        local ffmpegDownloadURL="https://github.com$(curl -s https://github.com/BtbN/FFmpeg-Builds/releases | grep win64 | grep "\-gpl"  | grep -v "shared" | grep zip | head -1 | getXMLAttrVal a href)"
        toggleXMLLintUse
        echo "Downloading ffmpeg windows static binaries from ${ffmpegDownloadURL}"
        download "${ffmpegDownloadURL}"
        ffmpegExe=$(unzip -o $(echo ${ffmpegDownloadURL}  | sed 's,^.*/,,') | grep inflating | grep ffmpeg  | grep "\.exe" | head -n 1 | cut -d ':' -f2 | xargs)
        cp -f ./$(dirname ${ffmpegExe})/*.exe /usr/local/bin
        popd
      else
        aptS install ffmpeg
      fi
      ffmpeg -version
    else
      [[ "X${1,,}" != "X-q" ]] && echo "${GREEN_COL}INFO:${RESET_COL}   ffmpeg already available." && ffmpeg -version
    fi
}
function installgit {
  if ! exec_command_exists git; then
    aptS remove git
    aptS install git
  fi
  isCygwin && git --version && return
  pushd $CAMP_AC_ROOT/.. > /dev/null
  sudo rm -rf git
  git clone https://github.com/git/git.git
  cd git
  sudo make prefix=/usr/local install install-doc install-html install-info
  local yn
  read -p "Removing old/stale git version ${YELLOW_COL}$(git --version)${RESET_COL}? ([y]/n)" yn
  [[ "X${yn,,}" != "Xn" ]] && aptS remove git
  git --version
  iRc=$?
  popd
  return $iRc
}

function installShmemTools {
  if isCygwin; then
    pushd $TMP > /dev/null
    local shmtoolName='AccessChk'
    local showshowUITool='ProcessExplorer'
    download https://download.sysinternals.com/files/${shmtoolName}.zip
    download https://download.sysinternals.com/files/${showshowUITool}.zip
    unzip -o ${shmtoolName}.zip
    unzip -o ${showshowUITool}.zip
    local arch=64
    [[ ${BUILD_BIT_WIDE} -eq 32 ]] && arch=''
    cp -f -p ${shmtoolName}${arch}.exe /usr/local/bin/${shmtoolName,,}.exe
    cp -f -p procexp${arch}.exe /usr/local/bin/procexp.exe
    popd > /dev/null
    return
  fi
  if ! exec_command_exists ipcs || ! exec_command_exists ipcrm || [[ ${1,,} =~ ^-f.* ]]; then
    echo "Installing ipcs and ipcrm"
    aptS update
    aptS install util-linux
    ipcs -V && ipcrm -V
  fi
  [[ ${1,,} =~ ^-f.* ]] && { rm -f $(which shmcat); rm -rf ${CAMP_AC_ROOT}/../shmcat; }
  if ! exec_command_exists shmcat; then
    if ! exec_command_exists git; then
      aptS remove git
      aptS install git
    fi
    pushd ${CAMP_AC_ROOT}/.. > /dev/null
    git clone https://github.com/hardeepparmar/shmcat.git
    cd shmcat
    [[ -f shmcat ]] && rm -f shmcat
    gcc -O2 -std=gnu99 shmcat.c -o shmcat
    [[ -f shmcat ]] || { echo "${FUNCNAME[0]} Error building shmcat" | STDERR || return 2; }
    sudo chmod +x shmcat
    sudo mv shmcat /usr/local/bin/
    echo "${YELLOW_COL}Usage:${RESET_COL} shmcat <$(shmcat)>"
    echo "List of existing shared memeory segments"
    ipcs -m
    popd > /dev/null
  fi
}
function shmclear {
  isCygwin && { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return 38; }
  _CONTAINS -h "$@" || [[ $# -eq 0 ]] && { echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <owner-user e.g $(id -un)>"; return 1; }
  for ou in $@; do
    for shmKey in $(sudo ipcs -m | awk -v _MEMOWNER_="${ou}" '{ if($3 == _MEMOWNER_) { print $1;} }' | xargs); do
      [[ $(h2d ${shmKey}) -ne 0 ]] && echo "Deleting key ${shmKey}" && sudo ipcrm -M ${shmKey}
    done
  done
  sudo ipcs -m
}

function shmshow {
  if isCygwin; then
    local shmtoolName='AccessChk'
    shmtoolName=${shmtoolName,,}
    exec_command_exists ${shmtoolName} || installShmemTools
    exec_command_exists ${shmtoolName} || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return 38; }
    [[ $# -eq 0 ]] && ${shmtoolName} -osv -t section || ${shmtoolName} -osv -t section | grep -i '\\Nl.*Context' -A 16
    if _CONTAINS -u "$@" ; then
      exec_command_exists procexp || installShmemTools
      exec_command_exists procexp || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return 38; }
      local HTTPD_PID=$(ps -e | grep httpd |  sed -r 's/[[:space:]]+/ /g' | awk '{print $4}')
      [[ ! -z ${HTTPD_PID} ]] && echo "Showing info for pid ${HTTPD_PID} ..." && launch procexp /e /s:${HTTPD_PID}
    fi
    return
  fi
  [[ $1 = "-f" ]] && paste <(ipcs -m) <(ipcs -m -p | sed -r 's,^----.*, ,g' | awk '{print $3"\t"$4}') || paste <(ipcs -m) <(ipcs -m -p | sed -r 's,^----.*, ,g' | awk '{print $3"\t"$4}')  | grep -v -E "^0x[0]+\s"
  echo -ne "PID\t\tUSER\t\tCMDLINE\n";
  for p in $(ipcs -m -p | awk '{print $3"\n"$4}' | grep -E "[[:digit:]]+" | grep -v -E '^\s*0\s*$' | sort | uniq); do
  local cmd
  cmd=$(sudo ps -f -o user,cmd ${p} | grep -v -E '\s+CMD')
  [[ $? -eq 0 ]] || cmd="<unknown> <dead>"
  local ellipses=' ...'
  [[ ${#cmd} -lt 80 ]] && ellipses=''
  echo -ne "$p\t\t${cmd:0:80}${ellipses}\n";
  done
}

function installgradle {
    if exec_command_exists gradle && ! _CONTAINS -f "$@"; then
      echo "${GREEN_COL}INFO:${RESET_COL}   gradle already installed..Use -f to force install it."
      gradle -v
      return
    fi
    if ! exec_command_exists unzip; then
      aptS install unzip zip
    fi
    local gradle_version='7.5.1'
    pushd /tmp
    download https://services.gradle.org/distributions/gradle-${gradle_version}-bin.zip
    unzip -o gradle-${gradle_version}-bin.zip
    local cpCmd="$(which cp) -r -f -p"
    ${cpCmd} gradle-${gradle_version}/* /usr/local/
    popd
}
function setup_perf_stk {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | -i(setup integro)] -- Installs perf_stk and integro " && return
    local PERF_GIT_REPO='perf-stk-acc'
    wcinstall gradle $@
    wcinstall maven $@
    local testNG_version='7.0.0'
    local testNG=testng-${testNG_version}.jar
    local jmeter_version='5.5'
    download https://repo1.maven.org/maven2/org/testng/testng/${testNG_version}/${testNG} /usr/local/lib/${testNG}
    mvn clean
    pushd $CAMP_AC_ROOT/..
    rm -rf apache-jmeter-*
    download https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-${jmeter_version}.zip
    download https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-${jmeter_version}.zip
    unzip apache-jmeter-${jmeter_version}.zip
    cacheEnvVar JMETER_PATH "$(getPlatformPath)apache-jmeter-${jmeter_version}\bin"
    cacheEnvVar JMETER_HOME "$(getPlatformPath)apache-jmeter-${jmeter_version}\bin"
    rm -rf ${PERF_GIT_REPO}
    git clone git@git.${ADOBE_CORP_DOMAIN}:CampaignPerformance/${PERF_GIT_REPO}.git
    pushd ${PERF_GIT_REPO}
    git pull
    git config --local core.eol lf
    git config --local core.autocrlf input
    git rm -rf --cached .
    git reset --hard HEAD
    popd
    [ -z ${ARTIFACTORY_USER} ] && cacheEnvVar ARTIFACTORY_USER $(whoami)
    [ -z ${ARTIFACTORY_UW2_USER} ] && cacheEnvVar ARTIFACTORY_UW2_USER $(whoami)
    if [[ -z ${ARTIFACTORY_API_TOKEN} || -z ${ARTIFACTORY_API_TOKEN_UW2} ]]; then
      wps -Command "Start-Process https://artifactory.${ADOBE_CORP_DOMAIN}/"
      wps -Command "Start-Process https://artifactory-uw2.adobeitc.com"
      read -p "After login into respective artifactories  using okta/symantec/SAML SSO in browser, Press any key here to continue." yn
      echo "Opening user profile section of the artifactories..."
      wps -Command "Start-Process https://artifactory.${ADOBE_CORP_DOMAIN}/ui/admin/artifactory/user_profile"
      read -p "Click on Copy to clipboard button in artifactory.${ADOBE_CORP_DOMAIN} browser tab and come back here to press any key in this terminal." yn
      cacheEnvVar ARTIFACTORY_API_TOKEN $(getCmdValue "wps -Command Get-Clipboard")
      wps -Command "Start-Process https://artifactory-uw2.adobeitc.com/ui/admin/artifactory/user_profile"
      read -p "Click on Copy to clipboard button in artifactory-uw2.adobeitc.com browser tab and come back to press any key in this terminal." yn
      cacheEnvVar ARTIFACTORY_API_TOKEN_UW2 $(getCmdValue "wps -Command Get-Clipboard")
    fi
    popd
    if isCygwin; then
        exec_command_exists idea64 || wcinstall intelliJ
        echo "${GREEN_COL}INFO:${RESET_COL}   Launching intelliJ IDEA for the first time..."
        launch idea64 "$(getPlatformPath $CAMP_AC_ROOT/../${PERF_GIT_REPO}/)"
    fi
    pushd $CAMP_AC_ROOT/../${PERF_GIT_REPO}
    TERM=cygwin ./gradlew clean buildJar
    local cpCmd="$(which cp) -f -p"
    ${cpCmd} ./build/libs/perf-stk-acc-jar-with-dependencies.jar /usr/local/lib/
    popd
# Setup and compile integro.
    if _CONTAINS -i "$@"; then
      pushd .
      gSync -i
      2integro
      mvn clean install -DskipTests
      popd
    fi
}
function runperftests {
    // TO DO: Add code to modify testexecution.xml file , which has all ACC related options required for setting up test environment.
    [[ -z $1 ]] && echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <your testng.xml >" && return 1
    [[ ! -f $1 ]] && echo "testng file $1 does not exist. ${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} <your testng.xml >" && return 2
    local perf_stk_path='/usr/local/lib/perf-stk-acc-jar-with-dependencies.jar'
    if [[ ! -f $perf_stk_path ]]; then
        read -p "Could not find perf stk...Do you want to build it from source? ([y]/n) " yn
        yn=${yn:0:1}
        [[ "X${yn,,}" != "Xn" ]] && wcinstall perf-stk-acc
        [[ ! -f $perf_stk_path ]] && echo "${RED_COL}ALERT:${RESET_COL} Error Installing perf stk" && return
    fi
    echo "Using perf stk available at ${perf_stk_path}"
    java -Dtestng-verbose=10  -cp "$(native ${perf_stk_path})" org.testng.TestNG $1
    if [[ -d ${JMETER_PATH} ]] ; then
        pushd ${JMETER_PATH}
        # ./jmeter -n -t ScriptName.jmx -l results.jtl
        # ./jmeter --help; ./jmeter -?
        ./jmeter -v
    fi
}
function installVisualStudio {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) -f(force) | 2019 | 2022 ] -- Installs Visual studio Professional edition." && return
  if isDevToolAvailable && ! _CONTAINS -f "$@"; then
    echo "${GREEN_COL}INFO:${RESET_COL}   $(getIDEVersion) already installed on this machine."
    return
  fi
  if _CONTAINS 2019 "$@"; then
    cp $(readlink.exe -f $TEAM_SHARE_LOCATION)/vs_*.exe . # /L
    local installer=$(find . -maxdepth 1 -iname vs_*.exe)
    chmod +x "${installer}"
    launch "${installer}" -?
    launch "${installer}"
    return
  fi
  if _CONTAINS 2022 "$@"; then
    cp $(readlink.exe -f $TEAM_SHARE_LOCATION)/VisualStudioSetup.exe . # /L
    local installer='./VisualStudioSetup.exe'
    chmod +x "${installer}"
    launch VisualStudioSetup.exe -?
    launch VisualStudioSetup.exe
    return
  fi
  function TurnOffVSComponent {
    sed -r -i "s/(^.*<SelectableItemCustomization.*$1.*)Selected=\"yes\"(.*)/\1Selected=\"no\"\2/g" AdminDeployment.xml
  }
  pushd /tmp
  cp $(readlink.exe -f $TEAM_SHARE_LOCATION)/Visual_Studio_2012_update_5_x86.iso . # /L
  local vsinstalliso=$(getPlatformPath)$(find . -iname "*Visual*Studio*2012*.iso" -a -not -iname "*update*" -printf "%f")
  vsinstalliso=$(echo $vsinstalliso | sed 's/\\/\\\\/g')
  local mntcmd="(Mount-Diskimage -ImagePath  $vsinstalliso | Get-Volume).DriveLetter"
  local mntDrive=$(getCmdValue "wps -Command $mntcmd")
  cp /cygdrive/$mntDrive/AdminDeployment.xml .
  TurnOffVSComponent WebTools
  TurnOffVSComponent OfficeTools
  TurnOffVSComponent SharepointTools
  TurnOffVSComponent LightSwitch
  TurnOffVSComponent SilverLight_Developer_Kit
  TurnOffVSComponent SQL
  TurnOffVSComponent Blend
  pushd /cygdrive/$mntDrive
  local wp=$(getCmdValue "getPlatformPath /tmp")
  wp=${wp}AdminDeployment.xml
  wp=$(echo $wp | sed 's|\\|\\\\|g')
  ./vs_professional.exe /AdminFile $wp
  mntcmd="Dismount-DiskImage -ImagePath $vsinstalliso"
  wps -Command $mntcmd
  echo "Finished Installing Visual Studio (Basic...)"
  popd
  echo "Installing Visual Studio update..."
  vsinstalliso=$(getPlatformPath)$(find . -iname "*Visual*Studio*2012*.iso" -a -iname "*update*" -printf "%f")
  vsinstalliso=$(echo $vsinstalliso | sed 's/\\/\\\\/g')
  local mntcmd="(Mount-Diskimage -ImagePath  $vsinstalliso | Get-Volume).DriveLetter"
  local mntDrive=$(getCmdValue "wps -Command $mntcmd")
  pushd /cygdrive/$mntDrive
  $(find . -maxdepth 1 -name "*.exe" | head -n 1) /Full
  echo "Finished Installing Visual Studio Update..."
  mntcmd="Dismount-DiskImage -ImagePath $vsinstalliso"
  wps -Command $mntcmd
  refreshEnvPath_Windows
  popd
}
function installTesseract {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  if ! exec_command_exists tesseract || [ "X${1,,}" = "X-f" ]; then
    local yn
    read -p "${YELLOW_COL}WARN:${RESET_COL} You must have windows port of  python(and pip installed. Cygwin python would not work. Uninstall it and remove /usr/bin/pip.. Do you want to continue? ([y]/n) " yn
    yn=${yn:0:1}
    [[ ! "X${yn,,}" = "Xn" ]] || { errno ECANCELED | cut -d ' ' -f3- | STDERR || return $(errno ECANCELED | cut -d ' ' -f2); }
    pip install -U opencv-python pytesseract
    local tesseractExe="$(findW -u tesseract)"
    if [ -z ${tesseractExe} ]; then
      pushd /tmp
      toggleXMLLintUse
      local tesseractWinInstallerURL="$(curl -s "https://github.com/UB-Mannheim/tesseract/wiki" | grep "<a href=.*w64.*exe" | head -n 1 | getXMLAttrVal a href)"
      toggleXMLLintUse
      curl "${tesseractWinInstallerURL}" tesseractInstaller.exe
      chmod +x ./tesseractInstaller.exe
      ./tesseractInstaller.exe
      refreshEnvPath_Windows
      tesseractExe="$(findW -u tesseract)"
      popd
      [[ ! -z ${tesseractExe} ]] || { echo "tesseract install failed" | STDERR || return $?; }
    fi
  fi
}
function installDebian9 {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  local iRc
  if ! exec_command_exists wsl; then
    iRc=$(getCmdValue "wps -Command '(Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux).state'")
    if [[ "X${wlsStatus,,}" != "Xenabled" ]]; then
      wps -Command 'Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux'
      echo "${GREEN_COL}INFO:${RESET_COL} Please reboot after successful installation of ${YELLOW_COL}Microsoft-Windows-Subsystem-Linux${RESET_COL} and issue this command again."
      return
    fi
  fi
  wsl --update
  local DISTRO=Debian9
  wsl -l -v | tr -d '\0' | tail -n +2 | sed -r 's/^[^[:alnum:]]*//g' | cut -d ' ' -f1 | grep ${DISTRO} > /dev/null
  iRc=$?
  if [[ $iRc -eq 0 ]] && [[ "X${1,,}" = "X-f" ]]; then
    wsl -t ${DISTRO}
    wsl --unregister ${DISTRO}
    wsl -l -v | tr -d '\0' | tail -n +2 | sed -r 's/^[^[:alnum:]]*//g' | cut -d ' ' -f1 | grep Debian9 > /dev/null
    iRc=$?
  fi
  [[ $iRc -eq 0 ]] && echo "${RED_COL}ALERT:${RESET_COL} Debian 9 already installed" && return;
  echo "Downloading Debian 9 WSL image installer ${YELLOW_COL}${TEAM_SHARE_LOCATION}debian9installation.zip${RESET_COL}"
  connectVPN
  if ! isHostAlive ${TEAM_SHARE_SERVER}; then
    echo "${RED_COL}ALERT:${RESET_COL} Installer at ${YELLOW_COL}${TEAM_SHARE_LOCATION}debian9installation.zip${RESET_COL} not available !"
    return
  fi
  getbashrc -f
  if exec_command_exists wsl; then
    rm -rf $CAMP_AC_ROOT/../debian9installation
    wps -Command Expand-Archive -LiteralPath ${TEAM_SHARE_LOCATION}'debian9installation.zip' -DestinationPath "$(getPlatformPath $CAMP_AC_ROOT/..)"
    pushd $CAMP_AC_ROOT/../debian9installation
    mkdir ${DISTRO}
    wsl --import ${DISTRO} ${DISTRO} install.tar.gz
    echo "${GREEN_COL}INFO:${RESET_COL} Disconnecting VPN so that the new distro can update itself..since active VPN on this WSL2 host will not allow distro to reach internet"
    disconnectVPN
    wsl -d ${DISTRO} -- sudo apt-get -y update
    wsl -d ${DISTRO} -- sudo apt-get -y install openjdk-8-dbg net-tools tasksel man build-essential gdb devscripts libc6-dbg libc6
    echo "${GREEN_COL}INFO:${RESET_COL} Configure user $(whoami) ... "
    wsl -d ${DISTRO} -- sudo useradd -c "Administrator" -d /home/$(whoami) -g users -G sudo -s /bin/bash -m $(whoami)
    local path="$(ustyle $(native ~/.bashrc) | sed -r 's,^/cygdrive,/mnt,')"
    wsl -d ${DISTRO} -- mv /home/$(whoami)/.bashrc /home/$(whoami)/.bashrc.orig
    # wsl -d ${DISTRO} -- cp -p -f $path /home/$(whoami)
    wsl -d ${DISTRO} -- ln -s ${path} /home/$(whoami)/$(basename $path)
    wsl -d ${DISTRO} -- chown -h $(whoami):users /home/$(whoami)/$(basename $path)
    local cmd_file=/tmp/cmd.sh
    echo "echo \"$(whoami) ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers" > ${cmd_file}
    path="$(ustyle $(native /tmp/cmd.sh) | sed -r 's,^/cygdrive,/mnt,')"
    wsl -d ${DISTRO} -- cp -p -f $path ${cmd_file}
    wsl -d ${DISTRO} -- source ${cmd_file}
    echo "${GREEN_COL}INFO:${RESET_COL} Configure ${DISTRO}  ... "
    wsl -d ${DISTRO} -u $(whoami)
    echo "Debian 9 WSL setup is now complete. You can now use ${YELLOW_COL}wsl -d ${DISTRO} -u $(whoami)${RESET_COL} to login into the instance."
    popd
  fi
  gpupdate /force
  local restart_WSL_VM_Services_Cmd='Restart-Service vmms; Restart-Service vmcompute;'
  # Get-Service vm* | Where-Object { $_.Status -cne 'Running' }
  wps -Command "Start-Process $PWSHELL  -ArgumentList '-Command \"${restart_WSL_VM_Services_Cmd}\"' -Verb RunAs"
#  wps -Command "[Environment]::SetEnvironmentVariable('WSLENV', 'CAMP_AC_ROOT/pu', 'Machine')"
}
function installStandardCampaignPackages {
  [[ $# -gt 2 ]] || { echo "${YELLOW_COL}Usage${RESET_COL}: ${FUNCNAME[0]} instance1 [instance2] [...] -p nms:gdpr nms:midEmitter nms:midReceiver [...]" | STDERR || return $?; }
  function installPkgOnInst {
    echo installing "$2 package on instance $1"
    local pkg_path="$(native $(getCampRoot)/nl/datakit/${2/%:*/}/package/${2/#*:/}.xml)"
    nls package -instance:$1 -import:"${pkg_path}"
  }
  local args="$(echo "$@" | sed -r 's|\s+\-[pP]\s+|,|')"
  local instances="$(echo ${args} | cut -d ',' -f1)"
  local packages="$(echo ${args} | cut -d ',' -f2)"
  for i in $instances; do
    for p in $packages; do
      installPkgOnInst $i $p
      done
  done
  unset -f installPkgOnInst
}
function getValidCampaignURL {
    local url iRc=0
    if ! exec_command_exists rlwrap; then
      aptS install rlwrap
    fi
    if exec_command_exists rlwrap; then
      { awk -F'#' '{ print $1; }' /etc/hosts | awk -F'[\t ]{1,}' '{for(i=2;i<NF;++i) print "https://"$i;}'; awk -v name="trk|track|mid|inst|$1" -F'#' '$0 ~ name{ print $1; }' /etc/hosts | awk -F'[\t ]{1,}' '{for(i=2;i<NF;++i) print "https://"$i;}' ; } | sort -r | uniq > /tmp/midhosts
    fi
    while [ -z "${url}" ]; do
      echo "Provide $1 server URL (e.g [http[s]://]my-host-123.mydomain.com[:iPort])...Default Port 80:" | STDINFO
      if exec_command_exists rlwrap; then
        local prefix=$2
        [[ ! -z $2 ]] && prefix=$2-inst-
        url=$(rlwrap -S "Enter $1 URL: " -H /tmp/midhosts -P https://${prefix} -o cat)
      else
        read -p "Enter $1 URL: " url
      fi
      url=$(grep -E "^\s*(http://|https://|[[:alnum:]])[[:alnum:]][.[:alnum:]-]+[[:alnum:]](:([1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5]))?\s*$" <<< ${url})
      url="$(sed -r 's/^\s+//' <<< ${url} | sed -r 's/\s+$//')"  # trim spaces
      if [ -z "${url}" ]; then
        echo "Bad $1 URL ! " | STDERR
      fi
    done
    echo "${GREEN_COL}INFO:${RESET_COL}Using $1 URL: ${url}" | STDWARN
    local opipefailVal='+'
    [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
    set -o pipefail
    soap_rtest ${url} | STDINFO
    iRc=$?
    set ${opipefailVal}o pipefail
    if [[ $iRc -ne 0 ]]; then
      local l_host=$(echo $url | sed -r 's,^.*://,,' | sed -r 's,:.*,,')
      if isHostAlive $l_host ; then
        echo "${RED_COL}ALERT:${RESET_COL} $1 URL is alive but it seems ACC running on it is either down or not reachable." | STDWARN
      else
        echo "${RED_COL}ALERT:${RESET_COL} ${url} $1 server not reachable.You can use add2HostsFile to add this host to your hosts file." | STDERR || iRc=$(errno ETIMEDOUT | cut -d ' ' -f2)
        local attempt=3
        while [[ ${attempt} -ne 0 && $iRc -ne 0 ]]; do
          attempt=$[${attempt}-1]
          echo "Provide a network reachable alternate server hostname/IP for $l_host" | STDINFO
          local l_althost
          if exec_command_exists rlwrap; then
            sed -i -r 's,^.*://,,g' /tmp/midhosts
            l_althost=$(rlwrap -S "Enter alternate server hostname/IP: " -H /tmp/midhosts -o cat)
          else
            read -p "Enter alternate server hostname/IP: " l_althost
          fi
          local opipefailVal='+'
          [[ X$(set -o | grep pipefail | tr -s '[:blank:]' | cut -f2) = "Xon" ]] && opipefailVal='-'
          set -o pipefail
          isHostAlive ${l_althost} && add2HostsFile ${l_althost} $l_host {FUNCNAME[0]}
          soap_rtest ${url} | STDINFO
          iRc=$?
          set ${opipefailVal}o pipefail
        done
        [[ ${attempt} -eq 0 ]] && [[ $iRc -ne 0 ]] && echo "Too many bad attempts..." | STDERR
        [[ $iRc -ne 0 ]] && echo "${RED_COL}ALERT:${RESET_COL} ${url} $1 server not reachable." | STDERR
      fi
    fi
    echo ${url}
    return $iRc
}
function setupCampaignDevServer {
  if [ -z "$1" ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <instance_idenitifer1> <instance_idenitifer2> ... Instance identifiers could be JIRA/BUG ID or a branch name e.t.c."
    echo "if instance_idenitifer has ${YELLOW_COL}mid${RESET_COL} in its name it will create mid sourcing instance."
    echo "if instance_idenitifer has ${YELLOW_COL}mkt${RESET_COL} in its name it will create marketing instance and configure it to connect to user specified mid-sourcing server."
    echo "if instance_idenitifer has ${YELLOW_COL}trk/track${RESET_COL} in its name it will create configure tracking on the specific mid or mkt instance. Mid will have a a new tracking demaon running on it while mkt will have tracking enabled in delivery on it."
    echo "if instance_idenitifer has ${YELLOW_COL}sms/smpp/mob${RESET_COL} in its name it will create configure SMS delivery."
    echo "if instance_idenitifer has ${YELLOW_COL}prod${RESET_COL} in its name it use IMS prod config else it will use IMS stage."
    echo "It is advised to specify ${YELLOW_COL}mid${RESET_COL} before ${YELLOW_COL}mkt${RESET_COL} instance in command line arguments since mkt will need to have mid specified, which is up and running."
    return 1
  fi

  # Specify mid before mkt instance in command line arguments since mkt will always need to have mid specified, up and running"
  local posN=1
  for i in $@; do
    if [[ $i =~ ^.*[Mm][Kk][Tt].*$ ]]; then
      set -- "${@:1:posN-1}" "${@:posN+1}" "$i"
      posN=$[${posN}-1]
    fi
    posN=$[${posN}+1]
  done
  local multipleInstances
  if [[ ! -z $(getCampaignInstance) || $# -gt 1 ]]; then
    echo "${YELLOW_COL}You are about to create multiple campaign instances($(joinArray , $@ | sed 's|,|, |g')) on this machine. For each instance you will have its separate host name, the first label of which, should be instance name itself. This script will add all those hostnames to your hosts file and you will have to update the hosts file of client machine with those same entries separately in case client machine is not the same as this machine.${RESET_COL}"
    multipleInstances=1
  fi
  [[ -z $multipleInstances ]] || genSSLCerts 2 "*.$(hostname -d)"
  local l_dbHost l_dbport l_fqdn=$(hostname --fqdn)
  getDatabaseType
  [[ ! -z ${DBMS_TYPE} ]] || { echo "ALERT: Error fetching Database connection info" | STDERR || return $?; }
  [[ ! -z ${PGPORT} ]] && l_dbport=":${PGPORT}"
  [[ $DB_SERVER =~ ([^:]+)[:]?(.*) ]] && l_dbHost=${BASH_REMATCH[1]//[[:space:]]/}
  if [ "X${l_dbHost}" = "X${l_fqdn}"  ]; then
    isCygwin || { echo "PostgreSQL server on WSL distro is not supported as yet on $(getOS).. Specify server as value of env variable DB_SERVER in ~/.before.sh" | STDERR || return $?; }
    if [ "X${DBMS_TYPE}" = X"PostgreSQL" ]; then
      pushd $(cygpath -u "${USERPROFILE}") > /dev/null 2>&1
      local get_postgres_Info_Cmd="-Command (Get-Process postgres* | Select-Object -Index 0 | Select-Object -ExpandProperty Path | Out-File -encoding ASCII \$env:TEMP\camp-postgres.tmp)"
      wps -Command "Start-Process ${PWSHELL}  -ArgumentList \"${get_postgres_Info_Cmd}\" -Wait -Verb RunAs"
      local postgresExePath=$(getCmdValue "cat ${TEMP}/camp-postgres.tmp")
      rm -rf ${TEMP}/camp-postgres.tmp
      popd > /dev/null 2>&1
      if [ ! -z "${postgresExePath}" ]; then
        postgresExePath=$(echo ${postgresExePath} | sed 's/\\/\\\\/g')
        postgresExePath=$(cygpath -u "${postgresExePath}")
      fi
      if [ -z "${postgresExePath}" ] || [ ! -f "${postgresExePath}" ]; then
        echo "${RED_COL}ALERT:${RESET_COL} PostgreSQL server not found to be running/installed. Please install and/or ensure that the service is started."
        return 3
      fi
      if [ $? -ne 0 ]; then
        echo "Please open ${OSTYPE} again after ensuring PostgreSQL(and psql client) is installed and available in PATH."
        readEx "Press Ctrl+C to abort or any other key to exit this session.Closing terminal in " 10 " seconds..."; exit
      fi
      readEx "${RED_COL}ALERT:${RESET_COL} You are about to create a campaign instance(s) ($(joinArray , $@ | sed 's|,|, |g')). Continue in " 5 " seconds"
      if [[ $? -eq 0 ]]; then
        local yn
        read -p "Do you want to continue? ([y]/n)" yn
        yn=${yn:0:1}
        if [ "X${yn,,}" = "Xn" ] ;  then
          return 4
        fi
      else
        echo ""
      fi
      stopCampaign
      local postgresInstallRoot="$(dirname "$(dirname "${postgresExePath}")")"
      local postgresCfgPath="${postgresInstallRoot}/data/pg_hba.conf"
      local method=$(cat "$postgresCfgPath" | grep -v -E "#.*" | grep -v -E "^\s*$" | tr -s '[:blank:]' | rev | awk '{print $1}' | rev | head -n 1)
      [[ $method =~ [^-_[:alnum:]]+ ]] && unset method
      method=${method:=md5}
      grep -E "^host\s+all\s+all\s+0.0.0.0/0\s+${method}" "$postgresCfgPath"
      if [ $? -ne 0 ]; then
        sed -r -i  's/^\s*host/\#host/g' "$postgresCfgPath"
        echo "host    all             all             0.0.0.0/0    ${method}" >> "$postgresCfgPath"
        echo "host    all             all             0::/0        ${method}" >> "$postgresCfgPath"
      fi
      local majVer
      [[ "X${DBMS_TYPE}" = X"PostgreSQL" ]] && majVer=${DBMS_VERSION%%,*} && majVer=${majVer#* } && majVer=${majVer%%.*}
      postgresCfgPath="${postgresInstallRoot}/data/postgresql.conf"
      cat "${postgresCfgPath}" | grep -E "^[#[:space:]]*shared_preload_libraries" || echo "shared_preload_libraries = ''" >> "${postgresCfgPath}"
      local val_shared_preload_libraries=$({ cat "${postgresCfgPath}" | grep -E "^[#[:space:]]*shared_preload_libraries" | grep -E -v "\s*#{1}\s*[[:alnum:]]" | sed -r "s,^[^=]+=\s*'([^']*)'.*$,\1,g" | sed -r 's:,:\n:g'; [[ $majVer -ge 10 ]] && echo auto_explain; echo pg_stat_statements; } | sort | uniq | xargs | sed 's: :,:g')
      [[ ! -z ${val_shared_preload_libraries} ]] && sed -i -r "s|^[#[:space:]]*shared_preload_libraries\s*=\s*'(.*)'|shared_preload_libraries = '${val_shared_preload_libraries}'|g" "${postgresCfgPath}"
      if [[ $majVer -ge 14 ]]; then
        cat "${postgresCfgPath}" | grep -E "^[#[:space:]]*compute_query_id[[:space:]]*="
        if [ $? -eq 0 ]; then
          sed -i -r 's,^[#[:space:]]*compute_query_id.*,compute_query_id = on,g' "${postgresCfgPath}"
        else
          echo "compute_query_id = on" >> "${postgresCfgPath}"
        fi
      fi
      pgsql -c "CREATE EXTENSION IF NOT EXISTS pg_stat_statements" template1
      # pgsql -c "SELECT total_time, min_time, max_time, mean_time, calls, rows, query FROM pg_stat_statements ORDER BY mean_time DESC LIMIT 5"
      # GetDate function does not exist in postgres.Create a alias in template1 so that whenever a new db is created,
      # this function automatically gets populate in that new db.
      pgsql -c "SELECT 'GetDate'::regproc" template1
      [[ $? -ne 0 ]] && echo "Registering custom 'GetDate'" && echo $(pgsql -d template1 -c "CREATE OR REPLACE FUNCTION public.GetDate() returns timestamptz stable language sql as 'select now()'; select GetDate();")
      pgsql -c "SELECT 'IsNumeric'::regproc" template1
      [[ $? -ne 0 ]] && echo "Registering custom 'IsNumeric'" && echo $(pgsql -t -d template1 -c "CREATE OR REPLACE FUNCTION IsNumeric(text) RETURNS BOOLEAN AS \\$\\$
        DECLARE x NUMERIC;
        BEGIN
          x = \\\$1::NUMERIC;
          RETURN TRUE;
        EXCEPTION WHEN others THEN
          RETURN FALSE;
        END;
        \\$\\$
      STRICT
      LANGUAGE plpgsql IMMUTABLE;  select 'isNumeric called on ''-123'' returned '|| IsNumeric('-123'), 'isNumeric called on ''abc'' returned '||IsNumeric('abc');")
      local restart_postgres_Cmd="Get-Service -Name postgres* | Where-Object { \$_.Status -eq 'Running' } | Restart-Service"
      wps -Command "${restart_postgres_Cmd}"
    fi
  fi
  [[ $? -ne 0 ]] && return $?
  pushd "${NL_DBG_BIN_DIR}" > /dev/null
  local idx=$(getCampaignInstance 10 | wc -l)
  idx=$[$idx+1]
  local id
  for id in "$@"; do
    [[ $idx -gt 1 ]] && multipleInstances=1
    local CAMP_INST_NAME=$(echo ${id}-inst | tr [A-Z] [a-z] | sed 's/[^a-z0-9\-]/-/g')
    local CAMP_DB_NAME=$(echo c_$(whoami | sed -r 's,(.{8}).*,\1,g')_$(date '+%d%m')_${id}_db | tr [A-Z] [a-z] | sed 's/[^a-z0-9_]/_/g')
    local additionalPkgs=${ADDITIONAL_CAMP_PKGS:=""}
    [[ -n ${additionalPkgs} ]] && [[ "X${additionalPkgs:0:1}" != "X," ]] && additionalPkgs=",${additionalPkgs}"
    local midURL trkURL trk_inst
    if [ ! -z $(echo ${id} | grep -i "sms\|smpp\|mob") ]; then
      additionalPkgs="${additionalPkgs},nms:mobile"
    fi
    if [ ! -z $(echo ${id} | grep -i ffda) ]; then
      if [[ "X${DBMS_TYPE}" = X"PostgreSQL" ]] && [[ -z $(csql -V | grep -v -i client | grep "1[0-9]\.") ]]; then
        echo "PostgreSQL not available. FFDA requires PostgreSQL server version >= 10" | STDERR
        echo "You can install your own PostgreSQL server via command: ${YELLOW_COL}wcinstall PostgreSQL 12${RESET_COL}"
        return 5
      fi
      additionalPkgs="${additionalPkgs},xxl:fullfdaCommon,nms:snowflake"
      if [ ! -z $(echo ${id} | grep -i mid) ]; then
        additionalPkgs="${additionalPkgs},xxl:fullfdaMid"
      else
        additionalPkgs="${additionalPkgs},xxl:fullfdaMkt"
      fi
    fi
    if [ ! -z $(echo ${id} | grep -i mid) ]; then
      additionalPkgs="${additionalPkgs},nms:midReceiver,nms:federatedDataAccess"
    fi
    if [ ! -z $(echo ${id} | grep -i mkt) ]; then
      additionalPkgs="${additionalPkgs},nms:midEmitter,nms:federatedDataAccess"
      echo "${GREEN_COL}INFO:${RESET_COL}This mkt server can route deliveries via mid-sourcing server."
      if [[ $(nls pdump | grep @d | wc -l) -eq 0 &&  -n $(getCampaignInstance) ]]; then
        nls web &
        apache start
      fi
      midURL=$(getValidCampaignURL mid)
      wps -Command "Set-Clipboard -Value '${midURL##*//}'" && echo "${GREEN_COL}INFO:${RESET_COL} ${YELLOW_COL}${midURL##*//}${RESET_COL} copied to your clipboard ..."
      [[ ! -z $(echo ${id} | grep -i mkt | grep -i "trk\|track") ]] && trkURL=$(getValidCampaignURL tracking trk)
      if [[ ! -z ${trkURL} ]]; then
        trk_inst=$(soap_rtest ${trkURL} 2>/dev/null | getXMLAttrVal redir instance)
        trk_inst=${trk_inst:=${CAMP_INST_NAME}}
      fi
      stopCampaign
    fi
    if [ -f "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" ]; then
      # Set password field to empty.
      updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/serverConf.xml xtk internalPassword ""
    fi
    nls config -internalpassword:/${DEFAULT_PASSWORD}
    if [ -e "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" ]; then
      mv -f  "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" $(getBackupLocation config-${CAMP_INST_NAME} xml)
    fi
    export PWD_HASH=$(getXMLAttrVal xtk internalPassword "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml")
    echo "${YELLOW_COL}$PWD_HASH${RESET_COL}"
    echo "${GREEN_COL}INFO:${RESET_COL}   Deleting db ${YELLOW_COL}${CAMP_DB_NAME}${RESET_COL} on database server ${YELLOW_COL}${DB_SERVER}${RESET_COL}..."
    if [[ ${DBMS_TYPE} = "MSSQL" ]]; then
      local show_all_options_sql="exec sp_configure; exec sp_configure 'show advanced options' , 1 ; exec sp_configure 'user options' , 1 ; exec sp_configure 'user connections' , 1 ;exec sp_configure 'remote admin connections' , 1 ; exec sp_configure 'remote access' , 1 ; RECONFIGURE;"
      csql -c "${show_all_options_sql}" > /dev/null
      csql -c "RECONFIGURE"
      local enable_xp_cmd_shell_sql="exec sp_configure; exec sp_configure 'xp_cmdshell' , 1 ; RECONFIGURE;"
      csql -c "${enable_xp_cmd_shell_sql}" > /dev/null
      csql -c "RECONFIGURE"
      local mssql_go2_single_user_mode_sql="USE [master]; ALTER DATABASE [${CAMP_DB_NAME}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; ALTER DATABASE [${CAMP_DB_NAME}] SET OFFLINE; USE [master];"
      local mssql_go2_single_user_mode_sql2="USE [master]; ALTER DATABASE [${CAMP_DB_NAME}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; USE [master];"
      csql -c "${mssql_go2_single_user_mode_sql2}"
      csql -d master -c "DROP DATABASE IF EXISTS ${CAMP_DB_NAME}" || { errno EADDRINUSE | cut -d ' ' -f3- | STDERR; readEx "Press any key to continue... " 5; }
      echo "xp_cmdshell 'del \"C:\\Program Files\\Microsoft SQL Server\\MSSQL15.MSSQLSERVER\\MSSQL\\DATA\\${CAMP_DB_NAME}*.*\"'" > /tmp/del_db_file.sql
#      csql -d master -i "$(native /tmp/del_db_file.sql)"
      rm -f /tmp/del_db_file.sql
    else
      csql -d postgres -c "DROP DATABASE IF EXISTS ${CAMP_DB_NAME}" || { errno EADDRINUSE | cut -d ' ' -f3- | STDERR; readEx "Press any key to continue... " 5; }
    fi
    local webArgs="$(getXMLAttrVal web args $(getCampRoot)/nl/build/ncs/conf/config-default.xml)"
    # Add wdbc flag to tracefilter
    tracefilterArgs=$(echo $webArgs | grep tracefilter | sed -r "s/^.*-tracefilter:([^[:space:]]+).*/\1/g")
    if [ -z "${tracefilterArgs}" ]; then
      webArgs=" -tracefilter:wdbc "${webArgs}
    elif [[ ! $tracefilterArgs =~ ^.*wdbc.*$ ]]; then
      tracefilterArgs=${tracefilterArgs},wdbc
      tracefilterArgs=$(echo ${tracefilterArgs} | sed -r "s/^([^\*\![:alnum:]]+)//g")
      webArgs=$(echo "${webArgs}" | sed -r "s/-tracefilter:[^[:space:]]+/-tracefilter:${tracefilterArgs}/g")
    fi
    if [ -z "$(echo ${webArgs} | grep -i verbose)" ]; then
      webArgs=" -verbose "${webArgs}
    fi
    updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/config-default.xml web args "${webArgs}"
    nls config -addinstance:${CAMP_INST_NAME}/*/${CAMP_LANG}
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" dnsConfig localDomain "${ADOBE_CORP_DOMAIN}"

    local allowedRelayURL='<url IPMask="" deny="" hostMask="" httpAllowed="true" relayHost="true" relayPath="true"
           status="normal" targetUrl="http://localhost:8080" timeout="" urlPath="/xtk/*.jssp"/>'
    grep 'urlPath="/xtk/\*.jssp"' "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml"
    [[ $? -eq 0 ]] || sed -i -e '/\/xtk\/jsp\/zoneinfo\.jsp/a\' -e "      $(echo ${allowedRelayURL} | sed 's,\",\\",g')" "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml"

    local adb_smtpUser="$(whoami)@${ADOBE_DOMAIN}"
    if [ ! -z $(echo ${id} | grep -i "momentum") ]; then
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" relay address "momentum-dev.${ADOBE_CORP_DOMAIN}"
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" relay port 25
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" mta useMomentum true
    else
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" relay address "authrelay.${ADOBE_CORP_DOMAIN}"
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" relay port 587
      # updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" relay address "inner-relay-1.${ADOBE_CORP_DOMAIN}"
      local base64_encoded_rlyuser_name_and_password;
      adb_smtpUser="rlycin@${ADOBE_DOMAIN}"
      if [[ -z ${SECRET_PASSWORD+x} ]]; then
        base64_encoded_rlyuser_name_and_password="AHJseWNpbkBhZG9iZS5jb20AI25scGFzcyNubHBhc3MjbmxwYXNz";
      else
        base64_encoded_rlyuser_name_and_password=$(echo -ne "\0${adb_smtpUser}\0${SECRET_PASSWORD}${SECRET_PASSWORD}${SECRET_PASSWORD}" | base64)
      fi
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" IP authentication "${base64_encoded_rlyuser_name_and_password}"
    fi
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" inMail popTimeoutSec 30
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" inMail reloadPeriodSec 60
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" inMail autoStart false
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" mta statServerAddress ${l_fqdn}:$[$idx+7777]
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" smtp enableTLS true
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" IP heloHost ${l_fqdn}
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" IP address 0.0.0.0
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" IP publicId 1
    updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" IP weight 1
    if [ ! -z $(echo ${id} | grep -i "sms\|smpp\|mob") ]; then
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" sms timeout 30
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" sms pollPeriod 30
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" sms reloadPeriodSec 60
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" sms srReadDelay 60
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" sms autoStart true
      updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" sms args " -verbose -tracefilter:wdbc"
    fi
    # Ref C:\campaign\ac\nl\build\serverconf\serverconfinfo.h for provider types.
    if   [[ "X${DBMS_TYPE}" = X"PostgreSQL" ]]; then
      nls config -instance:${CAMP_INST_NAME} -createdb -admincnx:[postgres/${PGPASSWORD}] -cnx:[PostgreSQL:postgres:${CAMP_DB_NAME}/${PGPASSWORD}@${l_dbHost}${l_dbport},timezone='Asia/Kolkata',unicodeData=true,usetimestamptz=true] -packages:[nms:core,nms:campaign,nms:macIntegration,nms:aamIntegration${additionalPkgs}] -internalpwd:${PGPASSWORD}
    elif [[ "X${DBMS_TYPE}" = X"MSSQL" ]]; then
      local option="-createuser"
      csql -u postgres -d master -V
      [[ $? -eq 0 ]] && option=''
      nls config -instance:${CAMP_INST_NAME} ${option} -createdb -admincnx:[sa/${PGPASSWORD}] -cnx:[MSSQL:postgres:${CAMP_DB_NAME}/${PGPASSWORD}@${l_dbHost}${l_dbport},timezone='Asia/Kolkata',unicodeData=true,usetimestamptz=true] -packages:[nms:core,nms:campaign,nms:macIntegration,nms:aamIntegration${additionalPkgs}] -internalpwd:${PGPASSWORD}
    else
      echo "Database Type: <${DBMS_TYPE}> is not supported as yet" | STDERR || return $?
    fi
    # -packages:[nms:core,nms:campaign,nms:mobile,nms:mobileApp,nms:paper,nms:macIntegration,nms:aamIntegration]
    stopCampaign
    setXtkOption NmsServer_URL https://$(hostname --fqdn) ${CAMP_INST_NAME}
    setXtkOption NmsServer_IntranetURL https://$(hostname --fqdn) ${CAMP_INST_NAME}
    setXtkOption NmsServer_MirrorPageUrl https://$(hostname --fqdn) ${CAMP_INST_NAME}
    setXtkOption XtkWebForm_ServersURLs https://$(hostname --fqdn) ${CAMP_INST_NAME}
    local userFullName="$(getUserInfo -fullname)"
    local xtkOptID=21370
    csql -d $CAMP_DB_NAME -user postgres -c "UPDATE xtkoperator SET spassword='$PWD_HASH' WHERE sname='admin' and itype=0"
    if [[ ! -z ${trkURL} ]]; then
        readEx "${GREEN_COL}INFO:${RESET_COL} Configure tracking with trkURL: ${YELLOW_COL}${trkURL}${RESET_COL} and trk_inst: ${YELLOW_COL}${trk_inst}${RESET_COL} ... " 5 " seconds"
    #    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsTracking_ServerUrlList', 'IN',6,0,21384,now(),now(),now())"
        csql -d $CAMP_DB_NAME -c "delete from xtkoption where sname='NmsTracking_ExtAccountLabel'"
        csql -d $CAMP_DB_NAME -c "delete from xtkoption where sname='NmsTracking_ExtAccount'"
        csql -d $CAMP_DB_NAME -c "delete from xtkoption where sname='NmsTracking_Available'"
        csql -d $CAMP_DB_NAME -c "delete from xtkoption where sname='NmsTracking_SecureServerUrl'"
        csql -d $CAMP_DB_NAME -c "delete from xtkoption where sname='NmsTracking_ServerUrl'"
        csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsTracking_ExtAccount',           'defaultEmailMid',       6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
        csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsTracking_Available',            '1',                     3,1,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
        csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsTracking_SecureServerUrl',      'https://${trkURL#*://}',6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
        csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsTracking_ServerUrl',            'http://${trkURL#*://}', 6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
        csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsTracking_Password',             '',                      6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
        csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsTracking_Instance',             '${trk_inst}',           6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    fi
    csql -d $CAMP_DB_NAME -c "delete from xtkoption where sname='NmsDelivery_ImagePublishing'"
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsDelivery_ImagePublishing',      'tracking',              6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsLocal',                         'IN',                    6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsLocal_Label',                   'India',                 6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsEmail_ReplyToName',             '${userFullName}',       6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsEmail_FromName',                '${userFullName}',       6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsEmail_DefaultErrorAddr',        '${adb_smtpUser}',       6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsEmail_DefaultFromAddr',         '${adb_smtpUser}',       6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('NmsEmail_DefaultReplyToAddr',      '${adb_smtpUser}',       6,0,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]

    echo "${GREEN_COL}INFO:${RESET_COL}   Setting up db for dev env access..."
    csql -d $CAMP_DB_NAME -c "delete from xtkoption where sname ='XtkExport_IncludeDefaultValues'"
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('XtkExport_IncludeDefaultValues',   '1',                     3,1,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "delete from xtkoption where sname ='XtkSecurity_Unsafe_DecryptString'"
    csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values ('XtkSecurity_Unsafe_DecryptString', '1',                     3,1,${xtkOptID},now(),now(),now())"  && xtkOptID=$[$xtkOptID+1]
    csql -d $CAMP_DB_NAME -c "create extension IF NOT EXISTS pgcrypto"

    if ! isCygwin; then
      echo "Configuring campaign instance ${CAMP_INST_NAME} for new relic support."
      local nrLicenseKey nrLicenseKey2
      local encrypted_nrLicenseKey='raP+lvG04GcxKsjxkSNOm2+FKSdmHU0TghlRC+qU7gBfto/v3tH5jhfXXPZAVud8' # d0...e5 for Account: 1716029 - DX_Campaign_Engineering
      local encrypted_nrLicenseKey2='3U+3WWtYNiAM2RZT4ot4Ho0roJXwjZwVWK3ArOohUWNXV+wTF1Y7yQn7iFNvhGfq' # 8b...f5 for Account: 1189422 - DMA_Campaign_Dev
      if [ -z ${SECRET_PASSWORD+x} ]; then
        nrLicenseKey=$(echo ${encrypted_nrLicenseKey} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt)
        [[ $? -eq 0 ]] || { echo "Bad decryption key" | STDERR; }
        nrLicenseKey2=$(echo ${encrypted_nrLicenseKey2} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt)
      else
        nrLicenseKey=$(echo ${encrypted_nrLicenseKey} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${SECRET_PASSWORD})
        [[ $? -eq 0 ]] || { echo "Bad decryption key" | STDERR; }
        nrLicenseKey2=$(echo ${encrypted_nrLicenseKey2} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${SECRET_PASSWORD})
      fi
      [[ $? -eq 0 ]] || { echo "Bad decryption key" | STDERR; }
      nrLicenseKey=${nrLicenseKey:=${nrLicenseKey2}}
      export NEWRELIC_LIC_KEY=${NEWRELIC_LIC_KEY:=${nrLicenseKey}}
      [[ ${nrLicenseKey:0:2} = 'de' && ${nrLicenseKey: -2} = 'e5' ]] && echo "${GREEN_COL}INFO:${RESET_COL} Using key # d0...e5 for New Relic 'Account: 1716029 - DX_Campaign_Engineering'"
      [[ ${nrLicenseKey:0:2} = '8b' && ${nrLicenseKey: -2} = 'f5' ]] && echo "${GREEN_COL}INFO:${RESET_COL} Using key # 8b...f5 for New Relic 'Account: 1189422 - DMA_Campaign_Dev'"
      nls config -instance:${CAMP_INST_NAME} -newrelicaccount:${NEWRELIC_LIC_KEY}/ACC_${BUILD_NUMBER}_${CAMP_DB_NAME}
    fi

    echo "${GREEN_COL}INFO:${RESET_COL}   Creating sample recipients..."
    pushd ~ > /dev/null
    getCreateRecipientsSQL $CAMP_DB_NAME > ~/createRecipients.sql
    csql -d $CAMP_DB_NAME -f ./createRecipients.sql
    rm -f ~/createRecipients.sql
    popd > /dev/null
    startCampaign
    pushd "${NL_DBG_BIN_DIR}" > /dev/null
    getChangePasswordJS > $TEMP/changePassword.js
    nls javascript -instance:$CAMP_INST_NAME -file "$(getPlatformPath $TEMP)changePassword.js"
    rm -f $TEMP/changePassword.js
    getUpdateIMSAccountJS $CAMP_INST_NAME > $TEMP/configureIMS.js
    nls javascript -instance:$CAMP_INST_NAME -file "$(getPlatformPath $TEMP)configureIMS.js"
    rm -f $TEMP/configureIMS.js
    if [ ! -z $(echo ${id} | grep -i "sms\|smpp\|mob") ]; then
      getUpdateSMPPConnectorJS > $TEMP/configure_SMPP_SMS.js
      nls javascript -instance:$CAMP_INST_NAME -file "$(getPlatformPath $TEMP)configure_SMPP_SMS.js"
      rm -f $TEMP/configure_SMPP_SMS.js
    fi
    if [ ! -z $(echo ${id} | grep -i mid) ]; then
      getChangePasswordJS mid > $TEMP/changePassword.js
      nls javascript -instance:$CAMP_INST_NAME -file "$(getPlatformPath $TEMP)changePassword.js"
      rm -f $TEMP/changePassword.js
    fi
    if [ ! -z $(echo ${id} | grep -i mkt) ]; then
      getUpdateMidConnectionJS "${midURL}" > $TEMP/updateMid.js
      nls javascript -instance:$CAMP_INST_NAME -file "$(getPlatformPath $TEMP)updateMid.js"
      rm -f $TEMP/updateMid.js
    fi
    popd > /dev/null
    [[ $idx -eq 1 ]] && updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" dataStore hosts "${l_fqdn%%.*}\*"
    if [[ ! -z $multipleInstances ]]; then
      echo "Making changes for multiple instances ..."
      add2HostsFile $l_fqdn $(getIP) ${FUNCNAME[0]}
      unset SOAP_HOST
      if [[ $idx -gt 1 ]]; then
        add2HostsFile $l_fqdn ${CAMP_INST_NAME}.${l_fqdn#*.}
        updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${CAMP_INST_NAME}.xml" dataStore hosts "${CAMP_INST_NAME}\*"
        export SOAP_HOST=${CAMP_INST_NAME}.${l_fqdn#*.}
      fi
    fi
    [[ ! -z $(echo ${id} | grep -i mid | grep -i "trk\|track") ]] && multipleInstances=1
    restartCampaign
    readEx "Waiting for nlserver to come up ... " 5
    soapLogOnAPI
    echo "${GREEN_COL}INFO:${RESET_COL} Instance ${YELLOW_COL}${BOLD}${CAMP_INST_NAME}${RESET_COL} is hosted on Url : ${YELLOW_COL}${SOAP_HOST}${RESET_COL}"
    local ROUTING_MID_EXTACC_INTERNALNAME=defaultEmailMid
    local queryDef="<queryDef operation='select' schema='nms:extAccount' xtkschema='xtk:queryDef'> \
    <select> \
      <node expr='@id'/> \
      <node expr='@label'/> \
    </select> \
    <where> \
      <condition expr='@name = \"${ROUTING_MID_EXTACC_INTERNALNAME}\"'/> \
    </where> \
  </queryDef>"
  trk_inst=${trk_inst:=$(for i in $(getCampaignInstance 10); do [[ -z "$(xmllint --xpath '//serverconf/web/redirection/@databaseId' $(getCampRoot)/nl/build/ncs/conf/config-${i}.xml | cut -f2 -d\")" ]] || echo $i; done | sort | tail -n 1)}
  trk_inst="$(trim ${trk_inst})"
    [[ ! -z $(echo ${id} | grep -i mid | grep -i "trk\|track") ]] && { [[ -z ${trk_inst} ]] || trk_inst=${trk_inst}-${idx}; soapCreateTrackingInstanceShellAPI ${trk_inst} && idx=$[${idx}+1]; [[ $? -eq 0 ]] || readEx "Mid Configuring Tracking failed.Press any key to continue ... " 5; }
    if [[ ! -z $(echo ${id} | grep -i mkt | grep -i "trk\|track") ]] && [[ ! -z ${trkURL} ]] && [[ ! -z ${trk_inst} ]]; then
      local mid_account_label="$(soapExecuteQueryAPI "${queryDef}" | getXMLAttrVal extAccount label)"
      echo "Tracking configured via routing account ${YELLOW_COL}${mid_account_label}${RESET_COL}"
      csql -d $CAMP_DB_NAME -c "insert into xtkoption(sname,sstringvalue,idatatype,ilongvalue, ioptionid,tscreated,tslastmodified,tstimestampvalue) values('NmsTracking_ExtAccountLabel', '${mid_account_label}',6,0,${xtkOptID},now(),now(),now())" && xtkOptID=$[$xtkOptID+1]
      iRc=$?
      if [[ $(host2IPv4 $(hostname --fqdn)) = $(host2IPv4 ${trkURL#*://}) ]]; then
        echo "Clearing database indentified from config file for locally running tracking instance..."
        updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${trk_inst}.xml" redirection databaseId ''
        soapLogOutAPI
        nls config -reload
        soapLogOnAPI
      else
        echo "${GREEN_COL}INFO:${RESET_COL} Clear/Empty ${YELLOW_COL}databaseId${RESET_COL} attribute of ${YELLOW_COL}<redirection>${RESET_COL} tag inside ${YELLOW_COL}<web>${RESET_COL} tag in the config file of tracking instance ${YELLOW_COL}${trk_inst}${RESET_COL} of the remote tracking server ${YELLOW_COL}${trkURL}${RESET_COL} and reload the config on that remote server."
        readEx "Press spacebar to pause. Waiting for you to complete above step in " 5 " seconds "
      fi
      [[ $iRc -eq 0 ]] && soapCreateTrackingInstanceAPI http://${trkURL#*://} https://${trkURL#*://} ${trk_inst} && iRc=$?
      [[ $iRc -eq 0 ]] && soapRegisterExternalInstanceAPI ${trk_inst} && iRc=$?
      [[ $iRc -eq 0 ]] || readEx "Mkt Configuring Tracking failed.Press any key to continue ... " 5
    fi

    idx=$[${idx}+1]
    stopCampaign
  done
  if [[ ! -z $multipleInstances ]]; then
    genSSLCerts 2 "*.$(hostname -d)"
    soapLogOutAPI
  fi
  popd > /dev/null 2>&1
}
function startCampaign {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | -u(perform force postupgrade) | -b(launch acc in background window) -f(do not check if campaign is already running)]" && return
  pushd ${NL_DBG_BIN_DIR} > /dev/null
  ps | grep $(which nlserver)
  if [ $? -eq 0 ]  && ! _CONTAINS -f "$@" ; then
    echo "Campaign nlserver already running in one of the open cygwin terms. Close that campaign first via ${BOLD}stopCampaign." | STDERR
    popd > /dev/null
    return
  fi
  popd > /dev/null 2>&1
  [[ ! -z $(getCampaignInstance) ]] || { echo "No campaign instance found" | STDERR; return $?; }
  2conf
  local smtpRelayServer=$(cat *.xml | xmlize |getXMLAttrVal relay address)
  local smtpRelayPort=$(cat *.xml | xmlize |getXMLAttrVal relay port)
  popd > /dev/null 2>&1
  [[ -z $smtpRelayPort ]] || [[ -z $smtpRelayServer ]] || ! isPortListening $smtpRelayPort $smtpRelayServer && { echo "Mailserver not configured. There may be issues sending deliveries." | STDERR; }
  [[ ! -z $(getCampaignInstance) ]] || { echo "No campaign instance found" | STDERR; return $?; }
  [[ ! -z $(getCampInstances | xargs) ]] || { echo "No database associated with campaign instance $(getCampaignInstance).Will launch only web module" | STDWARN; ( nls web & ); return 0; }
  isHostAlive ${DB_SERVER} || { getDatabaseType; echo "ALERT: Error fetching Database connection info from ${YELLOW_COL}${DB_SERVER}${RESET_COL}" | STDERR || return $?; }
  if _CONTAINS -u "$@" ; then
    for inst in $(getCampInstances); do
      nls config -postupgrade -instance:${inst} -force
    done
  fi
  if _CONTAINS -b "$@" ; then
    local nlCmd="${FUNCNAME[0]} $@"
    echo "Invoking ${YELLOW_COL}nlserver${RESET_COL} via ${YELLOW_COL}'""${nlCmd}""'${RESET_COL} in a separate console window."
    cacheEnvVar -f EXEC_RUN_ONCE_LAST ${FUNCNAME[0]}
    openTerm &
    return
  fi
  local iRc=0
  _CONTAINS -na "$@" || { apache status > /dev/null; iRc=$?; }
  isCygwin || [[ ${iRc} -eq 0 ]] || [[ -z ${USERPATH} ]] || { sudo rm -f ${USERPATH}/.shm*;
  [[ 0 -ne $(expr $(sudo find /root/.appdata -iname '.shm*' 2> /dev/null | wc -l) + $(sudo find /.appdata -iname '.shm*' 2> /dev/null | wc -l)
) ]] && echo "ALERT: Shared mem lock files found in multiple places can cause tracking issues." | STDERR; }
  local watchdogOptions=()
  if [[ $# -gt 0 ]]; then
    local optionList="$(nlserver watchdog -h | grep -E '^-[[:alnum:]]+' | awk '{print $1;}' | xargs)"
    for o in $@; do
      _CONTAINS ${o} ${optionList} && watchdogOptions+=("$o")
    done
  fi
  nls watchdog ${watchdogOptions[@]}
  if [ $iRc -ne 0 ]; then
    local apache_conf_file=${APACHE_ROOT}/apache2.conf
    isCygwin && apache_conf_file="$(ustyle ${APACHE_ROOT})conf/httpd.conf"
    if [[ $BUILD_NUMBER -ge 9519 ]]; then
      sed -r -i 's,^(\s+Alias /nl/lib\s+).*,\1\"\${CampaignRoot}/nl/build/ncs/web/lib\",g' "${apache_conf_file}"
    else
      sed -r -i 's,^(\s+Alias /nl/lib\s+).*,\1\"\${CampaignRoot}/thirdparty/web\",g' "${apache_conf_file}"
    fi
    echo "Starting Apache $(apache -v)"
    if isCygwin; then
      if [ $(getCmdValue "wps  -Command '(Get-Service W3SVC* | measure).Count'") -ne 0 ]; then
        echo "Turning off Windows IIS Web service...Apache to be used instead."
        local stop_IIS_Web_Service_Cmd="-Command Stop-Service W3SVC"
        wps -Command "Start-Process $PWSHELL  -ArgumentList \"${stop_IIS_Web_Service_Cmd}\" -WindowStyle hidden -Verb RunAs"
        local disable_IIS_Web_Service_Cmd="-Command Set-Service W3SVC -StartupType Disabled"
        wps -Command "Start-Process $PWSHELL  -ArgumentList \"${disable_IIS_Web_Service_Cmd}\" -WindowStyle hidden -Verb RunAs"
      fi
      apache start
    else
      apache start
    fi
    apache status
  else
    echo "${GREEN_COL}INFO:${RESET_COL} Apache already active..."
  fi
  if ! isCygwin && exec_command_exists newrelic-daemon ; then
    ps --ef  | grep -i newrelic-daemon | grep -v grep > /dev/null
    [[ $? -eq 0 ]] || newrelic-daemon
  fi
  { (( nlpdump | tee >( tail -n +2 | LC_ALL=C sort | column -t -s ' ' >&3) | head -n 1) 3>&1) > /tmp/${FUNCNAME[0]}.tmp; mv -f /tmp/${FUNCNAME[0]}.tmp /tmp/nlpdump; } &
}
function restartCampaign {
  stopCampaign $@
  startCampaign $@
}
function cauterizeInstance {
   [[ $# -lt 1 || $# -gt 6 ]] && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | <camp-instance> <db-name> <db-user> [db-password($DEFAULT_PASSWORD)] [db-hostname(localhost)] [db-host-port(54321)]" && return 1
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | <camp-instance> <db-name> <db-user> [db-password($DEFAULT_PASSWORD)] [db-hostname(localhost)] [db-host-port(54321)]" && return
  local iRc=0 l_instance=$1
  getCampInstances | grep ${l_instance}
  [[ $? -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Specify a existing valid instance name" ; return 2; }
  local l_dbname=$2 l_dbUser=$3
  [[ -z ${l_dbname} || -z ${l_dbUser} ]] && { echo "${RED_COL}ALERT:${RESET_COL} Database host/user not specified"; return 3; }
  local l_dbPass=$4
  [[ -z $l_dbPass ]] && echo "No password for connecting to DB specified..Using ${YELLOW_COL}${DEFAULT_PASSWORD}${RESET_COL} as the default password" | STDWARN
  local l_dbhost=$5 tunnelPort=$6
  [[ -z $l_dbHost ]] && echo "No database hostname specified..Using ${YELLOW_COL}localhost${RESET_COL} as the default database host" | STDWARN
  [[ -z $tunnelPort ]] && echo "No Database port sepcified for database host..Using ${YELLOW_COL}54321${RESET_COL} as the default port" | STDWARN
  l_dbPass=${l_dbPass=$DEFAULT_PASSWORD}
  l_dbHost=${l_dbHost:=localhost}
  tunnelPort=${l_port:=54321}
  echo "Testing connection to database using command ..."
  echo "${YELLOW_COL}csql --dbname ${l_dbname} --host localhost --port ${tunnelPort} --username ${l_dbUser} --password ${l_dbPass} -c 'SELECT version();'${RESET_COL}"
  csql --dbname ${l_dbname} --host ${l_dbHost} --port ${tunnelPort} --username ${l_dbUser} --password ${l_dbPass} -c 'SELECT version();'
  iRc=$?
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Could not connect to database using given credentials..Exit"; return $iRc; }
  echo "${GREEN_COL}INFO:${RESET_COL} Connection to database Ok..."
  local backUpDir=$(getBackupLocation '')
  echo "${GREEN_COL}INFO:${RESET_COL} Back-up campaign config file(s) to ${backUpDir} folder."
  mkdir -p ${backUpDir}
  local cpCmd="$(which cp) -i -p -v "
  ${cpCmd} $(getCampRoot)/nl/build/ncs/conf/*.xml ${backUpDir}/
  echo "Updating instance config $(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml"
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" dataStore hosts "${l_dbHost}\*"
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" dbcnx login ${l_dbUser}:${l_dbname}
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" dbcnx encrypted 0
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" dbcnx password ${l_dbPass}
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" dbcnx provider PostgreSQL
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" dbcnx server ${l_dbHost}:${tunnelPort}
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" dbcnx maxRetries 4
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" mta autoStart false
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" stat autoStart false
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" wfserver autoStart false
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" inMail autoStart false
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" sms autoStart false
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/config-${l_instance}.xml" interactiond autoStart false
  echo "Updating instance config $(getCampRoot)/nl/build/ncs/conf/serverConf.xml"
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" pool maxCnx 150
  updateXMLAttr "$(getCampRoot)/nl/build/ncs/conf/serverConf.xml" pool maxIdleDelaySec 1200
  restartCampaign
  sleep 10
  pushd $(getCampRoot)/nl/datakit/nms/js
  nls javascript -instance:${l_instance} -arg:run -file freezeInstance.js
  popd > /dev/null 2>&1
  stopCampaign
  export DB_SERVER=${l_dbHost}:${tunnelPort}
  export PGHOST=${l_dbHost}
  export PGPORT=${tunnelPort}
  export PGDATABASE=${l_dbname}
  export PGUSER=${l_dbUser}
  csql -V
}

function debug {
  if [[ $# -eq 0 ]] || _CONTAINS -h "$@" || _CONTAINS -H "$@"  || _CONTAINS -? "$@"; then
    echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [-h,-H,-?] [pid|PCRE regex pattern 1] <PCRE regex pattern 2> ... e.g"
    echo -ne "    ${YELLOW_COL}${FUNCNAME[0]} web${RESET_COL}\t\t\t\twill match all nlweb/apache(mdl) processes.\n"
    echo -ne "    ${YELLOW_COL}${FUNCNAME[0]} mdl${RESET_COL}\t\t\t\twill match mdl and hence only apache/httpd processes.\n"
    echo -ne "    ${YELLOW_COL}${FUNCNAME[0]} '^(?=.*webmdl)(?=.*32)'${RESET_COL}\twill match webmdl process whose id has 32 in it.\n"
    echo -ne "    ${YELLOW_COL}${FUNCNAME[0]} runwf MidSourcing${RESET_COL}\t\twill match runwf process running 'defaultMidSourcingLog' workflow.\n"
    echo -ne "    ${YELLOW_COL}${FUNCNAME[0]} '.*mdl.*\$(*SKIP)(*F)|\\\bweb\\\b'${RESET_COL} will match web but not mdl, so will attach/debug only the nlweb module process.\n"
    echo -ne "    ${YELLOW_COL}${FUNCNAME[0]} 'web@'${RESET_COL}\t\t\twill match nlweb module process. Same as above.\n"
    return
  fi
  local matchRegExPat
  local pids
  matchRegExPat=$1
  pids=$1
  shift
  isCygwin && { tasklist /V /NH /FI "IMAGENAME EQ devenv.exe" /FI "STATUS EQ RUNNING" | grep -i devenv  > /dev/null; [[ $? -ne 0 ]] && echo "${GREEN_COL}INFO:${RESET_COL} No existing Visual studio instance found to be running.You are advised to open visual studio and corresponding project/solution/source code before you attach to the Just in Time Debugger"; }
  if [[ ! ${matchRegExPat} =~ ^[1-9][0-9]*$ ]]; then
    for arg in $@; do
      matchRegExPat="${matchRegExPat}|${arg}"
    done
    local ptmp=/tmp/nlpdump.tmp.${FUNCNAME[0]}
    nls -p pdump | grep -i --color=never -P "^[*[:alpha:]]" > ${ptmp}
    pids=$(cat ${ptmp} | grep -i -P "${matchRegExPat}" | awk '{print $2;}' | sed -r 's,[^[:digit:]],,g' | xargs)
    if [[ $(nchars ' ' ${pids}) -gt 0 ]]; then
      function __RESULT { export LINE_COUNT=$(cat -); }
      exec 3>&1; __RESULT < <( { cat ${ptmp} | grep -i -P "${matchRegExPat}" | nl -s'. ' | tee >(wc -l 1>&2); } 2>&1 >&3 3>&-;) 3>&-; exec 3>&-
      unset -f __RESULT
      echo "Multiple pids with matching pattern found..."
      read -p "Press enter to select all or enter a seq number( in range [1,${LINE_COUNT}]) to specify single PID: " ans
      if [[ ${ans} =~ ^[0-9]+$ ]] && [[ ${ans} -ge 1 || ${ans} -le ${LINE_COUNT} ]]; then
        pids=$(echo "${pids}" | awk -v n="${ans}" '{print $n;}')
      fi
    fi
    rm -f ${ptmp}
  fi
  for p in ${pids}; do
    echo "debugging pid $p ..."
    isCygwin && { launch VsJITDebugger.exe -p ${p}; true; } || { gdb -p ${p}; [[ $(nchars ' ' ${pids}) -gt 0 ]] && echo "${YELLOW_COL}WARN:${RESET_COL} This script function on $(getOS) does not support functionality to debug multiple pids in one go. Skipping remianing pids."; return; }
  done
}

function review {
  _CONTAINS -h "$@" || _CONTAINS -? "$@" || [[ $# -eq 0 ]] &&
  { echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} -[ h(elp) | ? | d(ry run) | u(ndo)] [git-branch-to-review]"; echo -ne "\t\t--\t Helps 'code reviewers' perform code review on a given branch.\n"; return 1; }
  local optCount=0
  _CONTAINS -u "$@" && optCount=$[${optCount}+1]
  _CONTAINS -d "$@" && optCount=$[${optCount}+1]
  for i in $(seq 1 1 ${optCount}); do
    shift
  done
  local _BRANCH=$1
  pushd . > /dev/null
  2root
  _CONTAINS -u "$@" && { [[ -f ${TMP}/${_BRANCH}.diff.patch.txt ]] && git apply -R ${TMP}/${_BRANCH}.diff.patch.txt; popd > /dev/null ; return 0; }

  git fetch -p &
  local last_pid=$!
  echo "Checking if git branch ${YELLOW_COL}${_BRANCH}${RESET_COL} exists ..." &&
  [[ $(git ls-remote --heads origin refs/heads/${_BRANCH} | wc -l) -eq 0 ]] &&
  { echo "${RED_COL}ALERT:${RESET_COL} git branch ${YELLOW_COL}${_BRANCH}${RESET_COL} not found !"; popd > /dev/null; return 2; }
  wait ${last_pid}
  local first=$(git log --merges -n 1 --first-parent ${_BRANCH} | grep -E "^commit" | awk '{print $2;}')
  local last=$(git log -n 1 --first-parent ${_BRANCH} | grep -E "^commit" | awk '{print $2;}')
  [[ -f ${TMP}/${_BRANCH}.diff.patch.txt ]] && review -u ${_BRANCH}
  git diff ${first}..${last} > ${TMP}/${_BRANCH}.diff.patch.txt
  git apply ${TMP}/${_BRANCH}.diff.patch.txt
  [[ $? -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Could not apply diff possibly because of conflicts."; popd > /dev/null; return 3; }
  popd > /dev/null
  _CONTAINS -d "$@" && return 0
  stopCampaign
  makeCamp -q
  for db in $(getCampaignDatabase 10); do
    local bkpDBName=${db}_${FUNCNAME[0]}_${_BRANCH}_$(date '+%W')
    csql -lqtA | awk -F'|' '{print $1;}' | grep "${bkpDBName}" > /dev/null
    [[ $? -eq 0 ]] || csql -c "CREATE DATABASE ${bkpDBName} WITH TEMPLATE ${db} OWNER ${PGUSER}" &&
    { echo "${YELLOW_COL}${db}${RESET_COL} database may get modified by postupgrade.";
    echo "Creating a backup database ${YELLOW_COL}${bkpDBName}${RESET_COL} from original database."; }
  done
  startCampaign -u -b
}

function ediff {
  # Define this in your environment variables in order to override.
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  export GUI_DIFF_TOOL_NAME=${GUI_DIFF_TOOL_NAME:=Examdiff.exe}
  _CONTAINS -h "$@" && git diff -h 2>&1 | sed "s/git diff/${FUNCNAME[0]}/g" && return
  # print last argument which most likely is the filename.
  if [ $# -gt 0 ]; then
    if isCygwin; then
      cygpath -w $(readlink -f "${@:$#:$#}")
    else
      readlink -f "${@:$#:$#}"
    fi
  fi
  local DIFF_TOOL_PATH="$(findW -u ${GUI_DIFF_TOOL_NAME})"
  [[ ! -z "$DIFF_TOOL_PATH" ]] || { echo "GUI Diff Tool '${GUI_DIFF_TOOL_NAME}' not found." | STDERR || return 2; }
  if [ $# -eq 2 ]; then
    local LHS_F="$(readlink -f "$1")"
    local LHS_F="$(cygpath -u "${LHS_F}")"
    local RHS_F="$(readlink -f "$2")"
    local RHS_F="$(cygpath -u "${RHS_F}")"
    if [ -f "${LHS_F}" ] && [ -f "${RHS_F}" ]; then
      LHS_F="$(cygpath -w "${LHS_F}")"
      RHS_F="$(cygpath -w "${RHS_F}")"
      launch "${DIFF_TOOL_PATH}" "${LHS_F}" "${RHS_F}"
      return 0
    fi
  fi
  local GIT_ROOT=$(git rev-parse --show-toplevel)
  pushd /tmp > /dev/null 2>&1
  echo '#!/bin/bash' > invokeDiffGUI.sh
  echo -ne 'function '                                >> invokeDiffGUI.sh
  declare -f getOS                                    >> invokeDiffGUI.sh
  echo -ne 'function '                                >> invokeDiffGUI.sh
  declare -f isCygwin                                 >> invokeDiffGUI.sh
  echo -ne 'function '                                >> invokeDiffGUI.sh
  declare -f launch                                   >> invokeDiffGUI.sh
  echo "echo Diffing \$1 and \$2 > /dev/tty"          >> invokeDiffGUI.sh
  echo "L=\$1"                                        >> invokeDiffGUI.sh
  echo "R=\$2"                                        >> invokeDiffGUI.sh
  echo "[[ \$L = \"/dev/null\" ]] && L=\"\$2\""       >> invokeDiffGUI.sh
  echo "[[ \$R = \"/dev/null\" ]] && R=\"\$1\""       >> invokeDiffGUI.sh
  echo "LHS_F=\"${GIT_ROOT}/\${L}\""                  >> invokeDiffGUI.sh
  echo "if [[ \${L} =~ ^/tmp/.* ]]; then"             >> invokeDiffGUI.sh
  echo "LHS_F=\"\${L}_${1}\""                         >> invokeDiffGUI.sh
  printf "mv \"\${L}\" \"\${LHS_F}\" \n fi \n"        >> invokeDiffGUI.sh
  echo "if [[ \$L = \$R ]]; then"                     >> invokeDiffGUI.sh
  printf "RHS_F=\"\$LHS_F\" \n else \n"               >> invokeDiffGUI.sh
  echo "RHS_F=\"${GIT_ROOT}/\${R}\""                  >> invokeDiffGUI.sh
  echo "if [[ \${R} =~ ^/tmp/.* ]]; then"             >> invokeDiffGUI.sh
  echo "RHS_F=\"\${R}_${2}\""                         >> invokeDiffGUI.sh
  printf "mv \"\${R}\" \"\${RHS_F}\" \n fi\n fi\n"    >> invokeDiffGUI.sh
  echo "L=\"\$(cygpath -w \"\${LHS_F}\")\""           >> invokeDiffGUI.sh
  echo "R=\"\$(cygpath -w \"\${RHS_F}\")\""           >> invokeDiffGUI.sh
  echo "launch \"$DIFF_TOOL_PATH\" \"\$L\" \"\$R\""   >> invokeDiffGUI.sh
  chmod +x invokeDiffGUI.sh
  local my_diff_tool_wrapper=$(readlink -f invokeDiffGUI.sh)
  popd > /dev/null
  git difftool -y --extcmd=${my_diff_tool_wrapper} "$@" &
}
function openSolutionInIDE {
  pushd -n . > /dev/null
  cd $CAMP_AC_ROOT/nl
  [[ "X${1:0:2}" = "X-j" ]] && exec_command_exists idea64 && launch idea64 && return
  if isDevToolAvailable ; then
    if [ -f './build/ncs.sln' ]; then
      # wps -Command "Get-Credential (Get-ComputerInfo).CsUserName | Export-Clixml -Path 'F:\cred.xml')"
      # wps -Command "Start-Process devenv -ArgumentList build\\ncs.sln -Credential (Import-Clixml -Path 'F:\cred.xml')"
      if [ -z "$1" ]; then
        wps -Command "Get-Process | Where-Object { \$_.Name -EQ 'devenv' -and \$_.Responding -EQ 'True' } | Select-Object -Property CommandLine | foreach { \$_.CommandLine }" | grep 'ncs.sln'
        [[ $? -ne 0 ]] && launch "$(findW -i "${VS_IDENTIFIER}" -u devenv.exe)" ./build/ncs.sln > /dev/null 2>&1
      else
        launch "$(findW -i "${VS_IDENTIFIER}" -u devenv.exe)"
      fi
    else
      echo "${RED_COL}ALERT:${RESET_COL} IDE solution file not found. if you have campaign source in correct location, Try running ${YELLOW_COL}makeCamp -c ${RESET_COL} to recreate solution file"
    fi
  else
    echo "${RED_COL}ALERT:${RESET_COL} IDE $(getIDEVersion) not found. Please install compatible Visual Studio."
  fi
  popd > /dev/null
}
function containers {
  local count=0 iRc=0
  local l_host=$1
  l_host=${1%%.*}
  l_host=${l_host##*/}
  local l_domain=${1#*.}
  [[ $(nchars . ${l_Server%%/*}) -eq 0 ]] && unset l_domain
  [[ -z ${l_domain} ]] || l_domain=".${l_domain}"
  shift
  local failuresAllowed=$1
  failuresAllowed=${failuresAllowed:=1}
  local failCount=0
  for c in {1..9}; do
    iLastRc=$iRc
    soap_rtest -s ${l_host}-$c${l_domain} > /dev/null 2>&1
    iRc=$?
    [[ $iRc -eq 0 ]] && count=$[$count+1] && failCount=0 || failCount=$[${failCount} + 1]
    [[ ${failCount} -gt ${failuresAllowed} ]] && break
  done
  [[ $count -ne 0 ]] && echo $count || { soap_rtest $1 > /tmp/soap_rtest 2>&1; iRc=$?; touch /tmp/soap_rtest; [[ $iRc -eq 0 ]] && grep "<redir" /tmp/soap_rtest && iRc=0; iRc=$?; return $iRc; }
}

function sshr {
# https://chamibuddhika.wordpress.com/2012/03/21/ssh-tunnelling-explained/
# https://digitalcrunch.com/linux/how-to-use-an-ssh-tunnel-through-a-jump-host/
  local firstArg=$1 ruser
  [[ ${1##*@} = ${1} ]] || { ruser=${1%%@*}; firstArg=${1##*@}; }
  ruser=${ruser:=$(whoami)}
# ssh ${SSHR_OPTS} L7070:localhost:7071 $(whoami)@$(getJumpHost) "ssh ${SSHR_OPTS} -D7071 ${ruser}@${rhost}"
# Above command should open port 7070 on your local machine to the jumphost, from the jumphost port 7071 it routes it outbound to the ssh server on furtherhost.
# All you need to do to use this SSH tunnel is point your application to the localhost on port 7070 and your ip will appear to come from the furtherhost, not the jumphost.
  if [ -z "$firstArg" ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <remote-host> | clean > [remote host commands] | [ tunnel [ db[:db_host:port] | ssh[:ssh_host:port] ] ]"
    #Sample use of remote command execution on multiple comtainers and consolidating of data in one for all of them.
    # start='2022-09-18 08:00:00'; end='2022-09-18 09:00:00'; for i in $(seq 1 1 5); do  sshr walgreens-mid-prod3-${i}.campaign.adobe.com 'find /usr/local/neolane/nl6/var/walgree_mid_prod3/redir/log/ -type f -newermt "'${start}'" ! -newermt "'${end}'" | xargs cat | cut -f4 | sort | uniq > /home/${ruser}/$(hostname).txt; chown ${ruser}:users  /home/${ruser}/$(hostname).txt;'; cp4r walgreens-mid-prod3-${i}.txt walgreens-mid-prod3-${i}.campaign.adobe.com; done; echo $(cat wa* | sort | uniq | wc -l) Dirty deliveries between ${start} and ${end};
    echo "${GREEN_COL}INFO:${RESET_COL} Sample use of remote command execution on multiple comtainers and consolidation all of their resulting data locally on your machine"
    echo "${YELLOW_COL}start='2022-09-18 08:00:00'; end='2022-09-18 09:00:00'; for i in \$(seq 1 1 5); do  sshr walgreens-mid-prod3-\${i}.${HOSTED_CAMPAIGN_DOMAIN} 'find /usr/local/neolane/nl6/var/walgree_mid_prod3/redir/log/ -type f -newermt \"'\${start}'\" ! -newermt \"'\${end}'\" | xargs cat | cut -f4 | sort | uniq > /home/\${ruser}/\$(hostname).txt; chown \${ruser}:users  /home/\${ruser}/\$(hostname).txt;'; cp4r walgreens-mid-prod3-\${i}.txt walgreens-mid-prod3-\${i}.${HOSTED_CAMPAIGN_DOMAIN}; done; echo \$(cat wa* | sort | uniq | wc -l) Dirty deliveries between \${start} and \${end};${RESET_COL}"
    return 1
  fi
  if [ X"${firstArg,,}" = X"clean" ]; then
    local jh=$(getJumpHost)
    echo "${YELLOW_COL}WARN:${RESET_COL} Cleaning /tmp folder on jumphost ${YELLOW_COL}${jh}${RESET_COL}, of all files owned by ${YELLOW_COL}${ruser}${RESET_COL}"
    local clean_Cmd='for f in $(find /tmp -maxdepth 1 -type f -user '"${ruser}"'; do echo $f; rm -f $f; done'
    ssh ${SSHR_OPTS} $(whoami)@${jh} "${clean_Cmd}"
    return 0
  fi
  local rhost=$(echo $firstArg | sed -r 's,^(.*:[/]+)([-\.[:alnum:]]+)[/]*.*,\2,g')
  shift
  [[ "X${rhost#*.}" = X${ADOBE_CORP_DOMAIN} ]] && [[ ${rhost} =~ ^[A-Za-z][A-Za-z][0-9]+.${ADOBE_CORP_DOMAIN}$ || $(nslookup ${rhost} | grep -E ^Name: | awk '{ print $2; }') =~ ^[A-Za-z][A-Za-z][0-9]+.${ADOBE_CORP_DOMAIN}$ ]] && echo "Use LDAP Password and then Okta to authenticate." && { ssh ${SSHR_OPTS} PSMConnect@sshp.wipc.adobe.com ${ruser} root ${rhost} $@; return $? ; }
  [[ "X${rhost#*.}" = Xrd.${HOSTED_CAMPAIGN_DOMAIN} ]] && [[ $(nslookup ${rhost} | grep -E ^Name: | awk '{ print $2; }') =~ ^[A-Za-z][A-Za-z][0-9]+\.${ADOBE_CORP_DOMAIN}$ ]] && echo "Using prod user and legacy password for connecting to rd-dev machine." && { ssh ${SSHR_OPTS} prod@${rhost} $@; return $? ; }
#  local tunnel_mode=$(_KEY_HAS_VALUE tunnel "$@") # this changes value of $? , so split it into two lines.
  local tunnel_mode
  tunnel_mode="$(_KEY_HAS_VALUE tunnel "$@")"
  if [ $? -eq 0 ]; then
    if [[ -z "${tunnel_mode}" ]]; then
      tunnel_mode=ssh
    fi
  fi
  [[ ! -z ${rhost} ]] && [[ X${rhost%%*.*} = X${rhost} ]] && rhost="${rhost}.${HOSTED_CAMPAIGN_DOMAIN}"
  echo $1 > /tmp/symantec_code
  local sshSingleSignOnPrompt=".*Hit enter to send Okta Verify push notification or provide OTP.*"
  # echo -n "652099" > /tmp/symantec_code; sshpass -v  -P "${sshpassprompt}" -f /tmp/symantec_code ${SSHR_OPTS} $(whoami)@$(getJumpHost); ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost) "ssh ${SSHR_OPTS} ${ruser}@${rhost} 'sudo su -'"
  if [[ -z "${tunnel_mode}" ]]; then
    echo "${GREEN_COL}INFO:${RESET_COL} Doing ssh login into ${YELLOW_COL}${rhost}${RESET_COL}"
    local REMOTE_CMD_OUTPUT_BUFFER=${SSH_REMOTE_CMD_OUTPUT_BUFFER:=1000}
    [[ -z $@ ]] && unset REMOTE_CMD_OUTPUT_BUFFER
    local sshCmd="ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost) \"ssh ${SSHR_OPTS} ${ruser}@${rhost} $@\""
    execute_with_UserInteraction "${sshCmd}" "${sshSingleSignOnPrompt}"
  else
    local tunnelPort=$(getNextAvailablePort)
    echo -ne "${GREEN_COL}INFO:${RESET_COL} Creating ssh tunnel on localhost port ${YELLOW_COL}${tunnelPort}${RESET_COL} ..."
    local l_dbHost
    local _TUN_DB="db"
    local _TUN_SSH="ssh"
    if [ "X${tunnel_mode:0:${#_TUN_DB}}" = X"${_TUN_DB}" ]; then
        function __findValue {
            [[ -z $1 ]] && return 1
            [[ -z $2 ]] && return 2
            exec_command_exists jq && { local val; val=$(echo "$1" | tr \' \" | jq -r .$2) && [[ val != "null" ]] || return $?; }
            local TMP_IFS=$IFS params key val
            params="$(echo "$1" | tr -d '\r' | tr -d '\n' | sed -r 's,[{}],,g')"
            IFS=$','
            for key in $params; do
                [[ ${key%%:*} =~ \'$2\' ]]  && val=${key#*:} && val=${val#*\'} && val=${val%\'*} && echo $val && IFS=$TMP_IFS && return
            done
            IFS=$TMP_IFS;
            return 1
        }
      echo "for db access via ${YELLOW_COL}${rhost}${RESET_COL}"
      if [ "X${tunnel_mode:${#_TUN_DB}:1}" = X":" ]; then
        l_dbHost="${tunnel_mode:$[${#_TUN_DB}+1]}"
        local db_connect_param_json
        if [[ -z ${l_dbHost} ]]; then
#                  export RARE_SQ1=${RARE_SQ1:=$(getUUID)}; db_connect_param_json="$(ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost) "ssh ${SSHR_OPTS} ${ruser}@${rhost} sudo camp-db-params" | sed -r ":a;N;\$!ba;s/[\r]?\n/ ${RARE_SQ1} /g" | sed -r "s,[^{]+(\{.*\})[^}]+,\1,g" | sed "s/ ${RARE_SQ1} /$(getEOL)/g")"
          db_connect_param_json="$(ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost) "ssh ${SSHR_OPTS} ${ruser}@${rhost} sudo camp-db-params" | awk '/{.*/{print; f=1;next}/}/{print;f=0;}f')"
        elif [[ $l_dbHost =~ ^([\-\.[:alnum:]]*[[:alnum:]])(:[1-9][0-9]{0,4})?$ ]]; then
            db_connect_param_json="{'host' : '${l_dbHost}'}"
        else
            db_connect_param_json="${l_dbHost}" # Should have format which atleast conforms to { 'host', 'abc.def' } format.
        fi
        if [[ -z ${l_dbHost} ]]; then
          echo "${RED_COL}ALERT:${RESET_COL} Error getting information from ${rhost}"
          unset -f __findValue
          return 2
        fi
#          qVar='host' l_dbHost=$(echo "${db_connect_param_json}" | sed -r -e "s,^[{[:space:]]+,,g" -e "s,[}\,[:space:]]+$,,g" | grep -i "'${qVar}'" | awk -F ":" '{print $2}' | sed -r -e "s,^['{[:space:]]+,,g" -e "s,[}\,'[:space:]]+$,,g")
        l_dbHost=$(__findValue "$db_connect_param_json" host)
        if [ $(nchars : ${l_dbHost}) -eq 0 ]; then
          l_dbHost=${l_dbHost}:5432
        fi
        local l_instanceHost=$(__findValue "$db_connect_param_json" ihost)
        [[ ! -z ${l_instanceHost} ]] && [[ X${l_instanceHost%%.*} = X${l_instanceHost} ]] && l_instanceHost="${l_instanceHost}.${HOSTED_CAMPAIGN_DOMAIN}"
        [[ ${l_instanceHost} =~ ^([\-\.[:alnum:]]*[[:alnum:]])(:[1-9][0-9]{0,4})?$ ]] && db_connect_param_json="$(sshr ${l_instanceHost} sudo camp-db-params | awk '/{.*/{print; f=1;next}/}/{print;f=0;}f')" && "Using credentials from ${YELLOW_COL}${l_instanceHost}${RESET_COL} to connect to database"
        echo "${GREEN_COL}INFO:${RESET_COL} Creating tunnel to Database Host  ${YELLOW_COL}${l_dbHost}${RESET_COL} via ${YELLOW_COL}${rhost}${RESET_COL}"
        local l_dbname=$(__findValue "$db_connect_param_json" dbname)
        l_dbname=${l_dbname:="postgres"}
        local l_dbUser=$(__findValue "$db_connect_param_json" user)
        l_dbUser=${l_dbUser:="postgres"}
        local l_dbPass=$(__findValue "$db_connect_param_json" password)
        l_dbPass=${l_dbPass:=<db-password-for-user-${l_dbUser}>}
        echo "${GREEN_COL}INFO:${RESET_COL} Test this tunnel connection via following command from a separate terminal prompt..."
        echo "${YELLOW_COL}csql --dbname ${l_dbname} --host localhost --port ${tunnelPort} --username ${l_dbUser} --password ${l_dbPass} -c 'SELECT version();'${RESET_COL}"
        echo "${GREEN_COL}INFO:${RESET_COL} Please ensure ${YELLOW_COL}AllowTcpForwarding${RESET_COL} is set to ${YELLOW_COL}yes${RESET_COL} in ${YELLOW_COL}/etc/ssh/sshd_config${RESET_COL} on ${YELLOW_COL}${rhost}${RESET_COL}  and after making necessary changes you can use ${YELLOW_COL}systemctl restart sshd.service${RESET_COL} to restart sshd daemon or Else ssh tunnel may not work and you may see error messages like ${YELLOW_COL}channel 2: open failed: administratively prohibited: open failed${RESET_COL} on console which is creating this tunnel."
        echo "${GREEN_COL}INFO:${RESET_COL}Cauterize using following command(choose a single local instance(first argument) of your choice in case you have multiple existing local instances)."
        local l_local_instance_to_cauterize=$(getCampaignInstance)
        l_local_instance_to_cauterize=${l_local_instance_to_cauterize:='<any-existing-local-instance>'}
        echo "${YELLOW_COL}cauterizeInstance ${l_local_instance_to_cauterize} ${l_dbname} ${l_dbUser} ${l_dbPass} localhost ${tunnelPort}${RESET_COL}"
        ssh ${SSHR_OPTS} -L ${tunnelPort}:127.0.0.1:${tunnelPort} -A -t $(whoami)@$(getJumpHost) "ssh ${SSHR_OPTS} -L ${tunnelPort}:${l_dbHost} ${ruser}@${rhost} echo '********** TUNNEL to ${l_dbHost%%.*} ***********'; bash -l"
      else # if tunnel_mode is db but does not specify any explicit dbHost.
        local db_connect_param_json="$(ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost) "ssh ${SSHR_OPTS} ${ruser}@${rhost} sudo camp-db-params" | awk '/{.*/{print; f=1;next}/}/{print;f=0;}f')"
        l_dbHost=$(__findValue "$db_connect_param_json" host)
        if [ -z ${l_dbHost} ]; then
          echo "${RED_COL}ALERT:${RESET_COL} Error getting information from ${rhost}"
          unset -f __findValue
          return 3
        fi
        local opendbTunnelCmd="${FUNCNAME[0]} ${rhost} tunnel db:${l_dbHost}"
        l_dbname=$(__findValue "$db_connect_param_json" dbname)
        l_dbPass=$(__findValue "$db_connect_param_json" password)
        l_dbUser=$(__findValue "$db_connect_param_json" user)
        echo "Opening  tunnel to database ${YELLOW_COL}${l_dbname}${RESET_COL} on host ${YELLOW_COL}${l_dbHost}${RESET_COL} via ${YELLOW_COL}'""${opendbTunnelCmd}""'${RESET_COL} in a separate console window."
        openTerm -q -c "${opendbTunnelCmd}" &
        echo "${GREEN_COL}INFO:${RESET_COL} After tunnel is created in parallel console window, you can then connect to database using following command:"
        echo "${YELLOW_COL}csql --dbname ${l_dbname} --host localhost --port ${tunnelPort} --username ${l_dbUser} --password ${l_dbPass} -c 'SELECT version();'${RESET_COL}"
        local attempt=5
        echo "${GREEN_COL}INFO:${RESET_COL} Please ensure ${YELLOW_COL}AllowTcpForwarding${RESET_COL} is set to ${YELLOW_COL}yes${RESET_COL} in ${YELLOW_COL}/etc/ssh/sshd_config${RESET_COL} on ${YELLOW_COL}${rhost}${RESET_COL}  and after making necessary changes you can use ${YELLOW_COL}systemctl restart sshd.service${RESET_COL} to restart sshd daemon or Else ssh tunnel may not work and you may see error messages like ${YELLOW_COL}channel 2: open failed: administratively prohibited: open failed${RESET_COL} on console which is creating this tunnel."
        while [[ ${attempt} -ne 0 && $(getNextAvailablePort) -eq ${tunnelPort} ]]; do
          attempt=$[${attempt}-1]
          readEx "Waiting for another " 10 " seconds  for the tunnel to go live on localhost port ${tunnelPort}. Press any key to abort this wait..."
          if [ $? -eq 0 ]; then
            break;
          fi
        done
        csql --dbname ${l_dbname} --host localhost --port ${tunnelPort} --username ${l_dbUser} --password ${l_dbPass} -c 'SELECT version();'
        # csql --dbname ${l_dbname} --host $(hostname --fqdn) --port ${tunnelPort} --username ${l_dbUser} --password ${l_dbPass} -c 'SELECT version();'
        unset -f __findValue
        return
      fi
    elif [ "X${tunnel_mode:0:${#_TUN_SSH}}" = X"${_TUN_SSH}" ]; then
      echo "for ssh login to host ${YELLOW_COL}${rhost}${RESET_COL}"
      local l_host
      if [ "X${tunnel_mode:${#_TUN_SSH}:1}" = X":" ]; then
        l_host="${tunnel_mode:$[${#_TUN_SSH}+1]}"
        if [ -z ${l_host} ]; then
          l_host=${rhost}
        fi
        if [ $(nchars : ${l_host}) -eq 0 ]; then
          l_host=${l_host}:22
        fi
        ssh ${SSHR_OPTS} -L ${tunnelPort}:127.0.0.1:${tunnelPort} $(whoami)@$(getJumpHost) "ssh ${SSHR_OPTS} -L ${tunnelPort}:${l_host} ${ruser}@${rhost}"
        # grep -i AllowTcpForwarding /etc/ssh/sshd_config  | grep -v '#' | grep -i yes > /dev/null || echo  'AllowTcpForwarding seems off in /etc/ssh/sshd_config. Tunnel may not work
        echo "${GREEN_COL}INFO:${RESET_COL} Please ensure ${YELLOW_COL}AllowTcpForwarding${RESET_COL} is set to ${YELLOW_COL}yes${RESET_COL} in ${YELLOW_COL}/etc/ssh/sshd_config${RESET_COL} on ${YELLOW_COL}${rhost}${RESET_COL} Else ssh tunnel may not work and you may see error messages like ${YELLOW_COL}channel 2: open failed: administratively prohibited: open failed${RESET_COL} on console which is creating this tunnel."
      else
        l_host=127.0.0.1
        local opensshTunnelCmd="${FUNCNAME[0]} ${rhost} tunnel ssh:${l_host}"
        echo "Opening tunnel for ssh to host ${YELLOW_COL}${l_host}${RESET_COL} via ${YELLOW_COL}'""${opensshTunnelCmd}""'${RESET_COL} in a separate console window."
        openTerm -q -c "${opensshTunnelCmd}" &
        echo "${GREEN_COL}INFO:${RESET_COL} After tunnel is created in parallel console window, you can then connect to host using following command:"
        echo "${YELLOW_COL}ssh -4 -A -p ${tunnelPort} ${ruser}@localhost"
        echo "${GREEN_COL}INFO:${RESET_COL} Please ensure ${YELLOW_COL}AllowTcpForwarding${RESET_COL} is set to ${YELLOW_COL}yes${RESET_COL} in ${YELLOW_COL}/etc/ssh/sshd_config${RESET_COL} on ${YELLOW_COL}${rhost}${RESET_COL} and after making necessary changes you can use ${YELLOW_COL}systemctl restart sshd.service${RESET_COL} to restart sshd daemon Else ssh tunnel may not work and you may see error messages like ${YELLOW_COL}channel 2: open failed: administratively prohibited: open failed${RESET_COL} on console which is creating this tunnel."
        local attempt=5
        while [[ ${attempt} -ne 0 && $(getNextAvailablePort) -eq ${tunnelPort} ]]; do
          attempt=$[${attempt}-1]
          readEx "Waiting for another " 10 " seconds  for the tunnel to go live on localhost port ${tunnelPort}. Press any key to abort this wait..."
          if [ $? -eq 0 ]; then
            break;
          fi
        done
      fi
    fi
  fi
  [[ $? -eq 0 ]] && echo ${rhost} >> ~/.hosts
}
function execute_containers {
  [[ $# -gt 1 ]] || { echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <remote-host> cmd [args ...]"; return; }
  local rhost=$1
  local domain=${rhost#*.}
  [[ ${domain} = ${rhost} ]] && domain=${HOSTED_CAMPAIGN_DOMAIN}
  rhost=${rhost%%.*}
  shift
  cmd="$@"
  local ctCount=1 startCt=1
  [[ $rhost =~ ^(.*[[:alnum:]])-([[:digit:]])$ ]] && { rhost=${BASH_REMATCH[1]}; startCt=${BASH_REMATCH[2]}; ctCount=${startCt}; } || ctCount=$(containers $rhost)
  for c in $(seq ${startCt} 1 ${ctCount}); do
    sshr ${rhost}-${c}.${domain} ${cmd}
    echo "Connection to ${rhost} closed." | STDINFO
    done 2>/dev/null | sed -ne "/LOG OFF/,/Connection to ${rhost}/{//!p;}"
    # sed -ne "/LOG OFF/,/Connection to ${rhost}/{/LOG OFF/!p}"
}
function testACC
{
    local iRc=0
    local autotestName=$1
    local integroTestName=$2
    stopCampaign
    buildsolutionInIDE -v rebuild
    iRc=$?
    [[ $iRc -ne 0 ]] && echo "${RED_COL}ALERT:${RESET_COL} build failed " && return 1;
    [[ -z $GOOD_BUILD_DB ]] && echo "${RED_COL}ALERT:${RESET_COL} No Good build available" && return 2
    [[ $iRc -eq 0 ]] && csql -d ${GOOD_BUILD_DB} -V && iRc=$?
    [[ $iRc -ne 0 ]] && echo "${RED_COL}ALERT:${RESET_COL} No Good build database available" && return 3
    if [[ $iRc -eq 0 ]]; then
        local curDB=$(getCampaignDatabase)
        [[ X${curDB} = X${GOOD_BUILD_DB} ]] && echo "${RED_COL}ALERT:${RESET_COL}Database name can not be same as Good build database name" && return 4
        csql -c "DROP DATABASE IF EXISTS ${curDB}"
        csql -c "CREATE DATABASE ${curDB} with template ${GOOD_BUILD_DB}"
        startCampaign -u # perform postupgrade from good build to current build.
        restartCampaign -b
        soap_rtest
        iRc=$?
    fi
    [[ $iRc -eq 0 ]] && [[ ! -z ${autotestName} ]] && runautotests $autotestName && iRc=$?
    [[ $iRc -eq 0 ]] && [[ ! -z ${integroTestName} ]] && runintegrotests -q $integroTestName && iRc=$?
    return $iRc
}
function findErroneousCommit {
    _CONTAINS -h "$@" || [[ $# -lt 2 ]] && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) ] good-commit bad-commit [branch] [-a] autotest-id [-i] integro-test-id" && return 1
    local iRc
    pushd $(git root) > /dev/null 2>&1; git bisect reset; popd > /dev/null 2>&1
    local goodCommit=$1 badCommit=$2 branch autotestName integroTestName
    branch=$(_KEY_HAS_VALUE -b $@)
    branch=${branch:=$3}
    git branch | grep "^\s*${branch}$"
    iRc=$?
    [[ -z $branch || $iRc -ne 0 ]] && branch=$(currentBranch)
    iRc=0
    autotestName=$(_KEY_HAS_VALUE -a $@)
    autotestName=${autotestName:=$4}
    integroTestName=$(_KEY_HAS_VALUE -i $@)
    integroTestName=${integroTestName:=$5}
    [[ -z ${autotestName} && -z ${integroTestName} ]] && echo "You must specify atleast one Auto Or Integro test" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) ] good-commit bad-commit [branch] [-a] autotest-id [-i] integro-test-id" && return 1
    pushd $(git root)
    git checkout $branch
    [[ -z $badCommit ]] && badCommit=$(git log -n 1 | grep -E "^commit" |  awk '{print $2;}')
    [[ -z $goodCommit ]] && goodCommit=${badCommit}
    [[ -z ${goodCommit} || -z ${badCommit} ]] && echo "You must specify good or bad commits" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) ] good-commit bad-commit [branch] [-a] autotest-id [-i] integro-test-id" && return 1
    echo "${GREEN_COL}INFO:${RESET_COL}Using Good Commit=${goodCommit}, Bad Commit=${badCommit}, Git Branch: ${branch}, Auto Test: ${autotestName}, Integro Test: ${integroTestName}"
    git pull origin ${branch}; git checkout -f ${branch}
    git checkout ${goodCommit}
    makeCamp -c -q
    setupCampaignDevServer good_${branch}
    restartCampaign -b
    read -p "Perform any(custom) changes to the current dev setup if you want to customize it and then Press Enter here to continue..."
    stopCampaign
    export GOOD_BUILD_DB='good_build_DB'
    csql -c "CREATE DATABASE ${GOOD_BUILD_DB} with template $(getCampaignDatabase)"
    iRc=$?
    [[ $iRc -ne 0 ]] && echo "${RED_COL}ALERT:${RESET_COL}Could not create database copy of Good Build. Can not bisect." && return 5
    popd
    pushd $(git root)
    git bisect reset
    git bisect start ${badCommit} ${goodCommit}
    echo '#!/bin/bash' > /tmp/testACC.sh
    echo 'export BOOT_OPTIONS=4' >> /tmp/testACC.sh
    echo 'shopt -s expand_aliases' >> /tmp/testACC.sh
    echo 'source ~/.bashrc' >> /tmp/testACC.sh
    echo 'testACC $@' >> /tmp/testACC.sh
    chmod +x /tmp/testACC.sh
    git bisect run /tmp/testACC.sh $autotestName $integroTestName
    git bisect reset
    popd
}
function findStringOccurances {
  local verbose lookInJSFiles help
  [[ $# -eq 0 ]] && help=1
  [[ $1 =~ ^-[hH].*$ ]] && shift && help=1
  [[ -z $help ]] || { echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | -v(verbose) | -j(search in js files) -w(path is windows path.)] <search string> [append-regex-1] [append-regex-2] [...]"; return; }
  [[ $1 =~ ^-[vV].*$ ]] && shift && verbose=1
  [[ $1 =~ ^-[jJ].*$ ]] && shift && lookInJSFiles=1
  function __grep {
    grep -Einr --include "$1" "${2}${3}${4}${5}" ${CAMP_AC_ROOT}
  }
  if [[ $1 =~ ^-[wW].*$ ]] ; then
    shift
    echo "INFO: ${YELLOW_COL}https://marketplace.visualstudio.com/items?itemName=Fr43nk.seito-openfile${RESET_COL} is a VS code extension(Alt+P) to open file in VSCode tab." | STDINFO 1>&2
    function __grep {
      local line
      local l_IFS=$IFS
      IFS=$'\n'
      grep -Einr --include "$1" "${2}${3}${4}${5}" ${CAMP_AC_ROOT} | while read line; do
#     echo $(wstyle $(awk -F":" '{printf("%s",$1)}' <<< ${line})):$(awk -F":" '{$1="";printf("%s",$0)}' <<< ${line})
      local file=$(cut -d: -f1 <<< ${line})
      local l=$(wstyle ${file})
      [[ -z $l ]] || file=${l}
      echo ${file}:$(cut -d: -f2- <<< ${line})
      done
      IFS=$l_IFS
    }
  fi
  if [[ -z ${lookInJSFiles} ]]; then
    [[ -z $verbose ]] || { echo "Looking in C++ source files ..." | STDERR; }
    local eids=$(grep -Einr --include "*.str" "${1}" ${CAMP_AC_ROOT} | awk -F"[:,]" '{print $3;}' | xargs)
    local nIDs=$(echo $eids | nchars ' ')
    [[ -z ${eids} ]] || nIDs=$[${nIDs}+1]
    [[ ${nIDs} -lt 1 ]] && unset -f __grep && return 1
    if [[ $nIDs -gt 5 ]]; then
      echo "${RED_COL}ALERT:${RESET_COL} Too many IDs for given seach string ${YELLOW_COL}${1}${RESET_COL}" | STDERR
      echo $eids | sed 's,\s,\n,g' | more -d -5
      readEx "Press any key to abort or Else Search will Continue in " 5 " seconds" 1>&2 && unset -f __grep && return
    fi
    local iRc
    for e in $eids; do
      __grep "*.c*" "IDS_${e}" ${2} ${3} ${4}
      [[ $? -eq 0 ]] && [[ -z $iRc ]] && iRc=1
    done
    [[ -z $iRc ]] || lookInJSFiles=1
  fi
  if [[ ! -z ${lookInJSFiles} ]]; then
    [[ -z $verbose ]] || echo "Looking in Script files ..." | STDERR
    __grep "*.js*" $*
  fi
  unset -f __grep
}
function runintegrotests {
    _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) | -q(quick does 'not' perform any mvn clean install)]" && return
    pushd .
    local iRc=0
    wcinstall maven $@
    local cpCmd="$(which cp) -f -p "
    2integro
    ${cpCmd} $TEAM_SHARE_LOCATION/mvn/settings.xml .mvn/
    local mvnArgs='-DskipTests'
    ! _CONTAINS -q "$@" && mvnArgs="clean install ${mvnArgs}"
    mvn ${mvnArgs}
    local integroJAR=$(find ${PWD}/target -iname "integro*dependencies*.jar")
    local runUsingJava runUsingMaven=1
    _CONTAINS -j "$@" && runUsingJava=1 && unset runUsingMaven
    _CONTAINS -m "$@" && unset runUsingJava
    soapLogOutAPI
    soap_rtest
    iRc=$?
    [[ $iRc -ne 0 ]] && echo "${RED_COL}Alert:${RESET_COL}ACC server ${YELLOW_COL}$SOAP_HOST not running" && return $iRc
    local testArgs="$(_KEY_HAS_VALUE -args $@)"
    [[ -z ${runUsingJava} ]] || java -Dinfra-param-json="" -Dcredential-json=""-Dtest-id="34353" -Dtestng.dtd.http="true" -cp ${integroJAR} org.testng.TestNG -testjar ${integroJAR} -xmlpathinjar testng_aws_momentum_bounce_tests.xml -listener com.adobe.campaign.test.configuration.impl.acc.ACCInfraConfigListener ${testArgs}
    [[ -z ${runUsingMaven} ]] || { cd .. ; mvn --settings Adobe-Campaign/.mvn/settings.xml -f Adobe-Campaign/pom.xml -U test -Dtest=Emails#createNewDelivery -DsuiteXmlFile=testng.xml -Dmaven.test.failure.ignore=true -DAC.UITEST.HOST=https://$(hostname --fqdn) -DAC.UI.HOSTNAME=$(hostname) -DAC.UITEST.LOGIN=admin -DAC.UITEST.PASSWORD=${DEFAULT_PASSWORD} -DUSE_AXIS=true -DAC.UITEST.LANGUAGE=en_US ${testArgs} | tee /tmp/integrotest.log; }
    iRc=$?
    local nFails=$(cat /tmp/integrotest.log | tail | grep -i -E "Tests run:" | tail -n 1 | awk -F',' '{print $2,$3;}' | awk '{print $2,$4}' | d2u | sed 's/\ /+/g' | bc)
    [[ $iRc -eq 0 ]] && [[ $nFails -gt 0 ]] && iRc=4
    rm -f /tmp/integrotest.log
    popd > /dev/null 2>&1
    return $iRc
 }
function runautotests {
  local AUTOTEST_ROOT="$(getCampRoot)/nl/test/autotest/"
  if _CONTAINS -h "$@" || [ $# -eq 0 ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <test path relative to ${AUTOTEST_ROOT}tests> { e.g [all] ['*'] [function/001-digest] [fwk/*] [path2] ... [pathN] } [-ffda [runid]]"
    return 1;
  fi
  local iRc=0
  local isFFDA runid
  _CONTAINS -ffda "$@" && isFFDA=1 && runid=${_KEY_HAS_VALUE -ffda $@} && ${runid}=$(whoami)_autotest_$(date '+%d%b%Y_%H_%M_%S') && read -p "Using runid ${runid}... Press Ctrl+C to abort or any other key to continue." yn
  local encrypted_SF_Password='ENmQqnMbQ1FODPNcK/RQi4lNYmtc9YcC2QH1DhspiBk=' # I...c
  # ${OPENSSL_BIN} enc -e -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${SECRET_PASSWORD}
  local SF_Password=$(echo ${encrypted_SF_Password} | ${OPENSSL_BIN} enc -d -pbkdf2 -base64 -aes-256-cbc -nosalt -pass pass:${SECRET_PASSWORD})
  [[ ! -z $(getCampaignInstance) ]] || { echo "No instance found...Run ${YELLOW_COL}wcinstall campinst <instance-name>${RESET_COL} to create a new one." | STDERR || return 2; }
  [[ -d ${AUTOTEST_ROOT} ]] || { echo "Autotest Folder (${AUTOTEST_ROOT}) not found..." | STDERR || return 3; }
  echo "Running auto tests from with folder ${YELLOW_COL}$(getPlatformPath ${AUTOTEST_ROOT})${RESET_COL}"
  pushd ${AUTOTEST_ROOT} > /dev/null 2>&1
  local l_instance=$(echo "$@" | sed -r 's,^.*(-instance:[^[:space:]]*).*,\1,' | grep -E -i --color=never '^-instance:' )
  for test in "$@"; do
    [[ ${test:0:1} = '-' ]] && continue
    local testname=${test%.*}
    [[ ${test} = '/' ]] && testname='/*'
    [[ ${test,,} = 'all' ]] && testname='/*'
    if [[ ${testname} =~ "*" ]] || [[ -f ${AUTOTEST_ROOT}tests/${testname}.js ]] || [[ -d ${AUTOTEST_ROOT}tests/${testname} ]]; then
       if [[ -z ${isFFDA} ]]; then
        nls javascript ${l_instance} -arg:${testname} -file main.js | tee /tmp/autotest.log
       else
        ${AUTOTEST_ROOT}../full-test/client-test.sh -n ${runid} -s $(hostname --fqdn) -a ${DEFAULT_PASSWORD} -user ${PGUSER} -u ${DEFAULT_PASSWORD} -pf snowflake -sf FullFda_snowflake -logfile /tmp/${runid}.xml -sf_t ${runid} -sf_p ${SF_Password} -sf_region "campaign_dev_adobe.east-us-2.azure" -mp 8080 -t ${testname}
       fi
       iRc=$?
       local nFails=$(cat /tmp/autotest.log | tail | grep -i -E "(Failures:|Errors:)" | awk '{print $4;}' | d2u | xargs | sed 's/\ /+/g' | bc)
       rm -f /tmp/autotest.log
       [[ $iRc -eq 0 ]] && [[ $nFails -gt 0 ]] && iRc=4
    else
      echo "${RED_COL}ALERT:${RESET_COL} Could not locate test ${YELLOW_COL}${AUTOTEST_ROOT}tests/${testname}.js${RESET_COL}..Skipping"
      iRc=5
    fi
  done
  popd > /dev/null 2>&1
  return $iRc
}
function runFakeSmtpServer {
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} [-f] -- Runs Fake SMPTP server and configures current ACC to start using this new fake smtp server for sending out emails." && return
  local version="2.1-SNAPSHOT"
  local fileToDownload="v${version}.zip"
  local product=FakeSMTP
  local smtpExecutable="${product}-${version}.jar"
  if ! exec_command_exists ${smtpExecutable} || _CONTAINS -f "$@"; then
    if ! exec_command_exists mvn; then
      wcinstall mvn
    fi
    pushd $CAMP_AC_ROOT/..
    [[ ! -d ${product} ]] && git clone https://github.com/hardeepparmar/${product}.git
    pushd ${product}
    git pull
    mvn package -Dmaven.test.skip
    local cpCmd="$(which cp) -f -p "
    ${cpCmd} target/${smtpExecutable} /usr/local/bin
    popd > /dev/null 2>&1
    popd > /dev/null 2>&1
  fi
  smtpExecutable="$(getPlatformPath $(which ${smtpExecutable}))${smtpExecutable}"
  mkdir -p /tmp/$(getCampaignInstance)/smtpOut
  local SMTP_HOST=$(hostname --fqdn)
  local SMTP_PORT=25
  echo "Start smtp sink on $SMTP_PORT port..check /tmp/smtpOut for messages sent to this email relay server"

  if isCygwin; then
    launch java -jar "${smtpExecutable}" -a $SMTP_HOST -p $SMTP_PORT -s -o "$(native ${TEMP}/smtpOut/)" &
  else
    launch sudo java -jar "${smtpExecutable}" -a $SMTP_HOST -p $SMTP_PORT -s -o "$(native ${TEMP}/smtpOut/)" &
  fi

  local backUpDir=$(getBackupLocation '')
  echo "${GREEN_COL}INFO:${RESET_COL} Back-up campaign config file(s) to ${backUpDir} folder."
  mkdir -p ${backUpDir}
  cp -p -v -i $(getCampRoot)/nl/build/ncs/conf/*.xml ${backUpDir}/
  updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/serverConf.xml relay address $SMTP_HOST
  updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/serverConf.xml relay port $SMTP_PORT
  for inst in $(getCampInstances); do
    updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/config-${inst}.xml smtp enableTLS false
    updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/config-${inst}.xml IP authentication ""
  done
  nls config -reload
}
function runFakeSmppServer {
  local SMPP_HOST="127.0.0.1"
  local SMPP_PORT=2775
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} [-f] -- Runs Fake SMPP/SMS server ${SMPP_HOST}:${SMPP_PORT}  and configures current ACC to start using this new fake SMPP/SMS server for sending out SMS deliveries." && return
  local fileToDownload="SMPPSim.zip"
  pushd $(getCampRoot)/.. > /dev/null
  local smppExecutable
  local extension='sh' pathSep='/'
  isCygwin && extension="bat" && pathSep='\'
  smppExecutable=$(ls --file-type SMPPSim/startsmpp*.${extension} | head -n 1)
  if [ ! -f ~/${smppExecutable} ]; then
    if ! exec_command_exists unzip; then
      aptS install unzip zip
    fi
    local cpCmd="$(which cp) -f ${1} "
    ${cpCmd} ${TEAM_SHARE_LOCATION}${pathSep}${fileToDownload} .
    smppExecutable=$(unzip -o $fileToDownload | grep inflating | grep -i startsmpp  | grep -i ${extension} | head -n 1 | cut -d ':' -f2 | xargs)
    local SMPP_USER=smppclient
    sed -r -i "s|^\s*SMPP_PORT\s*=.*|SMPP_PORT=${SMPP_PORT}|g" ./SMPPSim/conf/smppsim.props
    sed -r -i "s|^\s*OUTBIND_ESME_IP_ADDRESS\s*=.*|OUTBIND_ESME_IP_ADDRESS=${SMPP_HOST}|g" ./SMPPSim/conf/smppsim.props
    sed -r -i "s|^\s*SYSTEM_IDS\s*=.*|SYSTEM_IDS=${SMPP_USER}|g" ./SMPPSim/conf/smppsim.props
    sed -r -i "s|^\s*OUTBIND_ESME_SYSTEMID\s*=.*|OUTBIND_ESME_SYSTEMID=${SMPP_USER}|g" ./SMPPSim/conf/smppsim.props
    sed -r -i "s|^\s*PASSWORDS\s*=.*|PASSWORDS=${DEFAULT_PASSWORD}|g" ./SMPPSim/conf/smppsim.props
    sed -r -i "s|^\s*OUTBIND_ESME_PASSWORD\s*=.*|OUTBIND_ESME_PASSWORD=${DEFAULT_PASSWORD}|g" ./SMPPSim/conf/smppsim.props
  fi
  echo "Starting SMPP SIM server ..."
  if isCygwin; then
    smppExec_Cmd="-Command .\\$(basename ${smppExecutable})"
    wps -Command "Start-Process $PWSHELL -ArgumentList \"${smppExec_Cmd}\" -WindowStyle Minimized -WorkingDirectory SMPPSim -Verb RunAs"
  else
    pushd ~/SMPPSIM
    chmod +x startsmppsim.sh
    ./startsmppsim.sh
    popd > /dev/null
  fi
  popd > /dev/null
  nls config -reload
}

function runInMailServer {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  type pop3 > /dev/null 2>&1
  if [[ $? -ne 0 ]]; then
    pushd $TMP > /dev/null
    download https://www.pablosoftwaresolutions.com/files/babypop3.zip
    unzip -o babypop3.zip
    cp -f babypop3.exe /usr/local/bin/pop3.exe
    popd > /dev/null
    reg add "HKCU\Software\Pablo Software Solutions\Baby POP3 Server\Settings"  /f /v AutoStart   /t REG_DWORD  /d 1
    local incomingMail=~/mail/
    [[ ! -d ${incomingMail} ]] && mkdir ${incomingMail}
    incomingMail="$(trim $(native ${incomingMail}))"
    reg add "HKCU\Software\Pablo Software Solutions\Baby POP3 Server\Settings"  /f /v MailFolder  /t REG_SZ     /d "${incomingMail}"
    reg add "HKCU\Software\Pablo Software Solutions\Baby POP3 Server\Settings"  /f /v Timeout     /t REG_DWORD  /d 120
    local user='admin'
    local userFullName="$(getUserInfo -fullname)"
    local password=${DEFAULT_PASSWORD}
    function __2PString {
      echo $(printf '%02x' ${#1})$(ascii $1 -x | awk -F":" '{$1=""; print $0;}') | tr -d ' '
    }
    echo "The incoming mail folder shall be ${YELLOW_COL}${incomingMail}${user})${RESET_COL}"
    echo "You can drop your test .eml files in this folder for inMail to pickup for processing."
    local count="0100"
    user=$(__2PString "${user}")
    userFullName=$(__2PString "${userFullName}")
    password=$(__2PString "${password}")
    reg add "HKCU\Software\Pablo Software Solutions\Baby POP3 Server\UserAccounts"  /f /v Users  /t REG_BINARY  /d ${count}${user}${userFullName}${password}
    unset -f __2PString
  fi
  updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/serverConf.xml inMail autoStart false
  updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/serverConf.xml msgDump dump true
  local dump=$TMP/inMail
  [[ -d ${dump} ]] || mkdir ${dump}
  dump="$(trim $(native ${dump}))"
  updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/serverConf.xml msgDump msgPath ""
  updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/serverConf.xml msgDump msgPath "${dump//\\/\\\\}"
  for inst in $(getCampInstances); do
    updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/config-${inst}.xml inMail args " -verbose -tracefilter:*"
    updateXMLAttr $(getCampRoot)/nl/build/ncs/conf/config-${inst}.xml inMail autoStart true
  done
  echo "Messages processed by all ${YELLOW_COL}inMail${RESET_COL} module(s) will  be finally dumped into ${YELLOW_COL}${dump}${RESET_COL} folder."
  nls config -reload
  launch pop3
}
function registerWithWindowsCredentialManager {
    isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
    local l_Server='TERMSRV/psmdirect.corp.adobe.com'
    if _CONTAINS -h "$@"; then
      echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} [-h (help)] [server-host(default ${l_Server})] ..."
      return 0
    fi
    [[ -z $1 ]] || l_Server=$(echo $1 | sed -r 's,^(.*:[/]+)([-\.[:alnum:]]+)[/]*.*,\2,g')
    if [[ $PWSHELL_VERSION =~ ^5 ]]; then
    local install_CredentialManager_Cmd="-Command Install-Module -Name CredentialManager; Import-Module CredentialManager"
    wps -Command "Start-Process $PWSHELL  -ArgumentList \"${install_CredentialManager_Cmd}\" -Verb RunAs"
  else
    local install_CredentialManager_Cmd="-Command Install-Module -Name CredentialManager"
    wps -Command "Start-Process $PWSHELL  -ArgumentList \"${install_CredentialManager_Cmd}\" -Verb RunAs; Import-Module CredentialManager"
    install_CredentialManager_Cmd="-Command Install-Module -Name TUN.CredentialManager"
    wps -Command "Start-Process $PWSHELL  -ArgumentList \"${install_CredentialManager_Cmd}\" -Verb RunAs; Import-Module TUN.CredentialManager"
  fi
  local LDAP_PASS
  echo "Storing credentials in your Windows credential manager..."
  local saveCreds
  while [[ -z $saveCreds ]]; do
    read -s -p "Enter ADOBENET LDAP Password:$(echo -e '\U0001F512')" LDAP_PASS
    if [[ ${#LDAP_PASS} -ge 8 ]]; then
      local storeCredential_Cmd="-Command New-StoredCredential -Target '${l_Server}' -Type Generic -UserName '$(whoami)' -Password '${LDAP_PASS}' -Persist 'LocalMachine'"
      wps -Command "Start-Process $PWSHELL  -ArgumentList \"${storeCredential_Cmd}\" -Verb RunAs"
      openssl dgst <<<${LDAP_PASS}
      saveCreds=1
    else
        readEx "${YELLOW_COL}WARN:${RESET_COL} Invalid LDAP password..Skip storing password in  Windows credential manager in " 5 " seconds."
        if [[ $? -eq 0 ]]; then
          true
        else
          echo ""
          saveCreds=0
        fi
    fi
  done
}
function fixrdp {
    isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
    if _CONTAINS -h "$@" || [[ $# -eq 0 ]]; then
      echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} [-h (help)] <rdp-file> ..."
      return 0
    fi
    local x y
    if [[ $PWSHELL_VERSION =~ ^5 ]]; then
      x=$(trim $(wps -Command "(Get-WmiObject -Class Win32_VideoController).CurrentHorizontalResolution"))
      y=$(trim $(wps -Command "(Get-WmiObject -Class Win32_VideoController).CurrentVerticalResolution"))
    else
      x=$(trim $(wps -Command "(Get-CimInstance -Class Win32_VideoController).CurrentHorizontalResolution"))
      y=$(trim $(wps -Command "(Get-CimInstance -Class Win32_VideoController).CurrentVerticalResolution"))
    fi
    function _fix_RDP {
      grep -q -E "^${2}:" $1 && sed -r -i "s|${2}:.*|${2}:${3}|g" $1 || echo "${2}:${3}" >> $1
    }
    for f in $@; do
      local ext=${f##*.}
      [[ -f $f && ${ext,,} = "rdp" ]] || continue
      _fix_RDP $f username             s:$(whoami)
      _fix_RDP $f enablecredsspsupport i:1
      _fix_RDP $f desktopwidth         i:${x}
      _fix_RDP $f desktopheight        i:${y}
      _fix_RDP $f winposstr            s:0,1,80,60,${x},${y}
  done
  unset -f _fix_RDP
}
function num {
  wcinstall python
  local pyCmd="import num2words,numpy,pyttsx3,sys,os,math; from num2words import num2words; a=str('$1').replace(',',''); print(num2words(a)); print(num2words(a,lang ='en_IN') + ' (IND) '); roundA=a.split('.',1)[0]; b={True: pow(10, len(roundA) - 3), False: 1} [ '.' not in a and len(roundA) > 6 ]; a=float(a); roundA=int((int(a) + b/2)/b)*b; sys.stdout.flush(); engine = pyttsx3.init(); engine.say({ True: num2words(roundA) + ' approx', False: num2words(a)} [ b > 1] ); engine.runAndWait();"
  isCygwin && "$(findW -i "cygdrive.*python3" python.exe)" -c "${pyCmd}" && return $?
  python3 -c "${pyCmd}" 2>/dev/null # WSL does not support audio/speaker as yet.
}
function img2txt {
  wcinstall python
  wcinstall tesseract
  if [ $? -ne 0 ]; then
    return
  fi
  binPath="$(cygpath -w $(findW tesseract) | sed 's/\\/\\\\/g')"
  local imgPath="$1"
  if [ -f "$imgPath" ]; then
    imgPath=$(readlink -f "$1")
    imgPath=$(cygpath -w  "${imgPath}" | sed 's/\\/\\\\/g')
  else
    imgPath=""
  fi
  if [ -z ${imgPath} ]; then
    echo -n "Invalid image file path. " | STDERR; errno ENOENT | cut -d ' ' -f3- | STDERR
    echo "${YELLOW_COL}Usage:${RESET_COL} ${FUNCNAME[0]} <path-to-image-which-needs-to-be-convered-to-text>"
    return $(errno ENOENT | cut -d ' ' -f2)
  fi
#  local pyCmd1="import pytesseract, cv2, sys; img=cv2.imread(r'${imgPath}'); t=int(img.shape[0]/2 - 25) ; b=int(img.shape[0]/2 + 100); l=int(img.shape[1]/2 - 200); r=int(img.shape[1]/2 + 200); pytesseract.pytesseract.tesseract_cmd=r'${binPath}'; s=pytesseract.image_to_string(img[t:b,l:r]); print(s)"
  local pyCmd3="import pytesseract, cv2, sys,re; fetchCode='fetchCode'; img=cv2.imread(r'${imgPath}');\nif (img is None) : raise RuntimeError('Could not read image file %s' % r'${imgPath}')\npytesseract.pytesseract.tesseract_cmd=r'${binPath}'; t=pytesseract.image_to_string(img); t=(re.findall(r\"[0-9][0-9][0-9][0-9][0-9]\", (re.findall(r\"SECURITY CODE\\s+[0-9][0-9][0-9][0-9][0-9]\",t) or [''])[0]) or [''])[0] if( fetchCode == '${2}' ) else t; print(t)"
  local pyCmd=$(echo -e ${pyCmd3})
#  echo -e "Executing Python command: \n ${pyCmd}"
  "$(findW -i "cygdrive.*python3" python.exe)" -c "${pyCmd}"
}
function onChangeVpnStatus {
#  echo "VPN $1 @ $(date '+%d%b%Y_%H_%M_%S_%s')" >> /tmp/vpnstat.log
  if [[ ! -z "${1}" ]] && [[ "${1}" -eq 1 ]]; then
    local SSHD_PID=$(ps -e | grep sshd |  sed -r 's/[[:space:]]+/ /g' | cut -d ' '  -f2) && [[ ! -z ${SSHD_PID} ]] && kill -TERM ${SSHD_PID}
    local restart_cygwin_sshd_Cmd="-Command Restart-Service -Name cygsshd"
    wps -Command "Start-Process $PWSHELL  -ArgumentList \"${restart_cygwin_sshd_Cmd}\" -WindowStyle hidden -Verb RunAs"
  else
    local stop_cygwin_sshd_Cmd="-Command Stop-Service -Name cygsshd"
    wps -Command "Start-Process $PWSHELL  -ArgumentList \"${stop_cygwin_sshd_Cmd}\" -WindowStyle hidden -Verb RunAs"
    local SSHD_PID=$(ps -e | grep sshd |  sed -r 's/[[:space:]]+/ /g' | cut -d ' '  -f2) && [[ ! -z ${SSHD_PID} ]] && kill -TERM ${SSHD_PID}
    /usr/sbin/sshd
  fi
}
function monitor {
  [[ X${1,,} = "X-v" ]] && unset MONITOR_WINPID
  # return, if this is already running on some other bash prompt.
  local mon_bash_pid iRc=1
  local bashpid=${BASHPID}
  if [[ -n ${MONITOR_WINPID} ]]; then
    if isCygwin; then
      ps -W | awk -v pid="$MONITOR_WINPID" '{$1=$2=$3=$5=$6=$7="";$0=$0;NF=NF; { if (pid == $1) print $0; } }' | grep "/usr/bin/bash" > /dev/null
      iRc=$?
    else
#      stdbuf -oL ps -eo pid,args | stdbuf -oL grep -E "^\s*${MONITOR_WINPID}" | head -1 | grep -E "\s\-bash(\s|$)" > /dev/null
      ps -eo pid,args | grep -E "^\s*${MONITOR_WINPID}" | head -1 | grep -E "\s\-bash(\s|$)" > /dev/null
      iRc=$?
    fi
  fi
  [[ $iRc -eq 0 ]] && return
  isCygwin && { mon_bash_pid=$(ps -W | awk '{print $1" "$4;}' | grep "^${bashpid} " | head -1 | awk '{print $2;}'); true; } ||
  { mon_bash_pid=$(ps -eo pid,args | grep -E "^\s*${bashpid}" | head -1 | grep -E "\s\-bash(\s|$)" | awk '{print $1;}'); }
  cacheEnvVar -f MONITOR_WINPID ${mon_bash_pid}
  kill -SIGUSR1 $$
  iRc=0

  trap '' SIGINT
  pushd ~
  local pathSep='/'
  isCygwin && pathSep='\'
  local remoteHostsFile="${TEAM_SHARE_CACHE}hosts.txt"
  local localHostsFile="/tmp/.hosts.txt"
  local hostnameLocal=$(hostname --fqdn)
#  local prevVPNStatus=1
  local cpCmd="$(which cp) -f ${1} "
  local mvCmd="$(which mv) -f ${1} "
  local wait_time checkUACAndFirewallTimer
  fetchEnvInfo
  fetchVPNState
  local loop=true
  [[ -z ${SYS_HOSTS_FILE} ]] || { cat ${SYS_HOSTS_FILE} | grep -E '^\s*#\s*' > ${localHostsFile}; cat ${SYS_HOSTS_FILE} | grep -v -E '^\s*#\s*' | sort -r -u -k 2 >> ${localHostsFile}; cat ${localHostsFile} > ${SYS_HOSTS_FILE}; true > ${localHostsFile}; }
  while [[ -n $loop ]]; do
    wait_time=$(date '+%s')
#    if false; then
    local remoteHostsFileProcessed=0
    if isHostAlive ${TEAM_SHARE_SERVER}; then
      if ! isCygwin; then
        remoteHostsFile="${TEAM_SHARE_CACHE}hosts.txt"
        remoteHostsFile="$(realpath -m ${remoteHostsFile})"
      fi
      ! isHostAlive ${DB_SERVER} && export DB_SERVER="hparmar-win10-vpc.${ADOBE_CORP_DOMAIN}" && getDatabaseType
      if [[ -f $remoteHostsFile ]]; then
        # [[ $prevVPNStatus -eq 0 ]] && onChangeVpnStatus 1
        # prevVPNStatus=1
        [[ ! -f "${localHostsFile}" ]] && touch "${localHostsFile}"
        ${cpCmd} ${remoteHostsFile} ${localHostsFile}.tmp
        cmp -s ${localHostsFile} ${localHostsFile}.tmp > /dev/null 2>&1
        if [[ $? -ne  0 ]]; then
          fetchVPNState
          ${mvCmd} ${localHostsFile}.tmp ${localHostsFile}
          [[ X${1,,} = "X-v" ]] && echo "Update hosts file with information from central database."
          local l_IFS=$IFS
          IFS=$'\n'
          local h
          cat "${localHostsFile}" | sed 's/\r$//' | grep -v "^\s*#" | grep -v "^\s*$" | while read h; do
            local vpnIP=$(echo $h | tr -s ' ' | cut -d ' ' -f1)
            local vpnHost=$(echo $h | tr -s ' ' | cut -d ' ' -f2)
            if [[ ${hostnameLocal,,} = ${vpnHost,,} ]]; then
              continue
            fi
            add2HostsFile ${vpnHost} ${vpnIP} ${FUNCNAME[0]}
          done
          IFS=$l_IFS
        fi
        local vpnIPRemote=$(grep -i --color=none "${hostnameLocal}" "${localHostsFile}"  | awk '{print $1}')
        [[ $(echo "$vpnIPRemote" | wc -l) -gt 1 ]] && sed -i -r "/^[^#]*${hostnameLocal}.*/d" "${localHostsFile}" && vpnIPRemote=""
        local vpnIPLocal=$(getIP -vpn)
        # if you are in Adobenet then VPN IP will be null but you are still part this host management.
        [[ -z $vpnIPLocal ]] && getIP > /dev/null && vpnIPLocal=$(getIP)
        # update hosts.txt file with new information about this host.
        local mtime=$(date '+%d%b%Y_%H_%M_%S_%s')
        if [[ -z "${vpnIPRemote}" ]]; then
          [[ X${1,,} = "X-v" ]] && echo "Registering this(${hostnameLocal}) with ip(${vpnIPLocal}) in central database."
          add2HostsFile ${hostnameLocal} ${vpnIPLocal} "mtime=${mtime} @ $(whoami)" "${localHostsFile}"
          ${cpCmd} ${localHostsFile} "${remoteHostsFile}"
        elif [[ ${vpnIPRemote} != ${vpnIPLocal} ]]; then
          [[ X${1,,} = "X-v" ]] && echo "Updating this(${hostnameLocal}) with ip(${vpnIPLocal}) in central database."
          add2HostsFile ${hostnameLocal} ${vpnIPLocal} "mtime=${mtime} @ $(whoami)" "${localHostsFile}"
          ${cpCmd} ${localHostsFile} "${remoteHostsFile}"
        fi
        # remoteHostsFileProcessed=1
      fi
      # if remoteHostsFileProcessed is not processed for some reason
      # if [ $remoteHostsFileProcessed -eq 0 ]; then
        # # [[ $prevVPNStatus -eq 1 ]] && onChangeVpnStatus 0
        # # local __MARKER="# Added by bashrc :: ${FUNCNAME[0]}"
        # if [ $prevVPNStatus -eq 1 ]; then
          # local vpnHost="asa-.*\.adobe\.com"
          # ${cpCmd} ${sysHostsFile} ${localHostsFile}.1.tmp
          # sed -i -r "/^[^#]*${vpnHost}.*/d" "${localHostsFile}.1.tmp"
          # cat ${localHostsFile}.1.tmp | grep -v "${__MARKER}" | sudo tee ${sysHostsFile}
          # rm -f "${localHostsFile}.1.tmp"
          # true > ${localHostsFile}
          # prevVPNStatus=0
        # fi
        # if [ -f "${localHostsFile}" ]; then
          # local l_IFS=$IFS
          # IFS=$'\n'
          # cat "${localHostsFile}" | sed 's/\r$//' | grep -v "^\s*#" | grep -v "^\s*$" | while read h; do
            # vpnHost=$(echo $h | tr -s ' ' | cut -d ' ' -f2)
            # if [[ ${hostnameLocal,,} = ${vpnHost,,} ]]; then
              # continue
            # fi
            # cat "${sysHostsFile}" | sed 's/\r$//' | grep -v "^\s*#" | grep -v "^\s*$" | grep ${vpnHost} > /dev/null
            # if [ $? -eq 0 ]; then
              # # delete host entries when not connected by VPN.
              # echo "Deleting ${vpnHost}"
              # # sed -i -r "s/^[[:digit:].]+[[:space:]]+${vpnHost}.*//Ig" "${sysHostsFile}"
              # sed -i -r "/^[^#]*${vpnHost}.*/d" "${sysHostsFile}"
              # sed -i -r '/^\s*$/d' "${sysHostsFile}"
            # fi
          # done
          # IFS=$l_IFS
          # rm -f ${localHostsFile}
        # fi
      # fi
      # fetchVPNState
    else
        iRc=0
        grep ${FUNCNAME[0]} "${SYS_HOSTS_FILE}" 2> /dev/null && grep -v ${FUNCNAME[0]} "${SYS_HOSTS_FILE}" > ${localHostsFile} 2> /dev/null
        [ $? -eq 0 ] && iRc=1 && cmp -s ${SYS_HOSTS_FILE} ${localHostsFile} > /dev/null 2>&1 && iRc=0
        [[ $iRc -eq  1 ]] && echo "Removing old entries from ${SYS_HOSTS_FILE}" && ${mvCmd} ${localHostsFile} ${SYS_HOSTS_FILE} && fetchVPNState
    fi
    fetchEnvInfo
    if isCygwin; then
      # Wait for 10 wait periods(5 mins), before calling disableUACAndFirewall once again.
      [[ -n ${checkUACAndFirewallTimer} ]] && checkUACAndFirewallTimer=$[${checkUACAndFirewallTimer}+1] && [[ ${checkUACAndFirewallTimer} -gt 10 ]] && unset checkUACAndFirewallTimer
      [[ -z ${checkUACAndFirewallTimer} ]] && [[ "$(sed 's/.*/\U&/' <<< X${EXPERT_MODE:0:1})" =~ X[Y1T] ]] && disableUACAndFirewall && checkUACAndFirewallTimer=1
    fi
    wait_time=$[$(date '+%s')-${wait_time}]
    [[ ${wait_time} -lt 30 ]] && { [[ X${1,,} = "X-v" ]] && unset loop && echo "Going idle for next $[30-${wait_time}] seconds" || sleep $[30-${wait_time}]; }
  done
  popd
}
function getPPID {
  trim $(wps -Command "(Get-Process -Id ${1}).parent.Id")
}
function on_exit {
#  [[ -e ~/.bash_logout ]] && { grep 'getbashrc &' ~/.bash_logout > /dev/null ||  echo 'getbashrc &' >> ~/.bash_logout ; }
#  [[ ! -e ~/.bash_logout ]] && echo 'getbashrc &' > ~/.bash_logout
if isCygwin; then
    local bashpid=${BASHPID}
    local wPid=$(ps -p ${bashpid} | tail -n 1 | awk '{print $4}')
    local getParentPid_Cmd="(Get-Process -Id ${wPid}).parent.Id"
    if [[ $PWSHELL_VERSION =~ ^5 ]]; then
      getParentPid_Cmd="(wmic process where '(processid=${wPid})' get parentprocessid | Where-Object {\$_}).Item(1)"
    fi
    cacheEnvVar TERMINATING_CONSOLE_WIN_PID $(getCmdValue 'wps -Command "${getParentPid_Cmd}"')
  fi
  local pwlogo=$(wps  <<< $(echo Exit) | head -n -1)
  echo "${pwlogo}" | grep -i upgrade > /dev/null
  [[ $? -eq 0 ]] && cacheEnvVar SHOW_POWERSHELL_BANNER 1 || cacheEnvVar -f -c SHOW_POWERSHELL_BANNER

  [[ $(trim $PWSHELL_VERSION) = $(trim  $(wps -Command 'Write-Host $PSVersionTable.PSVersion')) ]] || cacheEnvVar -f -c PWSHELL_VERSION
  local NL_PID=$(jobs -l | grep watchdog | awk '{print $2}') && [[ ! -z ${NL_PID} ]] && stopCampaign
#  [[ ! -z ${NL_VIRTUAL_PPID+x} &&  ${NL_VIRTUAL_PPID} -eq $$ ]] && cacheEnvVar -f -c NL_VIRTUAL_PPID && stopCampaign
  local SLEEP_PID=$(ps -e | grep sleep | awk '{print $1}') && [[ ! -z ${SLEEP_PID} ]] && kill -TERM ${SLEEP_PID}
  local MONITOR_PID=$(jobs -l | grep monitor | awk '{print $2}') && [[ -n ${MONITOR_PID} ]] && kill -KILL ${MONITOR_PID} && rm -f /var/tmp/badurls.lock
}
trap on_exit EXIT
# trap on_exit SIGHUP
# trap on_exit SIGTERM
function installPostgres {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  _CONTAINS -h "$@" && echo "${YELLOW_COL}Usage:${RESET_COL}  ${FUNCNAME[0]} [ -h(elp) -f(force) | 9 | 10 | 12 | 14 | 15 ] -- Installs PostgreSQL server of given major version." && return
  pushd /tmp
  # download https://get.enterprisedb.com/postgresql/postgresql-12.6-1-windows-x64.exe
  # download https://www.enterprisedb.com/downloads/postgres-postgresql-downloads
  local postgresInstaller=${TEAM_SHARE_LOCATION}$(ls --file-type  ${TEAM_SHARE_LOCATION} | grep -i --color=never postgres | grep "$1\." | head -n 1)
  cp ${postgresInstaller} .
  postgresInstaller=$(basename $(echo ${postgresInstaller}))
  chmod +x ${postgresInstaller}
  local iRc
  ./${postgresInstaller}  --unattendedmodeui minimal  --superpassword ${DEFAULT_PASSWORD}
  iRc=$?
  [[ $iRc -eq 0 ]] || { echo "${RED_COL}ALERT:${RESET_COL} Installation aborted ..."; return $iRc; }
  local restart_postgres_Cmd="-Command Get-Service -Name postgres* | Restart-Service"
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"${restart_postgres_Cmd}\" -Wait -Verb RunAs"
  pushd $(cygpath -u "${USERPROFILE}") > /dev/null 2>&1
  local get_postgres_Info_Cmd="-Command (Get-Process postgres* | Select-Object -Index 0 | Select-Object -ExpandProperty Path | Out-File -encoding ASCII \$env:TEMP\camp-postgres.tmp)"
  wps -Command "Start-Process ${PWSHELL}  -ArgumentList \"${get_postgres_Info_Cmd}\" -Wait -Verb RunAs"
  local postgresExePath=$(getCmdValue "cat ${TEMP}/camp-postgres.tmp")
  rm -rf ${TEMP}/camp-postgres.tmp
  popd > /dev/null 2>&1
  if [ ! -z "${postgresExePath}" ]; then
    postgresExePath=$(echo ${postgresExePath} | sed 's/\\/\\\\/g')
    postgresExePath=$(cygpath -u "${postgresExePath}")
  fi
  if [ -z "$postgresExePath" ] || [ ! -f "$postgresExePath" ]; then
    echo "${RED_COL}ALERT:${RESET_COL} Postgres server not found to be running/installed. Please install and/or ensure that the service is started."
    return
  fi
  local postgresInstallRoot="$(dirname "$(dirname "${postgresExePath}")")"
  local postgresCfgPath="${postgresInstallRoot}/data/pg_hba.conf"
  local method=$(cat "$postgresCfgPath" | grep -v -E "#.*" | grep -v -E "^\s*$" | tr -s '[:blank:]' | rev | awk '{print $1}' | rev | head -n 1)
  [[ $method =~ [^-_[:alnum:]]+ ]] && unset method
  method=${method:=md5}
  grep -E "^host\s+all\s+all\s+0.0.0.0/0\s+${method}" "$postgresCfgPath"
  if [ $? -ne 0 ]; then
    sed -r -i  's/^\s*host/\#host/g' "$postgresCfgPath"
    echo "host    all             all             0.0.0.0/0    ${method}" >> "$postgresCfgPath"
    echo "host    all             all             0::/0        ${method}" >> "$postgresCfgPath"
  fi
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"${restart_postgres_Cmd}\" -Wait -Verb RunAs"
  local old_db_server=${DB_SERVER}
  unset DB_SERVER
  getDatabaseType
  csql -V -d postgres
  if [ $? -ne 0 ]; then
    echo "Please open ${OSTYPE} again after ensuring psql installed and available in PATH."
    readEx "Press Ctrl+C to abort or any other key to exit this session.Closing terminal in " 10 " seconds..."; exit
  fi
  local majVer
  [[ "X${DBMS_TYPE}" = X"PostgreSQL" ]] && majVer=${DBMS_VERSION%%,*} && majVer=${majVer#* } && majVer=${majVer%%.*}
  postgresCfgPath="${postgresInstallRoot}/data/postgresql.conf"
  cat "${postgresCfgPath}" | grep -E "^[#[:space:]]*shared_preload_libraries" || echo "shared_preload_libraries = ''" >> "${postgresCfgPath}"
  local val_shared_preload_libraries=$({ cat "${postgresCfgPath}" | grep -E "^[#[:space:]]*shared_preload_libraries" | grep -E -v "\s*#{1}\s*[[:alnum:]]" | sed -r "s,^[^=]+=\s*'([^']*)'.*$,\1,g" | sed -r 's:,:\n:g'; [[ $majVer -ge 10 ]] && echo auto_explain; echo pg_stat_statements; } | sort | uniq | xargs | sed 's: :,:g')
  [[ ! -z ${val_shared_preload_libraries} ]] && sed -i -r "s|^[#[:space:]]*shared_preload_libraries\s*=\s*'(.*)'|shared_preload_libraries = '${val_shared_preload_libraries}'|g" "${postgresCfgPath}"
  if [[ $majVer -ge 14 ]]; then
    cat "${postgresCfgPath}" | grep -E "^[#[:space:]]*compute_query_id[[:space:]]*="
    if [ $? -eq 0 ]; then
      sed -i -r 's,^[#[:space:]]*compute_query_id.*,compute_query_id = on,g' "${postgresCfgPath}"
    else
      echo "compute_query_id = on" >> "${postgresCfgPath}"
    fi
  fi
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"${restart_postgres_Cmd}\" -Wait -Verb RunAs"
  pgsql -c "CREATE EXTENSION IF NOT EXISTS pg_stat_statements" template1
  # GetDate function does not exist in postgres.Create a alias in template1 so that whenever a new db is created,
  # this function automatically gets populate in that new db.
  pgsql -c "SELECT 'GetDate'::regproc" template1
  [[ $? -ne 0 ]] && echo "Registering custom 'GetDate'" && echo $(pgsql -d template1 -c "CREATE OR REPLACE FUNCTION public.GetDate() returns timestamptz stable language sql as 'select now()'; select GetDate();")
  pgsql -c "SELECT 'IsNumeric'::regproc" template1
  [[ $? -ne 0 ]] && echo "Registering custom 'IsNumeric'" && echo $(pgsql -t -d template1 -c "CREATE OR REPLACE FUNCTION IsNumeric(text) RETURNS BOOLEAN AS \\$\\$
  DECLARE x NUMERIC;
    BEGIN
     x = \\\$1::NUMERIC;
       RETURN TRUE;
    EXCEPTION WHEN others THEN
       RETURN FALSE;
    END;
     \\$\\$
    STRICT
  LANGUAGE plpgsql IMMUTABLE;  select 'isNumeric called on ''-123'' returned '|| IsNumeric('-123'), 'isNumeric called on ''abc'' returned '||IsNumeric('abc');")
  wps -Command "Start-Process $PWSHELL  -ArgumentList \"${restart_postgres_Cmd}\" -Wait -Verb RunAs"
  DB_SERVER=${old_db_server}
  getDatabaseType
  csql -V -d postgres
  cacheEnvVar -f DB_SERVER
  popd
}
function installSnowflakeOdbcDriver {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  pushd /tmp
  local snowflakeOdbcDriver
  toggleXMLLintUse
  if [[ ${BUILD_BIT_WIDE} -eq 32 ]]; then
    snowflakeOdbcDriver=$(curl -L -s https://sfc-repo.snowflakecomputing.com/odbc/win32/latest/index.html | getXMLAttrVal a href 2)
    download https://sfc-repo.snowflakecomputing.com/odbc/win32/latest/${snowflakeOdbcDriver}
  else
    snowflakeOdbcDriver=$(curl -L -s https://sfc-repo.snowflakecomputing.com/odbc/win64/latest/index.html | getXMLAttrVal a href 2)
    download https://sfc-repo.snowflakecomputing.com/odbc/win64/latest/${snowflakeOdbcDriver}
  fi
  toggleXMLLintUse
  wps -Command "Start-Process ./${snowflakeOdbcDriver}  -ArgumentList '/passive' -Wait"
  popd
}
function installsqlcmdClient {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  pushd /tmp
  download https://go.microsoft.com/fwlink/?linkid=2239168 msodbcsql.msi
  echo "Installing Microsoft ODBC Driver 17 for SQL Server (x64) ..."
  msiexec.exe /i msodbcsql.msi
  echo "Installing mssql command line utils ..."
  winget install sqlcmd
  popd
}
function disableUACAndFirewall {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  local uac_query_cmd='(Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin").ConsentPromptBehaviorAdmin'
#  [[ 0 -eq $(REG QUERY 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System' /v ConsentPromptBehaviorAdmin | tail -2 | head -1 | rev | cut -d ' ' -f1 | h2d) ]] && return
  [[ $(trim $(wps -Command ${uac_query_cmd})) -eq 0 ]] || {
  local disableUAC_Command='Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value "0"; Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value "0"; Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "1"; Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Value "0"';
  wps -Command "Start-Process -WindowStyle Hidden $PWSHELL  -ArgumentList '-Command \"${disableUAC_Command}\"' -Verb RunAs"; }
  local disableFW_Command='Set-NetFirewallProfile -Enabled False'
  wps -Command "Start-Process -WindowStyle Hidden $PWSHELL  -ArgumentList '-Command \"${disableFW_Command}\"' -Verb RunAs"
}
function captureScreen {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  local larg=${1,,}
  local captureScreen=0
  local captureVideo=0
  case "$larg" in
  -i|--image|-s|--screen)
    shift
    captureScreen=1
  ;;
  -v|--video)
    shift
    captureVideo=1
  ;;
  *)
    echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} [ [-i|--image|-s|--screen [SCREEN-OPTIONS] ] | [v|--video [VIDEO-OPTIONS]] ]
      -h,h,help,--help,?,/?      This help documentation.
      -i|--image|-s|--screen     Capture Screen shot of whole screen or a named window.
          SCREEN-OPTIONS      [-OfWindowTitle "string_matching_window_title" [ -IndexRange "1,2,2-10,all" ] ]
      -v|--video                 Grabs video shot. Requires ffmpeg. You can use ${YELLOW_COL}wcinstall ffmpeg ${RESET_COL} for it.
          VIDEO-OPTIONS       [ Check Get-VideoCapture.ps1 scipt file for its options. Are not Defaults good enough?
      " | STDERR
    return
  ;;
  esac
  2envsetup
  local iRc=0
  if [ $captureScreen -ne 0 ]; then
    if [[ $PWSHELL_VERSION =~ ^5 ]]; then
      LIB='' wps -f Get-ScreenCapture.ps1 "$@"
    else
      wps -f Get-ScreenCapture.ps1 "$@"
    fi
    iRc=$?
  fi
  if [ $captureVideo -ne 0 ];  then
    wcinstall ffmpeg -q
    if [[ $PWSHELL_VERSION =~ ^5 ]]; then
      LIB='' wps -f Get-VideoCapture.ps1 "$@"
    else
      wps -f Get-VideoCapture.ps1 "$@"
    fi
    iRc=$?
  fi
  popd > /dev/null
  return $iRc
}
function getDebugSymbolPath {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  local instanceName
  while [[ "$#" -gt 0 ]]; do
      case $1 in
          -i|--instance) instanceName="$2"; shift ;;
          *) echo "${YELLOW_COL}Usage:${RESET_COL} dss -i <instance_name>" | STDWARN; return 2;;
      esac
      shift
  done
  if [ -z "$instanceName" ]; then
    echo "${YELLOW_COL}Usage:${RESET_COL} dss -i <instance_name>" | STDWARN
    return 2
  fi
  # Move to folder where we have checked-in the cache (so that user dont need to set
  # ARTIFACTORY related settings in env variables to use dsscli)
  pushd $(getCampRoot)/../acc-dev/acc-dev-setup > /dev/null
  $(getCampRoot)/../acc-dev/acc-dev-setup/tools/dsscli.exe -instance $instanceName
  popd > /dev/null
}
function white-board-cleaner {
  ! exec_command_exists /usr/bin/convert && aptS install ImageMagick
  [[ $# -ne 2 ]] && [[ ! -f $1 ]] && echo "${YELLOW_COL}Usage${RESET_COL}:  ${FUNCNAME[0]} <inp-file-with-dirty-background> <out-file-with-white-background> ]" | STDWARN && return 1;
  /usr/bin/convert $1 -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 $2;
}
function generateHits {
  _CONTAINS -h "$@" || _CONTAINS -? "$@" || [[ $# -eq 0 ]] && { echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} -[ h | ? ] [-d (dump_urls_to_stdout(do not generate Hits)) ] [ -s <size> (curl batch size) ] [ <file-name|folder-name> ]"; echo "${GREEN_COL}INFO:${RESET_COL} On 16 core, no VPN, cygwin ${YELLOW_COL}generateHits -s 64 urls.txt${RESET_COL} (url count=5120, https://localhost/index.html) took 6 seconds."; return 1; }
  loadProcessorCount
  local totalHits=0 successCount=0 iRc=0 max_workers=${EFFECTIVE_PROCESSOR_COUNT} pending_urls_count=0
  [[ ${max_workers} -gt 2 ]] && max_workers=$[${max_workers}-2]
  local UNITS_ONE_WORKER=$(_KEY_HAS_VALUE -s $@)
  [[ -z ${UNITS_ONE_WORKER} ]] && UNITS_ONE_WORKER=$[${EFFECTIVE_PROCESSOR_COUNT}*4]
  local UNITS_ALL_WORKERS=$[${UNITS_ONE_WORKER}*${max_workers}]
  local url_batch dump url lastPID=0
  _CONTAINS -d "$@" && dump=1 && totalHits=1
  local execscriptFile=${TEMP}/${FUNCNAME[0]}.sh
  local badURLogFile=${TEMP}/badurls.log
  echo '#!/bin/bash' > ${execscriptFile}
  echo -ne 'function ' >> ${execscriptFile}
  declare -f nchars >> ${execscriptFile}
  echo "function __Hit {
      [[ \$# -eq 0 ]] && return \$(errno EINVAL | awk '{print \$2}')
      local iRc=0 http_ret_codes
      local url_batch
      for url in \$@; do
        url_batch+=\" -o /dev/null \${url}\"
      done
      http_ret_codes=\"\$(curl -f -s -w ' %{http_code}' -L \${url_batch})\"
      iRc=\$?
      [[ \$iRc -eq 0 ]] && [[ \$(nchars ' ' \${http_ret_codes}) -ne \$[\$#-1] ]]  && iRc=\$(errno EIO | awk '{print \$2}')
      for c in \${http_ret_codes}; do
        [[ \${#c} -eq 3 && \${c:0:1} =~ ^(1|2|3) ]] && shift && continue
        echo \"\$1 :: \$iRc :: \$c\" >> \${TEMP}/badurls.log
        shift
      done
      exec 100>/var/tmp/badurls.lock || exit 1
      flock 100 || exit 1
      return \$iRc
  }
  __Hit \$@
  " >> ${execscriptFile}
  chmod +x ${execscriptFile}
  true > $badURLogFile
  echo "${GREEN_COL}INFO:${RESET_COL} $(date "+%H:%M:%S %p : Generating Hits with   max_workers = ${max_workers}, BATCH = ${UNITS_ALL_WORKERS} ...")"
  local curl_arg
  if [ ! -t 0 ]; then
     local __PIPE_INPUT=$(cat)
     for url in $(echo "${__PIPE_INPUT}" | perl -MMIME::QuotedPrint -0777 -nle 'print decode_qp($_)' | tr -s '"' '\n' | tr -s "'" '\n' | grep -E '^https?://'); do
       if [[ -n ${dump} ]]; then
          echo "${url}"
       else
          url_batch+=${url}" "
          pending_urls_count=$[${pending_urls_count}+1]
          if [[ ! -e /proc/${lastPID} && ${pending_urls_count} -ge ${UNITS_ALL_WORKERS} ]]; then
            successCount=$[${totalHits}-$(wc -l < $badURLogFile)]
            printf "\r${GREEN_COL}INFO:${RESET_COL} $(date '+%H:%M:%S %p : ')Processed ${YELLOW_COL} %9d ${RESET_COL} Hits ...Success ${GREEN_COL} %9d ${RESET_COL}" ${totalHits} ${successCount}
            awk -v end="${UNITS_ALL_WORKERS}" '{ if( end > NF ) end=NF; for(i=1; i<=end; i++) { printf("%s ", $(i) ); } }' <<< ${url_batch} | xargs -n ${UNITS_ONE_WORKER} -P ${max_workers} ${execscriptFile} &
            totalHits=$[${totalHits}+${UNITS_ALL_WORKERS}]
            pending_urls_count=$[${pending_urls_count}-${UNITS_ALL_WORKERS}]
            lastPID=$!
            url_batch=$(awk -v start="${UNITS_ALL_WORKERS}" '{ for(i=start+1; i<=NF; i++) { printf("%s ", $(i) ); } }' <<< ${url_batch})
          elif [[ ${pending_urls_count} -ge $[${UNITS_ALL_WORKERS}*4] ]]; then
            successCount=$[${totalHits}-$(wc -l < $badURLogFile)]
            printf "\r${GREEN_COL}INFO:${RESET_COL} $(date '+%H:%M:%S %p : ')Processed ${YELLOW_COL} %9d ${RESET_COL} Hits ...Success ${GREEN_COL} %9d ${RESET_COL} * %9d" ${totalHits} ${successCount} ${pending_urls_count}
            wait ${lastPID}
          fi
       fi
     done
  else
     for file in $(find ${@: -1} -maxdepth 2 -type f); do
       [[ ! -z ${dump} ]] && echo "===>> ${file}"
       for url in $(cat "${file}" | perl -MMIME::QuotedPrint -0777 -nle 'print decode_qp($_)' | tr -s '"' '\n' | tr -s "'" '\n' | grep -E '^https?://'); do
         if [[ -n ${dump} ]]; then
            echo "${url}"
         else
            url_batch+=${url}" "
            pending_urls_count=$[${pending_urls_count}+1]
            if [[ ! -e /proc/${lastPID} && ${pending_urls_count} -ge ${UNITS_ALL_WORKERS} ]]; then
              successCount=$[${totalHits}-$(wc -l < $badURLogFile)]
              printf "\r${GREEN_COL}INFO:${RESET_COL} $(date '+%H:%M:%S %p : ')Processed ${YELLOW_COL} %9d ${RESET_COL} Hits ...Success ${GREEN_COL} %9d ${RESET_COL}" ${totalHits} ${successCount}
              awk -v end="${UNITS_ALL_WORKERS}" '{ if( end > NF ) end=NF; for(i=1; i<=end; i++) { printf("%s ", $(i) ); } }' <<< ${url_batch} | xargs -n ${UNITS_ONE_WORKER} -P ${max_workers} ${execscriptFile} &
              totalHits=$[${totalHits}+${UNITS_ALL_WORKERS}]
              pending_urls_count=$[${pending_urls_count}-${UNITS_ALL_WORKERS}]
              lastPID=$!
              url_batch=$(awk -v start="${UNITS_ALL_WORKERS}" '{ for(i=start+1; i<=NF; i++) { printf("%s ", $(i) ); } }' <<< ${url_batch})
            elif [[ ${pending_urls_count} -ge $[${UNITS_ALL_WORKERS}*4] ]]; then
              successCount=$[${totalHits}-$(wc -l < $badURLogFile)]
              printf "\r${GREEN_COL}INFO:${RESET_COL} $(date '+%H:%M:%S %p : ')Processed ${YELLOW_COL} %9d ${RESET_COL} Hits ...Success ${GREEN_COL} %9d ${RESET_COL} * %9d" ${totalHits} ${successCount} ${pending_urls_count}
              wait ${lastPID}
            fi
         fi
       done
     done
  fi
  [[ $lastPID -ne 0 ]] && wait $lastPID
  while [[ ! -z ${url_batch} ]]; do
    awk -v end="${UNITS_ALL_WORKERS}" '{ if( end > NF ) end=NF; for(i=1; i<=end; i++) { printf("%s ", $(i) ); } }' <<< ${url_batch} | xargs -n ${UNITS_ONE_WORKER} -P ${max_workers} ${execscriptFile}
    local urls_left=$(awk -v start="${UNITS_ALL_WORKERS}" '{ for(i=start+1; i<=NF; i++) { printf("%s ", $(i) ); } }' <<< ${url_batch})
    [[ -z ${urls_left} ]] && totalHits=$[${totalHits}+$(nchars ' ' ${url_batch})+1] || totalHits=$[${totalHits}+${UNITS_ALL_WORKERS}]
    url_batch=${urls_left}
    successCount=$[${totalHits}-$(wc -l < $badURLogFile)]
    printf "\r${GREEN_COL}INFO:${RESET_COL} $(date '+%H:%M:%S %p : ')Processed ${YELLOW_COL} %9d ${RESET_COL} Hits ...Success ${GREEN_COL} %9d ${RESET_COL}" ${totalHits} ${successCount}
  done
  echo ""
  echo "${GREEN_COL}INFO:${RESET_COL} Total = ${totalHits} : Success = ${successCount} ($(printf %.3f $(echo "${successCount} / ${totalHits} * 100" | bc -l)) %)" && [[ ${totalHits} -gt ${successCount} ]] && echo "Ref ${TEMP}/badurls.log(Format url :: cURL Error code :: HTTP_RET_CODE) for List of Bad Urls"
}
function csql {
  if [[ ${DBMS_TYPE} = "MSSQL" ]]; then
    mssql "$@"
    return $?
  fi
  if [[ ${DBMS_TYPE} = "PostgreSQL" ]]; then
    pgsql "$@"
    return $?
  fi
  if [[ ${DBMS_TYPE:0:1} =~ S|s ]]; then
    sfsql "$@"
    return $?
  fi
  return 1
}
cd $CAMP_AC_ROOT/nl
function store_command {
  declare -g LAST_COMMAND __current_command
  LAST_COMMAND="${__current_command}"
  __current_command="${BASH_COMMAND}"
  return 0
}
trap store_command DEBUG
export TRACE_ADDR=$(hostname --fqdn):8888
export BUILD_BIT_WIDE=${BUILD_BIT_WIDE:=64}

if [ -n "${EXEC_RUN_ONCE_BEGIN}" ]; then
  setupSSHKeys
  cmds="${EXEC_RUN_ONCE_BEGIN}"
  cacheEnvVar -f -c EXEC_RUN_ONCE_BEGIN
  eval "${cmds}"
fi
_TE bashrc_script $LINENO
[[ ${BOOT_OPTIONS} -eq 0 ]]  && { [[ -f ~/.after.sh ]] && source ~/.after.sh; }
##############################################################################
### Begin campaign environment setup
##############################################################################
[[ $(( BOOT_OPTIONS & 1 )) -ne 0 ]] && setupOS
[[ $(( BOOT_OPTIONS & 2 )) -ne 0 ]] && welcome &
[[ $(( BOOT_OPTIONS & 4 )) -ne 0 ]] && getDatabaseType &
_TE bashrc_script $LINENO
# isCygwin && renice -n -20 -p ${BASHPID} > /dev/null || sudo renice -n -20 -p ${BASHPID} > /dev/null
initBuildEnv > /dev/null
# isCygwin && renice -n 0 -p ${BASHPID} > /dev/null || sudo renice -n 0 -p ${BASHPID} > /dev/null
# initBuildEnvPID="$!"
# renice -n -20 -p ${initBuildEnvPID} > /dev/null
if [[ ${BOOT_OPTIONS} -ne 0 ]]; then
  isHostAlive localhost || add2HostsFile localhost 127.0.0.1
  echo "ACC dev environment(${YELLOW_COL}${BUILD_BIT_WIDE}${RESET_COL} Bit, Build Number: ${YELLOW_COL}${BUILD_NUMBER}${RESET_COL})."
  _TE bashrc_script $LINENO
  makeCamp -N
  # [[ -z ${DB_SERVER} ]] && cacheEnvVar -r DB_SERVER
  # cacheEnvVar -r DBMS_TYPE
  # cacheEnvVar -r DBMS_VERSION
  # cacheEnvVar -r PGPORT
  # cacheEnvVar -r PGHOST
  [[ -f ~/.before.sh ]] &&  source ~/.before.sh
  [[ $(( BOOT_OPTIONS & 4 )) -ne 0 ]] && ! isHostAlive ${DB_SERVER} && export DB_SERVER="hparmar-win10-vpc.${ADOBE_CORP_DOMAIN}" && echo "Checking connection to database server..." && getDatabaseType
  if [[ -z ${DBMS_TYPE} ]] || [[ -z ${PGHOST} ]]; then
    echo "${BOLD}Database Server ${DB_SERVER} not reachable." | STDERR
  else
    export DB_SERVER=${PGHOST}
    [[ ! -z $PGPORT ]] && DB_SERVER=${DB_SERVER}:${PGPORT}
    echo "Using Database ${YELLOW_COL}${DBMS_TYPE}${RESET_COL} version ${YELLOW_COL}${DBMS_VERSION}${RESET_COL} on ${YELLOW_COL}${PGHOST}${RESET_COL}"
  fi
  echo "ACC Dev setup is ready. Git Branch: ${YELLOW_COL}${CUR_CAMP_GIT_BRANCH}${RESET_COL}"
  wait
  if [ -n "${EXEC_RUN_ONCE_LAST}" ]; then
    cmds="$EXEC_RUN_ONCE_LAST"
    cacheEnvVar -f -c EXEC_RUN_ONCE_LAST
    eval "${cmds}"
  fi
fi
# If not running interactively, don't do anything further.
[[ "$-" != *i* ]] && return
setupSSHKeys
# Wraps a completion function, eg for use with an alias.
# Usage:
# make-completion-wrapper <actual completion function> <name of new func.>
#                         <command name> <list supplied arguments>
# eg.
#   alias agi='apt-get install'
#   make-completion-wrapper _apt_get _apt_get_install apt-get install
#     # defines a function called _apt_get_install (that's $2) that will
#     # complete the 'agi' alias.
#   complete -F _apt_get_install agi
function make-completion-wrapper {
  local function_name="$2"
  local arg_count=$(( $#-3 ))
  local comp_function_name="$1"
  shift 2
  local function="function $function_name {
      (( COMP_CWORD += $arg_count ))
      COMP_WORDS=( \"\$@\" \${COMP_WORDS[@]:1} )
      \"$comp_function_name\"
    }"
  eval "$function"
  # echo "$function"
}
function openInUIWindow {
  if [ "$(getOS)" = "cygwin" ]; then
    shopt -s nocasematch
    if [[ "$1" =~ ^https?://.* ]]; then
      wps -Command "Start-Process $1"
      return
    else
      wps -Command explorer "$(getPlatformPath "$1")"
    fi
  elif exec_command_exists nautilus; then
    nautilus -w "$(getPlatformPath "$1")" > /dev/null 2>&1 &
  else
    echo "$(getPlatformPath "$1")" | grep -E '^/mnt' > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      ssh -4 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $(getIP -wslhost) ${FUNCNAME[0]} $(echo "$(getPlatformPath "$1")" | sed -r 's,^/mnt,/cygdrive,')
    fi
  fi
}
function editor {
  if ! isCygwin; then
    if exec_command_exists code; then
      _CONTAINS - "$@" && { local inp="$([[ -p /dev/stdin ]] && cat - || echo "")"; echo "${inp}" > /tmp/pipe2code.txt; DONT_PROMPT_WSL_INSTALL=1 code /tmp/pipe2code.txt; return; }
      local openAsSU
      local posN=1
      _CONTAINS -s "$@" && for f in $@; do [[ ! -w $f ]] && openAsSU=1; [[ X$f = X"-s" ]] && set -- "${@:1:posN-1}" "${@:posN+1}" && continue; posN=$[${posN}+1]; done
      for f in $@; do
        [[ -z ${openAsSU} && -w $f ]] && DONT_PROMPT_WSL_INSTALL=1 code "$f" && continue
        sudo DONT_PROMPT_WSL_INSTALL=1 code --no-sandbox --user-data-dir=$TEMP "$f"
      done
      return
    fi
    echo $(readlink -f "$1") | grep -E '^/mnt' > /dev/null 2>&1
    [[ $? -eq 0 ]] || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return 2; }
    ssh -4 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $(getIP -wslhost) ${FUNCNAME[0]} $(echo $(readlink -f "$1") | sed -r 's,^/mnt,/cygdrive,')
    return $?
  fi
  local ed
  [[ -z $ed ]] && exec_command_exists code && ed='code'
  [[ -z $ed ]] && exec_command_exists notepad++ && ed='notepad++'
  [[ -z $ed ]] && exec_command_exists sublime_text && ed='sublime_text'
  if [ -z "$ed" ]; then
    ed="$(findW -u notepad++)"
    if [ -z "$ed" ]; then
      ed="$(findW -u sublime_text)"
    fi
    if [ -z "$ed" ]; then
      ed="$(findW notepad)"
    fi
  fi
  local posN=1
  for i in "$@"; do
    if [[ "${i}" =~ [\\/]+ ||  ! "${i}" =~ ^-+ ]]; then
      local unixPath="$(cygpath -u "${i}")"
      if [ -e "$unixPath" ]; then
        unixPath="$(readlink -f "${unixPath}")"
        local windowsPath="$(cygpath -w "${unixPath}")"
        if [[ "${windowsPath}" =~ [[:space:]]+ ]]; then
          set -- "${@:1:posN-1}" "\"${windowsPath}\"" "${@:posN+1}"
        else
          set -- "${@:1:posN-1}" "${windowsPath}" "${@:posN+1}"
        fi
      fi
    fi
    posN=$[${posN}+1]
  done
  if [[ ${ed} -eq "code" ]]; then
    ATTACH_TO_TERMINAL=1 launch "${ed}" "$@" > /dev/null 2>&1
  else
    launch "${ed}" "$@" > /dev/null 2>&1
  fi
}
function nlclient {
  isCygwin || { redir2CygwinOnWSLHost ${FUNCNAME[0]}; return; }
  local target="Release|x64"
  [[ ${BUILD_BIT_WIDE} -eq 32 ]] && target="Release|Win32"
  if [ ! -x "$(getCampRoot)/nl/build/nlclient/Release/nlclient.exe" ]; then
    readEx "nlclient.exe (${target}) not found. Start build from source in next " 5 " seconds.Press any key now to abort the build."
    [[ $? -eq 0 ]] && return $(errno ENOENT | cut -d ' ' -f2 )
    pushd -n . > /dev/null
    cd $CAMP_AC_ROOT/nl
    devenv.com build/ncs.sln /build ${target} /project nlclient
    popd > /dev/null
  fi
  launch $(getCampRoot)/nl/build/nlclient/Release/nlclient
}

function launchWSLDistro {
  isCygwin || { echo "${FUNCNAME[0]} Not available on $(getOS)" | STDERR || return $?; }
  local distros="$(wps -Command "wsl -l --all -v" | tr -d '\0')"
  distros=$(trim "${distros}")
  distros="$(echo "${distros}" | echo "${distros}" | tail -n +2 |  sed -r 's,^[\*[:space:]]*,,g' | awk '{print $1}')"
  if _CONTAINS -h "$@" || [[ $# -eq 0 ]]; then
    echo "${YELLOW_COL}Usage:${RESET_COL}:  ${FUNCNAME[0]} [-h (help)] [-s (only show command do not execute)] <distro>"
    complete -W "-h $(echo "${distros}" | xargs)" ${FUNCNAME[0]}
    return 1
  fi
  local donotExecute
  [[ ${1} = '-s' ]] && shift && donotExecute=1
  local distroNum=$(echo "${distros}" | grep --color=never -n -E "^${1}$" | awk -F':' '{print $1;}')
  [[ -z ${distroNum} ]] && { echo "Distro ${1} not found." | STDERR; return 1; }
  echo "Launching ${1} as ..."
  echo "${YELLOW_COL}wsl -d \"${1}\" -u root -e sh -c \"/usr/local/bin/wsl-netns.sh ${distroNum}\"${RESET_COL}"
  [[ -z donotExecute ]] && wsl -d "${1}" -u root -e sh -c "/usr/local/bin/wsl-netns.sh ${distroNum}"
}

###############################################################################
# Common utility functions end here.
###############################################################################
# conversion marker: 2
function _get_hostname_completions {
#  if [ ${#COMP_WORDS[@]} -gt 2 ]; then
#    return
#  fi
  local argc=${#COMP_WORDS[@]}
  argc=$[${argc}-1]
  local arglist="${COMP_WORDS[@]}"
  local real_argc=$(nchars ' ' ${COMP_WORDS[@]})
  local user_suggestion
  if [ ${argc} -eq ${real_argc} ]; then
    # User had entered some suggestion
    user_suggestion="${COMP_WORDS[${real_argc}]}"
#    if [ -n ${user_suggestion} ]; then
#      echo ${user_suggestion}
#    fi
  fi
  if isCygwin; then
    { touch ~/.hosts; ipconfig /displaydns | grep --color=never -E 'Record Name.*[[:alpha:]][[:space:]]+$' | grep -v --color=never -E '.*\.arpa$' | tr -d '\r' | awk -F '[ :]' '{print $(NF);}' |  sort | uniq; cat ~/.hosts; } | sort | uniq > /tmp/.hosts;
  else
    cat ~/.hosts | sort | uniq > /tmp/.hosts;
  fi
  mv -f /tmp/.hosts ~/.hosts
  true > /tmp/.hosts
  for h in $(cat ~/.vault_hosts | sed -r 's,^.*/,,' | grep -E "^${user_suggestion//[_-]/\[-_]\{1\}}.*" | head -n 800); do
    echo ${h//_/-}.${HOSTED_CAMPAIGN_DOMAIN} >> /tmp/.hosts
  done
  COMPREPLY=($(compgen -W "$(cat ~/.hosts /tmp/.hosts | rwo -d . | sort -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 | rwo -d . | xargs)" -- "${COMP_WORDS[${argc}]}"))
#  COMPREPLY=($(compgen -W "$(cat ~/.hosts | xargs)" -- "${COMP_WORDS[${argc}]}"))
#  COMPREPLY=($(compgen -W "$({ cat /etc/hosts | grep -E "^[[:digit:]]" | tr -s '[:blank:]' | sed 's,\s, ,' | cut -d ' ' -f2; hostname --fqdn; } | sort | uniq | xargs)" -- "${COMP_WORDS[${argc}]}"))
#  COMPREPLY=($(compgen -W "$({ cat /etc/hosts | grep -E "^[[:digit:]]" | tr -s '[:blank:]' | sed 's,\s, ,' | cut -d ' ' -f2; hostname --fqdn; } | awk '!visited[$0]++' | xargs)" -- "${COMP_WORDS[${argc}]}"))
}
function __schema_autocomplete
{
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  local argc=${#COMP_WORDS[@]}
  # Subtract one for zero based index and the other
  # for ignoring last item corresponding to current suggestion.
  argc=$[${argc}-2]
  [[ ${cur} =~ :.* ]] && cur="${COMP_WORDS[${argc}]}${cur}"
  local prevIndex=$[${argc}-1]
  [[ ${COMP_WORDS[${argc}]} =~ : ]] && cur="${COMP_WORDS[${prevIndex}]}:${cur}"
  local schemaFolder
  local namespaceFolder="${CAMP_AC_ROOT}/nl/build/ncs/datakit/${cur%%:*}"
  if [[ $(nchars : ${cur}) -gt 0 ]]; then
    schemaFolder="${namespaceFolder}/${CAMP_LANG}/schema/${cur#*:}"
  fi
  if [ ! -z ${schemaFolder} ]; then
    local userSuggestion=${COMP_WORDS[COMP_CWORD]#:}
    COMPREPLY=( $(for i in $(compgen -f ${schemaFolder}); do pk=${i#${schemaFolder}}; echo ${userSuggestion}${pk%.*} ; done) )
  else
    COMPREPLY=( $(for i in $(compgen -d ${namespaceFolder}); do echo ${cur}${i#${namespaceFolder}}; done) )
  fi
  return 0
}
function _get_nl_instance_completions {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local argc=${#COMP_WORDS[@]}
  # Subtract one for zero based index and the other
  # for ignoring last item corresponding to current suggestion.
  argc=$[${argc}-2]
  COMPREPLY=()
  if [[ ${COMP_WORDS[${argc}]} = "-instance" ]]; then
    local wdList="$(getCampInstances | xargs)"
    local userSuggestion=${COMP_WORDS[COMP_CWORD]#:}
    COMPREPLY=( $(compgen -W "${wdList}" -- "${userSuggestion}") )
  else
    export NL_OPTIONS=${NL_OPTIONS:="$(nls | sed -r -e "s,^\s*,,g" -e "/^\s*$/d" -e "1,/Available commands.*/d" -e "s/^([[:alnum:]]{0,15}).*/\1/g" | xargs) -instance:"}
    export EMAIL_TEMPLATES=${EMAIL_TEMPLATES:="mail $( csql -Atq --pset=pager=off -d $(getCampaignDatabase) -c 'select sinternalname from nmsdelivery where iismodel=1 and imessageType=0' | sort | xargs)"}
    [[ ${COMP_WORDS[0],,} =~ ^nl.* ]] || { [[ $argc -eq 0 ]] && COMPREPLY=( $(compgen -W "${EMAIL_TEMPLATES}" -- "${cur}") ) || COMPREPLY=( $(compgen -W "-instance:") ); return; }
    [[ $argc -eq 0 ]] && COMPREPLY=( $(compgen -W "${NL_OPTIONS}" -- "${cur}") ) || { compopt -o default; COMPREPLY=( $(compgen -W "-instance:" -- "${cur}") ); }
  fi
  return 0
}
function _get_vault_completions {
  local argc=${#COMP_WORDS[@]}
  argc=$[${argc}-1]
  local arglist="${COMP_WORDS[@]}"
  local real_argc=$(nchars ' ' ${COMP_WORDS[@]})
  local isOrgComplRequest=0
  local isSrvComplRequest=0
  local user_suggestion=''
  if [ ${argc} -eq ${real_argc} ]; then
    # User had entered some suggestion
    user_suggestion="${COMP_WORDS[${real_argc}]}"
    local prevOptIdx=$[${real_argc}-1]
    local option=${COMP_WORDS[${prevOptIdx}]}
    if [ -n ${user_suggestion} ]; then
      [[ X${option,,} = X"-o" ]] && isOrgComplRequest=1
      [[ X${option,,} = X"-s" ]] && isSrvComplRequest=1
    fi
  fi
  if [[ ${isOrgComplRequest} -eq 1 ]]; then
    local server=$(_KEY_HAS_VALUE -s ${arglist})
    if [[ -n ${server} ]]; then
#      echo "${server} is not null in : ${arglist}" > /dev/tty
      COMPREPLY=($(compgen -W "$(cat ~/.vault_hosts | grep -E "/${server}$" | grep -E "^${user_suggestion}.*" | sed -r 's,/.*$,,' | xargs)" -- "${COMP_WORDS[${argc}]}"))
    else
#      echo "${server} is null in : ${arglist}" > /dev/tty
      COMPREPLY=($(compgen -W "$(cat ~/.vault_hosts | grep -E "^${user_suggestion}.*" | sed -r 's,/.*$,,' | xargs)" -- "${COMP_WORDS[${argc}]}"))
    fi
  fi
  if [[ ${isSrvComplRequest} -eq 1 ]]; then
    local org_id=$(_KEY_HAS_VALUE -o ${arglist})
    if [[ -n ${org_id} ]]; then
#      echo "${org_id} is not null in : ${arglist}" > /dev/tty
      COMPREPLY=($(compgen -W "$(cat ~/.vault_hosts | grep -E "^${org_id}/" | sed -r 's,^.*/,,' | grep -E "^${user_suggestion}.*" | xargs)" -- "${COMP_WORDS[${argc}]}"))
    else
#      echo "${org_id} is null in : ${arglist}" > /dev/tty
      COMPREPLY=($(compgen -W "$(cat ~/.vault_hosts | sed -r 's,^.*/,,' | grep -E "^${user_suggestion}.*" | xargs)" -- "${COMP_WORDS[${argc}]}"))
    fi
  fi
}

function _get_vault_sf_completions {
  local argc=${#COMP_WORDS[@]}
  argc=$[${argc}-1]
  local arglist="${COMP_WORDS[@]}"
  local real_argc=$(nchars ' ' ${COMP_WORDS[@]})
  local user_suggestion=''
  if [ ${argc} -eq ${real_argc} ]; then
    # User had entered some suggestion
    user_suggestion="${COMP_WORDS[${real_argc}]}"
    [[ ${user_suggestion:0:3} = "sf_" ]] ||  user_suggestion=sf_${user_suggestion}
    COMP_WORDS[${real_argc}]=${user_suggestion}
  fi
  COMPREPLY=($(compgen -W "$(cat ~/.vault_hosts | grep -E "sf_" | sed -r 's,^.*/,,' | grep -E "^${user_suggestion}.*" | xargs)" -- "${COMP_WORDS[${argc}]}"))
}

function _soapHost_completions {
  local arglist="${COMP_WORDS[@]}"
  local host
  _CONTAINS -s ${arglist} || _CONTAINS -o ${arglist} && [[ ${#arglist[@]} -le 2 ]] && _get_vault_completions $@ && return
  _get_hostname_completions $@
}
__installStandardCampaignPackages_autocomplete()
{
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  if ! _CONTAINS -p "${COMP_WORDS[@]}"; then
    COMPREPLY=( $(compgen -W "$(getCampInstances | xargs)" -- "${cur}") )
  else
    [[ ${cur} = "-p" ]] && cur='' && COMPREPLY='-p ' && return
    local argc=${#COMP_WORDS[@]}
    # Subtract one for zero based index and the other
    # for ignoring last item corresponding to current suggestion.
    argc=$[${argc}-2]
    [[ ${cur} =~ :.* ]] && cur="${COMP_WORDS[${argc}]}${cur}"
    local prevIndex=$[${argc}-1]
    [[ ${COMP_WORDS[${argc}]} =~ : ]] && cur="${COMP_WORDS[${prevIndex}]}:${cur}"
    local pkgFolder
    local namespaceFolder="${CAMP_AC_ROOT}/nl/datakit/${cur%%:*}"
    if [[ $(nchars : ${cur}) -gt 0 ]]; then
      pkgFolder="${namespaceFolder}/package/${cur#*:}"
    fi
    if [ ! -z ${pkgFolder} ]; then
      local userSuggestion=${COMP_WORDS[COMP_CWORD]#:}
      COMPREPLY=( $(for i in $(compgen -f ${pkgFolder}); do pk=${i#${pkgFolder}}; echo ${userSuggestion}${pk%.*} ; done) )
    else
      COMPREPLY=( $(for i in $(compgen -d ${namespaceFolder}); do echo ${cur}${i#${namespaceFolder}}; done) )
    fi
  fi
  return 0
}
__autotest_autocomplete()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local argc=${#COMP_WORDS[@]}
  # Subtract one for zero based index and the other
  # for ignoring last item corresponding to current suggestion.
  argc=$[${argc}-2]
  COMPREPLY=()
  if [[ ${COMP_WORDS[${argc}]} = "-instance" ]]; then
    local wdList="$(getCampInstances | xargs)"
    local userSuggestion=${cur#:}
    COMPREPLY=( $(compgen -W "${wdList}" -- "${userSuggestion}") )
  else
    local testsRootfolder="$(getCampRoot)/nl/test/autotest/tests/"
    COMPREPLY=( $(for i in $(compgen -fd ${testsRootfolder}${cur}); do echo ${i#${testsRootfolder}}; done; echo -instance: ; ) )
  fi
  return 0
}
function 2web_ui {
  if isCygwin; then
    local nodePath
    which node | grep '/nl/build' > /dev/null
    [[ $? -eq 0 ]] && nodePath=$(trim "$(echo $PATH | tr ':' '\n' | grep "/cygdrive" | grep node | head -n 1)")
    [[ -z ${nodePath} ]] || export PATH="${nodePath}:${PATH}"
    echo "Using node version $(trim $(node --version)), Yarn version: $(trim $(yarn --version))"
    trim $(node --version) | grep -v v0 > /dev/null
    [[ $? -eq  0 ]] || installNode
    type yarn > /dev/null 2>&1
    [[ $? -eq  0 ]] || { for npkg in yarn cross-env; do type ${npkg} > /dev/null 2>&1 || npm install -g $npkg; done; npm fund; yarn install; }
  fi
  [[ -z ${NPM_TOKEN} ]] && { NPM_TOKEN="$(cat ~/.npmrc | cut -d=  -f2-)" && cacheEnvVar -f NPM_TOKEN ${NPM_TOKEN}; add2HostsFile localhost.corp.adobe.com 127.0.0.1; }
  cd ${ACC_WEB_UI}
  cmp -s .npmrc ./build/npmrc.model
  [[ $? -eq 0 ]] || {  git checkout -f .npmrc; git checkout -f ./build/npmrc.model; rm -f ~/.npmrc; npm login; unset NPM_TOKEN; NPM_TOKEN="$(cat ~/.npmrc | cut -d=  -f2-)" && cacheEnvVar -f NPM_TOKEN ${NPM_TOKEN}; cp -f ./build/npmrc.model .npmrc; yarn install; }
  launch yarn start:shell
  wps -Command "Start-Process 'https://experience-qa.${ADOBE_DOMAIN}/?shell_source=dev&shell_devmode=true#/@onlycampaign/so:accintg-dev90.rd${HOSTED_CAMPAIGN_DOMAIN}/acc/home'"
}
# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i -p'
alias mv='mv -i'
alias c=clear
# imp  commands
alias psug='ps -o pid,euid,ruid,suid,egid,rgid,sgid,cmd -p ' # $pid
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
alias less='less -r'                          # raw control characters
alias LESS="LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s' LESS='-RS#3NM~g' $(which less)"
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -Al'                             # all but . and ..
alias l='ls -CF'                              #
alias ltags='git log --tags --simplify-by-decoration --pretty="format:%ai %d"'
alias thread='ps huH p'
alias h=history2
alias cd=cd_func
alias cb=currentBranch
alias dl=download
alias g="\"$(which git)\""
alias gam=gitAddAllModified
alias getCampDB=getCampaignDatabase
alias perf_sql='pgsql -Atq --pset=pager=off --o /dev/null -c "\timing"'
alias o=openTerm
alias cv=connectVPN
alias dv=disconnectVPN
alias cp2j=cpToJumpHost
alias cp2r=scpToRemote
alias cp4j=cpFromJumpHost
alias cp4r=scpFromRemote
alias exc=execute_containers
alias sshj='ssh ${SSHR_OPTS} $(whoami)@$(getJumpHost)'
alias gs=gSync
alias buildCamp=buildsolutionInIDE
alias dss=getDebugSymbolPath
alias 2conf='cd $CAMP_AC_ROOT/nl/build/ncs/conf'
alias 2envsetup='cd $CAMP_AC_ROOT/../acc-dev/acc-dev-setup'
alias 2integro='cd $CAMP_AC_ROOT/../v6SOAPAPI/Adobe-Campaign/'
alias 2logs='cd $CAMP_AC_ROOT/nl/build/ncs/var/'
alias 2root='cd $CAMP_AC_ROOT/nl'
alias 2bin='cd ${NL_DBG_BIN_DIR}'
# [[ "$(sed 's/.*/\U&/' <<< X${EXPERT_MODE:0:1})" =~ X[Y1T] ]] && alias local='' # Causes python supplied autocomplete to stop working.
alias e=openInUIWindow
alias ed=editor
alias nlc=nlclient
alias gvc=getVaultCreds
alias grab=captureScreen
alias r=restartCampaign
alias cst=startCampaign
alias csp=stopCampaign
alias ide=openSolutionInIDE
alias smtpSt=runFakeSmtpServer
alias getLatestbashrc=getbashrc
alias str=findStringOccurances
alias slogin=soapLogOnAPI
alias slogout=soapLogOutAPI
alias '..'='cd ..'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [[ -z BASH_COMPLETION_VERSINFO ]]; then
  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi
fi
complete -W '-eth -host -vpn -wifi -pub' getIP
! isCygwin && complete -W '-eth -host -vpn -pub' getIP
complete -W 'cygwin debian ubuntu' sw2
complete -F _get_vault_completions -W '-o -s -h' gvc getVaultCreds
complete -F _get_vault_sf_completions sfsql
complete -F __schema_autocomplete soapGetWSDL
complete -o nosort -o nospace -F _get_nl_instance_completions nls nlserver sendDelivery
# https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial
complete -F _get_hostname_completions cp4r execute_containers exc ping scp ssh
complete -F _get_hostname_completions -W 'clean db ssh tunnel' sshr
complete -F _soapHost_completions -W 'admin internal' soapLogOnAPI slogin
complete -F _soapHost_completions soap_rtest containers soapGetTrackingLogs
complete -f -o nosort -F _get_hostname_completions cp2r
# -A hostname does not generate new hostnames on the fly i.e as /etc/hosts keeps getting updated.
# you have open a new terminal in order to update hostname list.
# complete -A hostname ping ssh scp
complete -o nosort -W 'apache autotests connectVPN capture inMail make nlserver nlclient pop3 smtpMailServer smsServer wslinit' wcrun
complete -W 'apache campinst campstdpackages cmake cygwin debian9 git gh gradle intelliJ javaIDE java maven mssqlclient newrelic node osenv perf-stk-acc postgres powershell pr python sharedMemTools snowflake sshkeys tesseract vault visualstudio video ffmpeg' wcinstall
complete -o nospace -F __installStandardCampaignPackages_autocomplete installStandardCampaignPackages
complete -o nospace -o nosort -F __autotest_autocomplete runautotests
complete -W '-h -i -v -OfWindowTitle' grab captureScreen
complete -W '-explain' csql
complete -W 'start stop status version info -V' apache
# complete  -o nosort -W "-h $(declare -F | awk '{print $3}' | grep -Ev '^_' | xargs)" load
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
if [[ $(( BOOT_OPTIONS & 8 )) -ne 0 ]]; then
  getbashrc &
  disown $!
fi
[[ -f ~/.after.sh ]] && source ~/.after.sh
trap 'cacheEnvVar -r MONITOR_WINPID' SIGUSR1
monitor > /dev/null 2>&1 &
_TE bashrc_script $LINENO
