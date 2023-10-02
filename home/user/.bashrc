function sshi { ssh user@"$1".domain.com -p22; }
export -f sshi
function ssht { ssh -L port_local:127.0.0.1:port_distant user@"$1".domain.com -p22 -4 -g -N; }
export -f ssht

alias diff=diff
function diff() {
    d=$(date "+%d-%m-%y_%H:%M:%S")
    if [ -z $1 ]; then
        echo give a diff id
    elif [ -z $2 ]; then
        echo patch made at $d
        svn diff -r $1:HEAD > ~/diff_$d
    else
        echo patch made at $d
        svn diff -r $1:$2 > ~/diff_$d
    fi
}

alias adb=adb
function adb() {
    adb devices
    while true; do
        read -p "Install (y/n) ? " yn
        case $yn in
            [Yy]* ) adb install app.apk; break;;
            [Nn]* ) exit;;
        esac
    done
}

alias lt="python3 ~/ls_time.py"

alias bls=bls
function bls() {
     ssh -t user@domain.com "ls \"$1\""
}
alias bscpp=bscpp
function bscpp() {
     echo "Downloading $1 from server1"
     (scp user@domain1.com:~/$1 ~/dl) && [[ $2 ]] && (echo "Uploading $1 to $2") && (scp -Pport ~/dl/$1 user@$2:~)
}
