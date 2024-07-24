#!/bin/bash

# Variables
CONTAINER_NAME="londinium-mysql-1"
DB_USERNAME="laravel"
DB_PASSWORD="laravel"
DB_DATABASE="release-testing"
DUMP_FILE="/tmp/dumpfile.sql"
LOCAL_BACKUP_DIR="/home/hassan"

# Create MySQL dump inside the container
echo "Creating MySQL dump..."
docker exec -it $CONTAINER_NAME /usr/bin/mysqldump -u $DB_USERNAME -p$DB_PASSWORD $DB_DATABASE > $DUMP_FILE

# Check if the dump was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create MySQL dump."
    exit 1
fi

# Copy the dump file to the local machine
echo "Copying dump file to local machine..."
docker cp $CONTAINER_NAME:$DUMP_FILE $LOCAL_BACKUP_DIR

# Check if the copy was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy dump file to local machine."
    exit 1
fi

# Clean up the dump file inside the container
echo "Cleaning up dump file inside the container..."
docker exec -it $CONTAINER_NAME rm $DUMP_FILE

# Check if the cleanup was successful
if [ $? -ne 0 ]; then
    echo "Warning: Failed to clean up dump file inside the container."
else
    echo "Cleanup successful."
fi

echo "Backup completed successfully."
