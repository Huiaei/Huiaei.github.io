:: 
find . -mindepth 2 -name "*.md" | awk -F'/' 'BEGIN {RS=".md"} {arr[$2]=arr[$2]"\n    - ["$3"](/"$2"/"$3")"} END { num = asorti(arr, indices); for (i=1; i<=num; ++i) if (indices[i]) print "- "indices[i], arr[indices[i]]}' > _sidebar.md
:: Copy From https://sspai.com/post/55786