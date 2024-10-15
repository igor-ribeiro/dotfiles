function get_internal_monitor() {
  xrandr | rg " connected " | rg eDP | cut -d' ' -f1
}

function get_displayport_monitor() {
  local DISPLAY_PORT=$(xrandr | rg " connected " | rg ^DP | cut -d' ' -f1)

  if [ -n "$DISPLAY_PORT" ]; then
    echo $DISPLAY_PORT
    return
  fi

  echo -e "No Display Port monitors connected"
}

function get_hdmi_monitor() {
  local HDMI=$(xrandr | rg " connected " | rg HDMI | cut -d' ' -f1)

  if [ -n "$HDMI" ]; then
    echo $HDMI
    return
  fi

  echo -e "No HDMI monitors connected"
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
