## create merge request

Rollback/revert modifications.

```
$ git checkout origin/master -- src/foo.js
$ git commit -m 'Revert modifications' && git push
```
