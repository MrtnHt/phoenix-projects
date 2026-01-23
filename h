[33mcommit cd7efc871c29fe92e0076bc4481e3fcc0a78b94d[m
Author: MrtnHt <144637962+MrtnHt@users.noreply.github.com>
Date:   Thu Jan 22 11:42:59 2026 +0100

    Remote Command via Phoenix V50

[1mdiff --git a/command.sh b/command.sh[m
[1mnew file mode 100644[m
[1mindex 0000000..f07356c[m
[1m--- /dev/null[m
[1m+++ b/command.sh[m
[36m@@ -0,0 +1,4 @@[m
[32m+[m[32m# Check of de bestanden goed op de server staan[m
[32m+[m[32mcd /root/public_site[m
[32m+[m[32mecho "--- LAATSTE PUSH INFO ---"[m
[32m+[m[32mgit log -1 --stat[m
