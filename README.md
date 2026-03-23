# Open Source Audit - Capstone Project
### Student Name: Vikalp Pratap Yadav
### Roll Number: 24BCY10248
### Chosen Software: Git
## Project Overview

This repository contains the shell scripts and documentation for the "Open Source Audit" Capstone Project for the Open Source Software (OSS) course. The project explores the philosophy, Linux footprint, and technical ecosystem of Git, alongside practical bash scripting demonstrations.

#### Included Scripts
The following five bash scripts demonstrate practical Linux automation and concepts.

+ **Script 1**: System Identity Report (script1_identity.sh) 
   
   **Description**: Acts as a welcome screen. It fetches and formats system information including the kernel version, active user, uptime, and displays a customized message about the OS's open-source license.
<ins>Concepts Used</ins>: Command *substitution $(), variables, echo, uname, whoami, uptime*.

##### How to run: 
```bash
# Make the  script exceutable
chmod +x script1_identity.sh

# Run the script
./script1_identity.sh
```

+ **Script 2**: FOSS Package Inspector *(script2_inspector.sh)*
   
   **Description**: Checks if specific FOSS packages (like git, apache2) are installed on the Debian/Ubuntu system using dpkg. It utilizes a case statement to print a philosophical summary of the software if found.
<ins>Concepts Used</ins>: *if-then-else, case statements, dpkg -s, grep, pipeline |*.

##### How to run:
 ```bash
 # Make the  script exceutable
chmod +x script2_inspector.sh

# Run the script
./script2_inspector.sh
```

+ **Script 3**: Disk and Permission Auditor (script3_auditor.sh)
   
   **Description**: Iterates through a defined array of critical system directories (and Git's local configuration directory). It audits each directory, outputting its current size and permission string.
<ins>Concepts Used</ins>: *Arrays, for loops, conditional [ -d ] checks, du -sh, stat, awk*.
##### How to run:
 ```bash
  # Make the  script exceutable
chmod +x script3_auditor.sh

# Run the script
./script3_auditor.sh
```

+ **Script 4**: Log File Analyzer (script4_analyzer.sh)
   
   **Description**: Safely parses a given log file line by line, hunting for a specific keyword (defaulting to "error"). It tallies the occurrences and prints the last few matched lines. Includes a retry mechanism for empty files.
<ins>Concepts Used</ins>: *while read loop, command-line arguments $1, $2 with defaults, counters, tail, grep*.
##### How to run: 
```bash
 # Make the  script exceutable
chmod +x script4_analyzer.sh

# Run the script
./script4_analyzer.sh /var/log/syslog warning
````
                Note: You may need 'sudo' depending on the log file's read permissions.


+ **Script 5**: The Open Source Manifesto Generator (script5_manifesto.sh)
   
   **Description**: An interactive script that prompts the user for their thoughts on open source. It concatenates these inputs into a personalized manifesto text file and displays it back to the terminal.
<ins>Concepts Used</ins>: read -p for interactive input, file redirection >> and >, date formatting, string concatenation.

##### How to run: 
```bash
 # Make the  script exceutable
chmod +x script5_manifesto.sh

# Run the script
./script5_manifesto.sh
```

___

### Environment Requirements
These scripts are written for and tested on Ubuntu/Debian Linux.
Script 2 specifically uses dpkg. If running on Red Hat/Fedora, you must modify Script 2 to use rpm -q as discussed in the code comments.
