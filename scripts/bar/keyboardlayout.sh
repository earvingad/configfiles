case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000000") KBD="Latam" ;;
  "00001000") KBD="Dvorak" ;;
  *) KBD="unknown" ;;
esac

printf "$KBD"
