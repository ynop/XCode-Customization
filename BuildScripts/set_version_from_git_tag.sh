echo $INFOPLIST_FILE
echo $INFOPLIST_PATH

git_current_tag=$(git describe --tags --always --abbrev=0)
git_current_commit=$(git rev-parse HEAD | cut -c1-10)

target_plist=${PROJECT_DIR}/${INFOPLIST_FILE}
fmwk_plist=${PROJECT_DIR}/${INFOPLIST_PATH}

for plist in "$target_plist" "$fmwk_plist"; do
    if [ -f "$plist" ]; then
        /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $git_current_commit" "$plist"
        /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $git_current_tag" "$plist"
    fi
done