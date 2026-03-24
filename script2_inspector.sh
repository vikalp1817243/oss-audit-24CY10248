#!/bin/bash

# Script 2: FOSS Package Inspector
# Author: Vikalp Pratap Yadav
# Description: Checks installation status of key FOSS packages and prints a summary.
# Concepts: if-then-else, case statement, dpkg (or rpm), pipe with grep.

# We will check the software chosen for the audit: git
PACKAGE="git"

echo "Inspecting package: $PACKAGE..."
echo "--------------------------------------"

# Check if package is installed. 
# Using dpkg -s for Debian/Ubuntu systems. (If on RedHat, use rpm -q $PACKAGE)
if dpkg -s "$PACKAGE" &> /dev/null; then
    echo "[SUCCESS] $PACKAGE is installed on this system."
    
    # Extract version and maintainer info using pipe and grep
    dpkg -s "$PACKAGE" | grep -E '^Version|^Maintainer|^Architecture'
    
    echo "--------------------------------------"
    echo "Philosophical Summary:"
    
    # Case statement to print a one-line philosophy based on the package name
    case "$PACKAGE" in
        git) 
            echo "Git: The distributed engine of global collaboration, born from necessity." 
            ;;
        apache2|httpd) 
            echo "Apache: The web server that essentially built the open internet." 
            ;;
        mysql|mysql-server) 
            echo "MySQL: Open source data storage at the heart of millions of apps." 
            ;;
        vlc) 
            echo "VLC: The media player that plays anything, built by students for freedom." 
            ;;
        *) 
            echo "A valuable piece of the open-source puzzle." 
            ;;
    esac

else
    echo "[WARNING] $PACKAGE is NOT installed."
    echo "You can install it using: sudo apt install $PACKAGE"
fi
echo "======================================"

# --- Explanation for the Report ---
# What it does: This script verifies if the audited software (Git) is installed on the local machine. 
# If it is, it extracts the version details and uses a case statement to output a customized, 
# philosophical description of the tool.
# Concepts used: I utilized an `if-then-else` block coupled with standard output redirection 
# `&> /dev/null` to silently test the exit status of `dpkg -s`. I used pipes `|` and `grep -E` 
# with regular expressions to filter the package details, and a `case` statement to handle 
# multiple potential software choices cleanly.
