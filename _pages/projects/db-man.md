# db-man

```
## first
git tag v0.1.0
git push origin v0.1.0
yarn build
npm publish --access=public

## others
yarn test --watchAll=false && npm version patch
git push && git push origin v0.1.2
yarn build && npm publish --access=public
```
