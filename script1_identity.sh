# --- Variables ---
STUDENT_NAME="Vikalp Pratap Yadav"
SOFTWARE_CHOICE="Git"

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S')

# Attempt to get the OS distribution name safely
if [ -f /etc/os-release ]; then
    # Source the os-release file to get the PRETTY_NAME variable
    . /etc/os-release
    DISTRO_NAME=$PRETTY_NAME
else
    DISTRO_NAME="Unknown Linux Distribution"
fi

# --- Display ---
echo "=================================================="
echo "          The Open Source Audit                   "
echo "=================================================="
echo "Student : $STUDENT_NAME"
echo "Audit   : $SOFTWARE_CHOICE"
echo "--------------------------------------------------"
echo "System  : $DISTRO_NAME"
echo "Kernel  : $KERNEL"
echo "Date    : $DATE_TIME"
echo "User    : $USER_NAME"
echo "Uptime  : $UPTIME"
echo "--------------------------------------------------"
echo "License Note: The Linux kernel running this system"
echo "is proudly protected by the GPL v2 open-source"
echo "license, guaranteeing your freedom to study it."
echo "=================================================="
