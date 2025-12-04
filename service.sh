#!/sbin/sh

# disable googay stuff
pm disable com.google.android.gms/.chimera.GmsIntentOperationService
pm disable com.google.android.gms/com.google.android.gms.nearby.discovery.service.DiscoveryService
pm disable com.google.android.gms/com.google.android.gms.nearby.messages.service.NearbyMessagesService

# force doze mode
dumpsys deviceidle force-idle
settings put global forced_app_standby_enabled 1

# check power efficient gorvenor
echo 'Checking for power efficient..'
if [ -f /sys/module/workqueue/parameters/power_efficient ]; then
    echo 'Supported..'
    echo 'Y' > /sys/module/workqueue/parameters/power_efficient
else
    echo 'Not supported!.. Skipping..'
fi