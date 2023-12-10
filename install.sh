dotfiles="$(find . -name ".*" -type f)"

for f in $dotfiles; do
    bn="$(basename $f)"
    src="$(pwd)/${bn}"
    dst="${HOME}/${bn}"
    if [ -e "${dst}" ]; then
        if [ ! -L "${dst}" ]; then
            read -p "${dst} already exists. Continue (y/n)?" choice
            case "$choice" in
                y|Y ) rm "${dst}";;
                * ) echo "Skipping." ; continue;;
            esac
        else
            rm "${dst}"
        fi
    fi
    ln -s "${src}" "${dst}"
done

