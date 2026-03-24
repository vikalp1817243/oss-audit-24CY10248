#!/bin/bash

# Array of standard system directories, plus the local user's git config directory
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "$HOME/.git")

echo "========================================================"
echo "          Directory Space and Permission Audit          "
echo "========================================================"
printf "%-25s | %-12s | %-10s\n" "Directory" "Permissions" "Size"
echo "--------------------------------------------------------"

# Loop through each item in the array
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists on this system
    if [ -d "$DIR" ]; then
        # Use stat to get human-readable permissions string (e.g., drwxr-xr-x)
        # Using stat is often cleaner than ls -ld | awk
        PERMS=$(stat -c "%A" "$DIR" 2>/dev/null)
        
        # Get the size using du -sh, suppress errors for restricted folders, cut first field
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        # If size is empty (due to severe permission denial), set to 'Denied'
        if [ -z "$SIZE" ]; then
            SIZE="Denied"
        fi
        
        # Print formatted output
        printf "%-25s | %-12s | %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        printf "%-25s | %-12s | %-10s\n" "$DIR" "NOT FOUND" "N/A"
    fi
done
echo "========================================================"

