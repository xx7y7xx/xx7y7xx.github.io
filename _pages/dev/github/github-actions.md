---
layout: page
title: GitHub Actions
permalink: /dev/github/github-actions.html
---

## Using env var in GitHub Actions

Define `REACT_APP_GOOGLE_MAPS_API_KEY` with value `1@3$` in [Repo Settings -> Secrets -> New repository secret](https://github.com/photo-map/photo-map.github.io/settings/secrets/actions)

`.github/workflows/save_env_var_to_file.yml`

```yml
name: save_env_var_to_file
on: push
env:
  REACT_APP_GOOGLE_MAPS_API_KEY: ${{ secrets.REACT_APP_GOOGLE_MAPS_API_KEY }}
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: chmod
        run: chmod 777 ./save_env_var_to_file.sh
      - name: Save env var to file
        run: ./save_env_var_to_file.sh
      - name: Upload build/output.txt
        uses: actions/upload-artifact@v2
        with:
          name: output
          path: ./build
```

`save_env_var_to_file.sh`

```sh
#!/bin/bash
echo echo_env start
echo $REACT_APP_GOOGLE_MAPS_API_KEY # this will print *** in GitHub Action console
mkdir ./build
echo $REACT_APP_GOOGLE_MAPS_API_KEY > ./build/output.txt
echo echo_env end
```

After workflow is done, you could download the artifact, and find the `output.txt` content is `1@3$`.

See [https://github.com/xx7y7xx/github-actions-demo/blob/main/.github/workflows/echo_env.yml](https://github.com/xx7y7xx/github-actions-demo/blob/main/.github/workflows/echo_env.yml)
