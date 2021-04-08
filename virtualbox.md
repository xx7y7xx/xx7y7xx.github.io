---
layout: page
title: VirtualBox
---

## Install virtualbox on CentOS 5.x

https://wiki.centos.org/HowTos/Virtualization/VirtualBox#head-81de410879b8e7f18a127f638160e036ab99684e

    # cd /etc/yum.repos.d
    # wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

Error: pygpgme is not working

    # yum groupinstall "Development Tools"
    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
    virtualbox                                                                                                                      |  951 B     00:00     
    http://download.virtualbox.org/virtualbox/rpm/el/5/x86_64/repodata/repomd.xml: [Errno -1] pygpgme is not working so repomd.xml can not be verified for virtualbox
    Trying other mirror.
    Error: Cannot retrieve repository metadata (repomd.xml) for repository: virtualbox. Please verify its path and try again

https://bugs.centos.org/view.php?id=3798

> the fix was to remove the "repo_" from those line.

Remove this line, fix problem.

repo_gpgcheck=1

    # yum groupinstall "Development Tools"
    # yum install kernel-devel



    # yum search VirtualBox
    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
    ================================================================= Matched: VirtualBox =================================================================
    VirtualBox-3.2.x86_64 : Oracle VM VirtualBox
    VirtualBox-4.0.x86_64 : Oracle VM VirtualBox
    VirtualBox-4.1.x86_64 : Oracle VM VirtualBox
    VirtualBox-4.2.x86_64 : Oracle VM VirtualBox
    VirtualBox-4.3.x86_64 : Oracle VM VirtualBox
    VirtualBox-5.0.x86_64 : Oracle VM VirtualBox
    virt-what.x86_64 : Detect if we are running in a virtual machine



    # yum install VirtualBox-5.0

## Import ova in command line

### Show options for a particular OVF.

    # VBoxManage import /tmp/centos.ova -n
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Interpreting /tmp/centos.ova...
    OK.
    Disks:
      vmdisk2 107374182400  -1  http://www.vmware.com/interfaces/specifications/vmdk.html#streamOptimized -disk1.vmdk -1  -1  
    
    Virtual system 0:
     0: Suggested OS type: "Fedora_64"
        (change with "--vsys 0 --ostype <type>"; use "list ostypes" to list all possible values)
     1: Suggested VM name "centos7_160301_1"
        (change with "--vsys 0 --vmname <name>")
     2: Number of CPUs: 2
        (change with "--vsys 0 --cpus <n>")
     3: Guest memory: 2048 MB
        (change with "--vsys 0 --memory <MB>")
     4: Sound card (appliance expects "", can change on import)
        (disable with "--vsys 0 --unit 4 --ignore")
     5: USB controller
        (disable with "--vsys 0 --unit 5 --ignore")
     6: Network adapter: orig NAT, config 3, extra slot=0;type=NAT
     7: CD-ROM
        (disable with "--vsys 0 --unit 7 --ignore")
     8: IDE controller, type PIIX4
        (disable with "--vsys 0 --unit 8 --ignore")
     9: IDE controller, type PIIX4
        (disable with "--vsys 0 --unit 9 --ignore")
    10: SATA controller, type AHCI
        (disable with "--vsys 0 --unit 10 --ignore")
    11: Hard disk image: source image=-disk1.vmdk, target path=/root/VirtualBox VMs/centos7_160301_1/-disk1.vmdk, controller=10;channel=0
        (change target path with "--vsys 0 --unit 11 --disk path";
        disable with "--vsys 0 --unit 11 --ignore")

### Start to import

    # VBoxManage import /tmp/centos.ova --options keepallmacs

### List all virtual machines.

    # VBoxManage list vms
    "centos7_160301_1" {29434b0f-743c-4e9f-b69e-af091a1e913c}

### Start a virtual machine.

    # VBoxManage startvm centos7_160301_1 --type headless

When `--type headless` option is missing, you will get this error message:

    Waiting for VM "centos7_160301_1" to power on...
    VBoxManage: error: The virtual machine 'centos7_160301_1' has terminated unexpectedly during startup with exit code 1 (0x1)
    VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component MachineWrap, interface IMachine

[https://www.virtualbox.org/ticket/9548](https://www.virtualbox.org/ticket/9548)
