# A shell script for unzipping all zip files in a folder/directory

MAIN_DIR="folder"

# Create main folder if needed
if [ ! -d $MAIN_DIR ]; 
then
    mkdir $MAIN_DIR
fi

for zip in *.zip; do 
    echo "Unzipping $zip..."
    
    # remove the file ending (.zip)
    nameLength=${#zip}
    dirName=${zip:0:$nameLength-4}
   
    # create sub folder and unzip if it doesn't exist
    if [ ! -d $MAIN_DIR/$dirName ]; 
    then
        unzip -q $zip -d $MAIN_DIR/$dirName
    else
        echo "Directory with name '$dirName' already exists in '$MAIN_DIR'."
    fi

done
echo "Unzipped all possible files."
