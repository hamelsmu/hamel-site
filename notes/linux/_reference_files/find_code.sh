

# Hamel: you don't need this.  Just use ack

# $(find ./ -type f \( -iname \*.md -o -iname \*.sh -o -iname \*.ipynb \))
find_code() { 
    MATCH="$@" 
    for file in $(find ./ -type f);
    do 
        results=`grep -rnh --include="*.py" --include="*.md" --include="*.sh" --include="*.ipynb" -A5 -B5 "$MATCH" "${file}"`
        if [[ ! -z $results ]]; then
            echo '\n\n========================================================='
            echo ${file}
            echo '========================================================='
            echo $results
        fi
    done 
}



