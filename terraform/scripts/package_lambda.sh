#!/bin/bash

echo "Running package_downloader.sh"
cd $current_directory

requirements_file=$source_code_path/requirements.txt
module_directory=$module_dir_path
build_directory=$build_dir_path

mkdir -p $module_directory
mkdir -p $build_directory

# install dependencies from requirements.txt
if [[ -f "$requirements_file" ]]; then
    echo "Found requirements.txt file"
    echo "Installing..."
    pip3 install -r "$requirements_file" --target $module_directory
else
    echo "Error: requirements.txt file not found"
    exit 1
fi


cp $source_code_path/*.py $module_directory


# Zip the entire modules directory into build directory
cd $module_directory
zip -r $build_directory/python_files.zip .
echo "Successfully Finished package_downloader.sh"