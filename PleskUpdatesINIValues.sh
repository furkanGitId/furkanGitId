#!/bin/bash
#This script will get all registered PHP Handlers in a Plesk System, and updates the INI Values
#Modify INI Values Accordingly

getFiles() {
        plesk bin php_handler --list | awk '{print $8}' | grep "php.ini" | while read line; do ExecVal; done
}

ExecVal() {
echo "Modifying $line .."; sed -i 's/memory_limit\s*=.*/memory_limit = 4096M/g' $line
echo "Modifying $line .."; sed -i 's/max_execution_time\s*=.*/max_execution_time = 3600/g' $line
echo "Modifying $line .."; sed -i 's/max_input_time\s*=.*/max_input_time = 600/g' $line
echo "Modifying $line .."; sed -i 's/..max_input_vars\s=.*/max_input_vars = 5000/g' $line
echo "Modifying $line .."; sed -i 's/zlib.output_compression\s*=.*/zlib.output_compression = On/g' $line
echo "Modifying $line .."; sed -i 's/.zlib.output_compression_level\s*=.*/zlib.output_compression_level = 5/g' $line
}

getFiles
