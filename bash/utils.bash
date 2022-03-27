function config () {
  cd ~/.config $@
}

function ir () {
  cd ~/code/ribeiro $@
}

function ilabs () {
  cd ~/code/ribeirolabs $@
}


function trafi () {
  cd ~/code/trafilea $@
}


function dotfiles () {
  ir dotfiles
}

function dotfiles-push () {
  dotfiles
  git commit -am 'update'
	ggp
}

function clear-swap () {
	sudo swapoff -a && sudo swapon -a
}

# Python HTTP Server
function server() {
  python -m SimpleHTTPServer
}

# Parse JSON
function get-json () {
  python -c "import sys, json; print json.load(sys.stdin)$2" < $1
}

# Find text in files on current folder
function find-in-files () {
  dir='./'
  r="$1"

  if [[ $2 ]]; then
    dir=$1
    r="$2"
  fi

   grep --exclude-dir={.git,node_modules,dist,.next} -rnw "$r" -P $dir
}

# Copy command to clipboard
function xcopy () {
  xclip -sel c $@
}

# Paste from clipboard
function xpaste () {
  xclip -sel c -o
}

# Display all the IPs from `ifconfig`, asks for one and copy to clipboard
function copy-ip () {
  ips=$(ifconfig | grep -P '^\w' -1 | grep -P 'inet [\d\.]+' -o | grep -P '[\d\.]+' -o)
  array=($(echo "$ips" | tr ',' '\n'))
  i=0

  for ip in $ips; do
    echo "($i) $ip"
    ((++i))
  done

  read -p "Enter your choice and press [ENTER]: " choice

  ip=${array[choice]}
  echo -n $ip | xcopy

  clear
  echo "IP $ip copied to clipboard!"
}

# Create directory recursively and enter the directory
function mkd () {
  mkdir -p $1
  cd $1
}

# MKV -> MP4
function to-mp4 () {
  filename=$1
  no_extension="${filename%.*}"
  extension="${filename##*.}"

  ffmpeg -i $filename -vcodec copy -c:a aac "$no_extension.mp4"
}

function trim-video () {
  if [ "$1" = "" ] || [ "$2" = "" ]
  then
    echo "Usage: trim-video FILENAME START FINISH (optional)"
    return
  fi

  filename=$1
  start="-ss $2"
  finish=""

  if [ "$3" != "" ]
  then
    finish="-to $3"
  fi

  extension="${filename##*.}"
  no_extension="${filename%.*}"

  ffmpeg $start -i $filename $finish -c copy "${no_extension}-CROP.${extension}"
}

function to-gif () {
  if [ "$1" = "" ]
  then
    echo "Usage: to-gif FILENAME"
    return
  fi

  filename=$1
  no_extension="${filename%.*}"

  # ffmpeg -i $filename -filter_complex "[0:v] palettegen" palette.png
  # ffmpeg -i $filename -i palette.png -filter_complex "[0:v][1:v] paletteuse" "$no_extension.gif"

  ffmpeg -i $filename -filter_complex "[0:v] fps=12,scale=480:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" "$no_extension.gif"
}

function show-size () {
  du -sh * | sort -rn
}

