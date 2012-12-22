#!/bin/sh

# city=85 # Tokyo
city=47 # Kyoto

# curl --silent "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c"|egrep '(Low:)'|sed -e 's/<br \/>//'
# curl --silent "http://xml.weather.yahoo.com/forecastrss?p=JAXX0085&u=c" | grep -E '(Forecast:<b><br />|High)' | sed -e 's/Forecast://' -e 's/<br \/>//' -e 's/<b>//' -e 's/<\/b>//' -e 's/<BR \/>//' -e 's/<description>//' -e 's/<\/description>//'

# TODO: 束ねる
# TODO: 揃える
# TODO: egrep
curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | egrep '(<title>Conditions)' | sed -e 's/<title>Conditions for //' | sed -e 's/<\/title>//'
curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | egrep '(High:)' | sed -e 's/<br \/>//' | sed -e 's/ High: //' | sed -e 's/ Low: /\//' | column -t -s '.'
# curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | egrep '(High:)' | sed -e 's/<br \/>//' | column -t -s '.' | column -t -s ':'
# curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | egrep '(High:)' | sed -e 's/<br \/>//' | column -t -s '.' | column -t -s ':' | sed -e 's/ High /H:/' | sed -e 's/ Low /L:/'
# curl -s "http://xml.weather.yahoo.com/forecastrss?p=JAXX00${city}&u=c" | egrep '(High:)' | sed -e 's/<br \/>//' | column -t -s '.' | sed -e 's/ High:/H:/' | sed -e 's/Low:/L:/'
