# 🐚 Shell Scripting & Linux Administration Notes

### **1. Node Health Monitoring Script**

This script is a standard way to monitor the health of a Linux server (Node) by checking CPU, Memory, and Disk usage.

```bash

#!/bin/bash

#################################

# Author : Anil Amrute

# Date   : 28/01/2026

#

# Description: This script outputs system node health metrics.

# Version    : v1

###################################

# --- Best Practice: Debugging and Error Handling ---

set -x # Debug mode: Prints each command before execution.

set -e # Exit immediately if a command exits with a non-zero status.

set -o pipefail # Prevents errors in a pipeline from being masked.

echo "--- Disk Space Usage ---"

df -h # -h: Human-readable format (GB/MB).

echo "--- Memory (RAM) Usage ---"

free -g # -g: Output in Gigabytes.

echo "--- CPU Count ---"

nproc # Displays the number of available processing units.

echo "--- Finding Jenkins Process IDs ---"

# ps -ef: Lists all running processes.

# grep: Filters for Jenkins.

# awk: Extracts the 2nd column (Process ID).

ps -ef | grep "jenkins" | awk '{print $2}'

```

* * * * *

### **2\. Core Linux Commands (Interview Explanation)**

| **Command** | **Definition for Interviewer** |
| --- | --- |
| **`top`** | Shows real-time system performance, including CPU/Memory tasks and process-specific resource usage. |
| **`df -h`** | Used to check disk space. The `-h` flag is critical as it converts bytes into MB/GB for human readability. |
| **`free -g`** | Displays the amount of free and used RAM in the system in Gigabytes. |
| **`nproc`** | Quickly shows the total number of CPU cores available to the OS. |
| **`ps -ef`** | Provides a full snapshot of all running processes, including background services and the users running them. |

* * * * *

### **3\. Filtering and Redirection (The Pipeline)**

-   **`grep`**: Acts as a filter. In an interview, explain it as a tool to search for specific patterns or keywords within a large output.

-   **Pipe `|`**: This is "Command Chaining." It takes the **Standard Output (stdout)** of the first command and sends it as the **Standard Input (stdin)** to the second command.

-   **`awk`**: A powerful scripting language for text processing. Most commonly used in DevOps to extract specific columns (like PIDs) from command outputs.

> **💡 Interview Trick Question:**
>
> **Q:** What happens if you run `date | echo "date is"`?
>
> **A:** It will only print "date is." Why? Because `echo` does not accept input from a pipe; it only prints the arguments provided to it. To fix this, you would use `echo "date is $(date)"`.

* * * * *

### **4\. Remote Data & File Management**

-   **`curl`**: Used to retrieve data from a URL. Perfect for checking if a service is up or fetching logs from a remote API.

-   **`wget`**: Used specifically for downloading files from the internet to the local directory.

-   **`find / -name [filename]`**: Searches the entire filesystem for a specific file (e.g., `find / -name pam.d`).

-   **`sudo su -`**: Switches the current session to the **Root User** (Superuser) with the root's environment variables.

* * * * *

### **5\. Logic & Loops**

#### **If-Else (Conditional Logic)**

Used to make decisions, such as checking if a log file exists before trying to `grep` it.

Bash

```
if [ expression ]
then
    # Action if true
else
    # Action if false
fi

```

#### **For Loops (Iteration)**

Used to repeat tasks, such as restarting 10 different containers or checking 10 different URLs.

Bash

```
# Example: Prints numbers 1 through 10
for i in {1..10}; do
    echo $i;
done

```

* * * * *

### **6\. Advanced Scripting: Traps & Signals**

-   **`trap`**: This command allows a script to "catch" specific signals (like a user pressing `Ctrl+C`). It is used to perform cleanup (like deleting temporary files) before the script exits.

-   **Signals**: Communication sent to a process. For example, `kill -9` sends a **SIGKILL** signal to force a process to stop immediately.
