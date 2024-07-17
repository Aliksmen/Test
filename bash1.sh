get_size() {
	local	path="$1"
	local	size=$(du -sh "$path" | cut -f1)
	echo $size 
}
IFS=$'\n' 
for item in $(ls -a); do
	if [[ "$item" == ".." ]]; then
		continue
	fi
	size=$(get_size "$item")
	echo -e "$item\t$size"
done | sort -hr -k2
