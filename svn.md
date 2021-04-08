---
title: SVN
layout: page
---

## How to rollback a file to early revision

Roll back from r27954 to r25138

    $ svn merge -r27954:25138 cc.js
    --- Reverse-merging r27954 through r25139 into 'cc.js':
    U    cc.js
    --- Recording mergeinfo for reverse merge of r27954 through r25139 into 'cc.js':
     U   cc.js
    --- Eliding mergeinfo from 'cc.js':
     U   cc.js
    $ svn status
    M       cc.js
    $ svn commit

## Checking file encoding (UTF-8) in svn pre-commit

[https://gist.github.com/xxd3vin/6f2c8a6f628667b902c804861c727604](https://gist.github.com/xxd3vin/6f2c8a6f628667b902c804861c727604)
