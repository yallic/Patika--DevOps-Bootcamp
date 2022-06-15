#!/bin/bash

while :;do
  disk_usage=$(df | awk '{if($5 > 90) print $5}')
  disk=$(df | awk '{if($5 > 90) print $6}')
  NOW=$(date)
  mail -s "$disk Disk usage Alert: $disk_usage" fatihyallic@gmail.com <<< "The partition ${disk} has used ${disk_usage} at $NOW"

  sleep 10s
done