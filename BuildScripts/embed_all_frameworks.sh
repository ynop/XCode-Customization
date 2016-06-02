mkdir -p ${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}

for f in ${BUILT_PRODUCTS_DIR}/*.framework
do
    echo "Embbed Framework "$(basename $f)
                               
    e=${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/$(basename $f)
    cp -r $f $e
done