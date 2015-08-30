#!/bin/env sh
MAILDIR=$HOME/.mail/gmail/INBOX/new
TIMEOUT=0
ICON='/usr/share/icons/Adwaita/32x32/actions/mail-message-new.png'

mailpop() {
    # popup a small notification with 'notify-send'

    from=`formail -X From: < $1`
    sub=`formail -X Subject: < $1`

    # tweaks < > are special
    from=${from//</\(}
    from=${from//>/\)}
    from=${from//&/\.}
    sub=${sub//</\(}
    sub=${sub//>/\)}
    sub=${sub//&/\.}

    sub=${sub:0:200}
    from=${from:0:75}

    /usr/bin/notify-send -i "$ICON" -u normal -t $TIMEOUT "$from" "$sub"

    #while pgrep speech2 > /dev/null; do sleep 1; done
    #speech2 New Email ${from%(*}, With $sub, has arrived
    #echo "New Email $from, With $sub has arrived" | festival --tts
}

while MAILNAME=$(inotifywait -qe MOVED_TO --format '%f' $MAILDIR)
do
	echo $MAILNAME
	mailpop $MAILDIR/$MAILNAME
done
