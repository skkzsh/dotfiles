#!/bin/sh

: << POD
=head1 NAME

weather.sh - Get Japan Weather Forecast

=head1 SYNOPSIS

weather.sh [-n Code] [-c CityName] [-h]

 |  City | Code |
 |-------+------|
 | Tokyo |   85 |
 | Osaka |   71 |
 | Kyoto |   47 |

=cut
POD

# TODO: $(basename $0)

#---------------------------------------------------------------------------
# Default Code
code=71

#---------------------------------------------------------------------------
# Option Analysis
while getopts n:c:h opt ; do
    case $opt in
        n)  code=$OPTARG; flg_n=1 ;;
        c)  city=$OPTARG; flg_c=1 ;;
        h | \? | *)
            pod2usage $0
            exit 1
            ;;
    esac
done
shift `expr $OPTIND - 1`

## TODO: Exception Handling (-n & -c)

#---------------------------------------------------------------------------
# Convert Name -> Number
if [ $city ]; then

    # city="`tr '[:upper:]' '[:lower:]' <<< $city`"
    city="`echo $city | tr '[:upper:]' '[:lower:]'`"

    case $city in
        tokyo) code=85 ;;
        osaka) code=71 ;;
        kyoto) code=47 ;;
        *)
            pod2usage $0
            exit 1
            ;;
    esac

fi

#---------------------------------------------------------------------------
# Get Weather Forecast

url="http://xml.weather.yahoo.com/forecastrss?p=JAXX00${code}&u=c"

# curl -s "$url" | grep 'Low:' | sed 's/<br \/>//'
# curl -s "$url" | grep -E '(Forecast:<b><br />|High)' | sed -e 's/Forecast://' -e 's/<br \/>//' -e 's/<b>//' -e 's/<\/b>//' -e 's/<BR \/>//' -e 's/<description>//' -e 's/<\/description>//'

# TODO: 束ねる
# TODO: 揃える
# TODO: egrep
curl -s "$url" | grep '<title>Conditions' | sed 's/<title>Conditions for //' | sed 's!</title>!!'
curl -s "$url" | grep 'High:' | sed 's!<br />!!' | sed 's/ High: //' | sed 's! Low: !/!' | column -t -s '.'
# curl -s "$url" | grep 'High:' | sed 's!<br />!!' | column -t -s '.' | column -t -s ':'
# curl -s "$url" | grep 'High:' | sed 's!<br />!!' | column -t -s '.' | column -t -s ':' | sed 's/ High /H:/' | sed 's/ Low /L:/'
# curl -s "$url" | grep 'High:' | sed 's!<br />!!' | column -t -s '.' | sed 's/ High:/H:/' | sed 's/Low:/L:/'

exit 0
