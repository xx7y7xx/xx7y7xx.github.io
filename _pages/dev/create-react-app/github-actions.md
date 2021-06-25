npx create-react-app demo-viewer

cd demo-viewer

modify package.json, add content:

"homepage": "https://user-name.github.io/demo-viewer/",

yarn start

http://localhost:3000/

yarn build

```
$ ls -1 build
asset-manifest.json
favicon.ico
index.html
logo192.png
logo512.png
manifest.json
robots.txt
static
```

gh repo create user-name/demo-viewer --confirm --public

git push -u origin master

mkdir -p .github/workflows

touch .github/workflows/build-deploy.yml

content is

```
name: Build & deploy

on:
  push:
    branches:
      - master
  pull_request:
    branches:
      - master

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout code
      uses: actions/checkout@v2
    
    - name: Install Node.js
      uses: actions/setup-node@v1
      with:
        node-version: 14.x
    
    - name: Install NPM packages
      run: yarn
    
    - name: Build project
      run: yarn build
    
    - name: Run tests
      run: yarn test

    - name: Upload production-ready build files
      uses: actions/upload-artifact@v2
      with:
        name: production-files
        path: ./build
  
  deploy:
    name: Deploy
    needs: build
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/master'
    
    steps:
    - name: Download artifact
      uses: actions/download-artifact@v2
      with:
        name: production-files
        path: ./build

    - name: Deploy to gh-pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./build
```

git add . && git commit -m 'setup github actions' && git push

change in repo project setting, use gh-pages branch as the source.

## See also

* /dev/create-react-app/github.html

## references

* https://codeburst.io/deploying-a-react-app-using-github-pages-and-github-actions-7fc14d380796
* https://github.com/marketplace/actions/github-pages-action
