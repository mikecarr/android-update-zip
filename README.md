# Android Update Zip Creations tools

## Set of tools used to create android update files

create-zip.sh     :  zips up data and META-INF folders to the out folder

resync.sh         :  cleans folders and pulls fresh copy from git

### APK's

All the apps that you want to add in the archive and install on the phone, must have the .apk 
extension and you have to put them in /data/app . Then, if you want also the app data files, 
you have to take these files from your phone, going with a rooted file manager (i suggest 
Root_Explorer) to /data/data , copying the app folder and pasting it in /data/data of the UPDATE.ZIP.

Put apks in the following folder:
   
    data/app/APPLICATION.APK
    
Put apk's data in the following folder:

    data/data/APPLICATION/DATA'APPLICATION'.txt

So we have all the apps and data that we want. Now, we have to write the script.
Go to META-INF/com/google/android/ and open 'updater-script' with a simple text editor.
The only lines that you have to modify are: 

    set_perm(1000, 1000, 0644, "/data/app/[PACKAGE].apk");
    set_perm_recursive(1000, 1000, 0777, 0777, "/data/data/PACKAGE_DATA_FOLDER");
    delete("/data/dalvik-cache/data@app@[PACKAGE].apk@classes.dex");

For each app you have to write these lines. This is an example if you want to put 
ROOT_EXPLORER.APK in the UPDATE.ZIP:

    set_perm(1000, 1000, 0644, "/data/app/ROOT_EXPLORER.APK");
    set_perm_recursive(1000, 1000, 0777, 0777, "/data/data/ROOT_EXPLORER_DATA_FOLDER");
    delete("/data/dalvik-cache/data@app@ROOT EXPLORER@classes.dex");

That' all. But if you want to delete some apps from your phone, you have to write between

    ui_print("| 80%  Installing Applications |");
    
    package_extract_dir("data", "/data");
    
    delete("/APK_DIR/APP.APK");
    
**_IT'S IMPORTANT TO LEAVE AN EMPTY LINE AT THE END OF THE SCRIPT, OTHERWISE THE ZIP WON'T WORK!_**



I am a total rookie at this, I have to start somewhere.

http://forum.xda-developers.com/showthread.php?t=1610121