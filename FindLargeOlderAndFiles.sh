#!/bin/bash

#clean all php cache
yum_clean_cache()
{
        yum clean all
}

#Find large logs
check_larger_logs()
{
        Large_Logs=large_logs_$(date "+%Y.%m.%d")
        touch $Large_Logs
        find /var/log/ -type f -size +100M -exec du -sh {} \;  |  sort -h > $Large_Logs
}

#Find older logs
check_older_logs()
{
        Old_Logs=old_logs_$(date "+%Y.%m.%d")
        touch $Old_Logs
        find /var/log/ -type f -mtime +30 -exec du -sh {} \;  |  sort -h > $Old_Logs

}

#Find large Files
check_larger_files()
{
        Large_Files=large_files_$(date "+%Y.%m.%d")
        touch $Large_Files
        find /home/ -type f -size +100M -exec du -sh {} \;  |  sort -h > $Large_Files
}

yum_clean_cache
check_larger_logs
check_older_logs
check_larger_files

