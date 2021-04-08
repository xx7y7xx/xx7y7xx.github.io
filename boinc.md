---
layout: page
title: Boinc
---

## Setup on Linux

Install BOINC and start the client.

    sudo yum install boinc-client boinc-manager -y
    sudo /etc/init.d/boinc-client start

Set your BAM username and password

    bam_username="username"
    bam_password="password"

Join a account manager server like BAM.

    cd /var/lib/boinc/
    sudo -u boinc boinccmd --join_acct_mgr http://bam.boincstats.com/ $bam_username $bam_password

If something is wrong like this

    poll status: operation in progress
    poll status: operation in progress
    poll status: operation in progress
    poll status: unexpected XML tag or syntax

You should check the reply from account manager server.

    less acct_mgr_reply.xml

Optionally, do a benchmark.

    sudo -u boinc boinccmd --run_benchmarks

Some useful setting.

Always use network.

    cd /var/lib/boinc/
    sudo -u boinc boinccmd --set_network_mode always

Always use GPU.

    cd /var/lib/boinc/
    sudo -u boinc boinccmd --set_gpu_mode always

If you want job starts immediately.

    sudo -u boinc boinccmd --set_run_mode always

## Other config

Add job to crontab

    sudo -u boinc crontab -e

Add two lines

    * * * * * ps --ppid `pgrep node` &> /dev/null || boinccmd --set_run_mode always
    * * * * * ps --ppid `pgrep node` &> /dev/null && boinccmd --set_run_mode never

## References

- http://boinc.berkeley.edu/wiki/Boinccmd_tool