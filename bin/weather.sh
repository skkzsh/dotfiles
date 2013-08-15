#!/bin/sh
: << POD
=head1 SYNOPSIS

Get Weather Forecast

=cut
POD

# city=85 # Tokyo
city=71 # Osaka
# city=47 # Kyoto

# curl --silent "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | grep 'Low:' | sed 's/<br \/>//'
# curl --silent "http://xml.weather.yahoo.com/forecastrss?p=JAXX0085&u=c" | grep -E '(Forecast:<b><br />|High)' | sed -e 's/Forecast://' -e 's/<br \/>//' -e 's/<b>//' -e 's/<\/b>//' -e 's/<BR \/>//' -e 's/<description>//' -e 's/<\/description>//'

# TODO: 束ねる
# TODO: 揃える
# TODO: egrep
curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | grep '<title>Conditions' --color=never | sed 's/<title>Conditions for //' | sed 's!</title>!!'
curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | grep 'High:' --color=never | sed 's!<br />!!' | sed 's/ High: //' | sed 's! Low: !/!' | column -t -s '.'
# curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | grep 'High:' | sed 's/<br \/>//' | column -t -s '.' | column -t -s ':'
# curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | grep 'High:' | sed 's/<br \/>//' | column -t -s '.' | column -t -s ':' | sed 's/ High /H:/' | sed 's/ Low /L:/'
# curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | grep 'High:' | sed 's/<br \/>//' | column -t -s '.' | sed 's/ High:/H:/' | sed 's/Low:/L:/'
