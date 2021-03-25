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
