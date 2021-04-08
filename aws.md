---
layout: page
title: AWS
---

## AWS Command Line Interface

installation

```
➜  ~ brew install awscli
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 3 taps (caskroom/cask, domt4/chromium, homebrew/core).
==> New Formulae
apm-server                                  chamber                                     dislocker                                   dnsdist                                     joplin                                      kubeless                                    neal                                        vert
==> Updated Formulae
direnv ✔                     bazel                        clang-format                 docfx                        fluent-bit                   gperftools                   libgit2-glib                 nano                         packmol                      rocksdb                      terraform                    x265
git ✔                        bench                        clojure                      docker-machine-nfs           fn                           grakn                        libmicrohttpd                nasm                         paket                        rom-tools                    terragrunt                   xmrig
libuv ✔                      bindfs                       cockroach                    domt4/chromium/chromium      fwup                         groonga                      libphonenumber               nodebrew                     payara                       rtags                        tor                          xtensor
abcmidi                      bit                          commandbox                   duck                         fzf                          heroku                       libunistring                 nsd                          pdns                         s6                           twarc                        you-get
agedu                        bluepill                     conan                        emscripten                   get_iplayer                  highlight                    linkerd                      nss                          pngquant                     sbcl                         urh                          youtube-dl
amazon-ecs-cli               bmake                        conjure-up                   exim                         git-ftp                      httest                       lua                          open-scene-graph             ppsspp                       sceptre                      vim                          zsh-autosuggestions
angular-cli                  brotli                       cppad                        exploitdb                    gitbucket                    imagemagick                  lua@5.3                      openshift-cli                pyinvoke                     selenium-server-standalone   vowpal-wabbit
ansible                      cabal-install                curl                         faas-cli                     glpk                         imagemagick@6                mame                         osc                          r                            spotbugs                     webp
ansifilter                   cassandra@2.2                dcos-cli                     fdroidserver                 gmic                         just                         mariadb                      osrm-backend                 radare2                      sqlmap                       webpack
b2-tools                     charm                        digdag                       firebase-cli                 goffice                      kotlin                       mercurial                    ott                          re2                          swi-prolog                   weechat
bazaar                       citus                        dmd                          flow                         gopass                       lbdb                         mpg123                       packetbeat                   redis                        swiftformat                  wireshark
==> Deleted Formulae
geogit

==> Downloading https://homebrew.bintray.com/bottles/awscli-1.11.190.sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring awscli-1.11.190.sierra.bottle.tar.gz
==> Caveats
The "examples" directory has been installed to:
  /usr/local/share/awscli/examples

Bash completion has been installed to:
  /usr/local/etc/bash_completion.d

zsh completions and functions have been installed to:
  /usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/awscli/1.11.190: 4,124 files, 36.1MB
```

```
➜  ~ ll /usr/local/share/zsh/site-functions/_aws
lrwxr-xr-x  1 devin.chenyang  admin    61B Dec  4 15:17 /usr/local/share/zsh/site-functions/_aws -> ../../../Cellar/awscli/1.11.190/share/zsh/site-functions/_aws
```

z shell already come with autocompletion for aws command

```
➜  ~ aws
acm                           cloudformation                codepipeline                  deploy                        ecs                           firehose                      iot-data                      marketplace-entitlement       polly                         sdb                           storagegateway
apigateway                    cloudfront                    codestar                      devicefarm                    efs                           gamelift                      kinesis                       marketplacecommerceanalytics  pricing                       servicecatalog                sts
application-autoscaling       cloudhsm                      cognito-identity              directconnect                 elasticache                   glacier                       kinesisanalytics              meteringmarketplace           rds                           ses                           support
appstream                     cloudhsmv2                    cognito-idp                   discovery                     elasticbeanstalk              glue                          kms                           mgh                           redshift                      shield                        swf
athena                        cloudsearch                   cognito-sync                  dms                           elastictranscoder             greengrass                    lambda                        mobile                        rekognition                   sms                           waf
autoscaling                   cloudsearchdomain             configservice                 ds                            elb                           health                        lex-models                    mturk                         resourcegroupstaggingapi      snowball                      waf-regional
batch                         cloudtrail                    configure                     dynamodb                      elbv2                         iam                           lex-runtime                   opsworks                      route53                       sns                           workdocs
budgets                       cloudwatch                    cur                           dynamodbstreams               emr                           importexport                  lightsail                     opsworks-cm                   route53domains                sqs                           workspaces
ce                            codebuild                     datapipeline                  ec2                           es                            inspector                     logs                          organizations                 s3                            ssm                           xray
clouddirectory                codecommit                    dax                           ecr                           events                        iot                           machinelearning               pinpoint                      s3api                         stepfunctions
```

## References

- [https://github.com/aws/aws-cli/issues/727](https://github.com/aws/aws-cli/issues/727)