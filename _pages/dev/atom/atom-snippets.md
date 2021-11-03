---
layout: page
title: Atom Snippets
---

## Related packages

- [snippets](https://atom.io/packages/snippets) - installed by default
- [autocomplete-plus](https://atom.io/packages/autocomplete-plus) - installed by default
- [autocomplete-snippets](https://atom.io/packages/autocomplete-snippets)

## Add new snippets

Change the file `~/.atom/snippets.cson`

```
'.source.js':
  'Unit testing':
    'prefix': 'test'
    'body': """
      import { log } from 'utils/log'

      describe('log()', () => {
        it('should output log', () => {
          expect(log()).toBe('log content')
        })
      })
    """
```

## See also

- See examples [https://github.com/xxd3vin/env/blob/master/.atom/snippets.cson](https://github.com/xxd3vin/env/blob/master/.atom/snippets.cson)
