# Fixed inputs for the byte-for-byte pre-refactor selector snapshot.
render_app_display_fixtures() {
    local locale width i
    local -a names=("App" "-n" "中文应用程序很长很长" "Café combine" "👩‍💻 Editor" $'bad\033[31m\tname\nend' "A very long application name with spaces" $'back\\slash' "")
    local -a sizes=("0" "Unknown" "1023.5MB" "N/A (Steam-managed)" "--" "5GB" "" "N/A" "1KB")
    local -a used=("Never" "Yesterday" "3 months ago" "12 weeks ago" "This year" "a very long last-used value" $'Today\n\n' "-n" "")
    for locale in C en_US.UTF-8; do
        for width in 30 40 80 120; do
            for ((i = 0; i < ${#names[@]}; i++)); do
                printf '%s:%s:%s|' "$locale" "$width" "$i"
                LC_ALL="$locale" format_app_display "${names[$i]}" "${sizes[$i]}" "${used[$i]}" "$width"
                printf '\n'
            done
        done
    done
}
