function get_internal_monitor() {
  xrandr | rg " connected " | rg eDP | cut -d' ' -f1
}

function get_external_monitor() {
  xrandr | rg " connected " | rg HDMI | cut -d' ' -f1
}

function get_virtual_monitors() {
  set -o pipefail

  local FROM_MONITOR=$1

  if [ -z "$FROM_MONITOR" ]; then
    echo -e "
USAGE:
  $> get_virtual_monitors <BASE_MONITOR>

EXAMPLE:
  $> get_virtual_monitors HDMI-0
  HDMI-0-1
  HDMI-0-1
"
    return 1
  fi

  xrandr --listactivemonitors | rg ": $FROM_MONITOR" | cut -d' ' -f3
}
