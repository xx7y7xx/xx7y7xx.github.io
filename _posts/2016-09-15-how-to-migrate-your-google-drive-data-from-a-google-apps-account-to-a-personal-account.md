---
layout: post
title: How to Migrate Your Google Drive Data from a Google Apps account to a personal account
---

https://support.google.com/a/answer/100458?hl=en

The official method is not good, we will lose (Google Document) format information.

Recently I find a way to migrate my documents from my Google Apps account `chenyang[at]masols.com` to my personal account, say `chenyang[at]gmail.com`

1. In `chenyang[at]masols.com`
  - At ROOT dir, create a folder `_shared_to_accounts_out_of_this_domain_`, and shared with `chenyang[at]gmail.com`.
  - Then move all files and folders to this folder.
2. In `chenyang[at]gmail.com`
  - At ROOT dir, create a folder `_working_tmp_dir_`
  - Open "Shared with me" in sidebar.
  - Find folder `_shared_to_accounts_out_of_this_domain_`, right click on it, select "Move to...", and then choose the `_working_tmp_dir_`.
  - At the time, we got all files/dirs in `ROOT/_working_tmp_dir_/_shared_to_accounts_out_of_this_domain_/*`
3. Install Google Drive (for Windows)
  - Login with `chenyang[at]gmail.com`
  - Only sync `ROOT/_working_tmp_dir_` to local machine.
  - After all files/dirs are synced to local, copy `ROOT/_working_tmp_dir_/_shared_to_accounts_out_of_this_domain_` to `ROOT/_working_tmp_dir_/_copy_files_`
  - Wait for all things are synced to remote.
4. In `chenyang[at]masols.com`
  - Stop sharing to `chenyang[at]gmail.com` at step 1

At last, you will find all the files/dirs at `ROOT/_working_tmp_dir_/_copy_files_`, and you can do anything you want.