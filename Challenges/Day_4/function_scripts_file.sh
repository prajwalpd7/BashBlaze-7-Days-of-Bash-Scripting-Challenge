#!/bin/bash

view_system_metrics () {
    cpu_usage=`top -bn2 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,' | awk -v cores=$(nproc --all) '{print "CPU Usage: " ($8/cores) "%"}'`
    memory_usage=`free | grep Mem | awk '{print "Memory usage: " $3/$2 * 100.0 "%"}'`
    disk_usage=`df --total -hl | grep total | awk '{print "Disk usage: " $5}'`

    echo "$cpu_usage " " $memory_usage " " $disk_usage"
}