---
layout: post
title: "/usr/local/bin/bundle:23:in `load': cannot load such file -- /usr/local/lib/ruby/gems/2.6.0/gems/bundler-1.17.3/exe/bundle (LoadError)"
---

The error.

```
➜  xxd3vin.github.io git:(develop) ✗ bundle install
Traceback (most recent call last):
	1: from /usr/local/bin/bundle:23:in `<main>'
/usr/local/bin/bundle:23:in `load': cannot load such file -- /usr/local/lib/ruby/gems/2.6.0/gems/bundler-1.17.3/exe/bundle (LoadError)
```

Check the version.

```
➜  xxd3vin.github.io git:(develop) ✗ gem -v
3.0.3
```

According to [this](https://github.com/bundler/bundler/issues/6227#issuecomment-391294004){:target="_blank"} to update the bundler.

```
➜  xxd3vin.github.io git:(develop) ✗ gem install bundler
Fetching bundler-2.0.2.gem
bundler's executable "bundle" conflicts with /usr/local/lib/ruby/gems/2.6.0/bin/bundle
Overwrite the executable? [yN]  y
bundler's executable "bundler" conflicts with /usr/local/lib/ruby/gems/2.6.0/bin/bundler
Overwrite the executable? [yN]  y
Successfully installed bundler-2.0.2
Parsing documentation for bundler-2.0.2
Installing ri documentation for bundler-2.0.2
Done installing documentation for bundler after 3 seconds
1 gem installed
```

Still error

```
➜  xxd3vin.github.io git:(develop) ✗ bundle install
Traceback (most recent call last):
	1: from /usr/local/bin/bundle:23:in `<main>'
/usr/local/bin/bundle:23:in `load': cannot load such file -- /usr/local/lib/ruby/gems/2.6.0/gems/bundler-1.17.3/exe/bundle (LoadError)
```

Check the version.

```
➜  xxd3vin.github.io git:(develop) ✗ gem -v
3.0.3
```

According to [this](https://github.com/bundler/bundler/issues/6227#issuecomment-388962809){:target="_blank"} to update gem.

```
➜  xxd3vin.github.io git:(develop) ✗ gem update --system
Updating rubygems-update
Fetching rubygems-update-3.0.6.gem
Successfully installed rubygems-update-3.0.6
Parsing documentation for rubygems-update-3.0.6
Installing ri documentation for rubygems-update-3.0.6
Installing darkfish documentation for rubygems-update-3.0.6
Done installing documentation for rubygems-update after 45 seconds
Parsing documentation for rubygems-update-3.0.6
Done installing documentation for rubygems-update after 0 seconds
Installing RubyGems 3.0.6
Bundler 1.17.3 installed
RubyGems 3.0.6 installed
Regenerating binstubs
Parsing documentation for rubygems-3.0.6
Installing ri documentation for rubygems-3.0.6

=== 3.0.6 / 2019-08-17

Bug fixes:

* Revert #2813. It broke the compatibility with 3.0.x versions.

=== 3.0.5 / 2019-08-16

Minor enhancements:

* Use env var to configure api key on push. Pull request #2559 by Luis
  Sagastume.
* Unswallow uninstall error. Pull request #2707 by David Rodríguez.
* Expose windows path normalization utility. Pull request #2767 by David
  Rodríguez.
* Clean which command. Pull request #2801 by Luis Sagastume.
* Upgrading S3 source signature to AWS SigV4. Pull request #2807 by
  Alexander Pakulov.
* Remove missleading comment, no reason to move Gem.host to Gem::Util.
  Pull request #2811 by Luis Sagastume.
* Drop support for 'gem env packageversion'. Pull request #2813 by Luis
  Sagastume.
* Take into account just git tracked files in update_manifest rake task.
  Pull request #2816 by Luis Sagastume.
* Remove TODO comment, there's no Gem::Dirs constant. Pull request #2819
  by Luis Sagastume.
* Remove unused 'raise' from test_case. Pull request #2820 by Luis
  Sagastume.
* Move TODO comment to an information comment. Pull request #2821 by Luis
  Sagastume.
* Use File#open instead of Kernel#open in stub_specification.rb. Pull
  request #2834 by Luis Sagastume.
* Make error code a gemcutter_utilities a constant. Pull request #2844 by
  Luis Sagastume.
* Remove FIXME comment related to PathSupport. Pull request #2854 by Luis
  Sagastume.
* Use gsub with Hash. Pull request #2860 by Kazuhiro NISHIYAMA.
* Use the standard RUBY_ENGINE_VERSION instead of JRUBY_VERSION. Pull
  request #2864 by Benoit Daloze.
* Do not mutate uri.query during s3 signature creation. Pull request #2874
  by Alexander Pakulov.
* Fixup #2844. Pull request #2878 by SHIBATA Hiroshi.

Bug fixes:

* Fix intermittent test error on Appveyor & Travis. Pull request #2568 by
  MSP-Greg.
* Extend timeout on assert_self_install_permissions. Pull request #2605 by
  SHIBATA Hiroshi.
* Better folder assertions. Pull request #2644 by David Rodríguez.
* Fix default gem executable installation when folder is not `bin/`. Pull
  request #2649 by David Rodríguez.
* Fix gem uninstall behavior. Pull request #2663 by Luis Sagastume.
* Fix for large values in UID/GID fields in tar archives. Pull request
  #2780 by Alexey Shein.
* Fixed task order for release. Pull request #2792 by SHIBATA Hiroshi.
* Ignore GEMRC variable for test suite. Pull request #2837 by SHIBATA
  Hiroshi.

=== 3.0.4 / 2019-06-14

Minor enhancements:

* Add support for TruffleRuby #2612 by Benoit Daloze
* Serve a more descriptive error when --no-ri or --no-rdoc are used #2572
  by Grey Baker
* Improve test compatibility with CMake 2.8. Pull request #2590 by Vít
  Ondruch.
* Restore gem build behavior and introduce the "-C" flag to gem build.
  Pull request #2596 by Luis Sagastume.
* Enabled block call with util_set_arch. Pull request #2603 by SHIBATA
  Hiroshi.
* Avoid rdoc hook when it's failed to load rdoc library. Pull request
  #2604 by SHIBATA Hiroshi.
* Drop tests for legacy RDoc. Pull request #2608 by Nobuyoshi Nakada.
* Update TODO comment. Pull request #2658 by Luis Sagastume.
* Skip malicious extension test with mswin platform. Pull request #2670 by
  SHIBATA Hiroshi.
* Check deprecated methods on release. Pull request #2673 by David
  Rodríguez.
* Add steps to run bundler tests. Pull request #2680 by Aditya Prakash.
* Skip temporary "No such host is known" error. Pull request #2684 by
  Takashi Kokubun.
* Replaced aws-sdk-s3 instead of s3cmd. Pull request #2688 by SHIBATA
  Hiroshi.
* Allow uninstall from symlinked GEM_HOME. Pull request #2720 by David
  Rodríguez.
* Use current checkout in CI to uninstall RVM related gems. Pull request
  #2729 by David Rodríguez.
* Update Contributor Covenant v1.4.1. Pull request #2751 by SHIBATA
  Hiroshi.
* Added supported versions of Ruby. Pull request #2756 by SHIBATA Hiroshi.
* Fix shadowing outer local variable warning. Pull request #2763 by Luis
  Sagastume.
* Update the certificate files to make the test pass on Debian 10. Pull
  request #2777 by Yusuke Endoh.
* Backport ruby core changes. Pull request #2778 by SHIBATA Hiroshi.

Bug fixes:

* Test_gem.rb - intermittent failure fix. Pull request #2613 by MSP-Greg.
* Fix sporadic CI failures. Pull request #2617 by David Rodríguez.
* Fix flaky bundler version finder tests. Pull request #2624 by David
  Rodríguez.
* Fix gem indexer tests leaking utility gems. Pull request #2625 by David
  Rodríguez.
* Clean up default spec dir too. Pull request #2639 by David Rodríguez.
* Fix 2.6.1 build against vendored bundler. Pull request #2645 by David
  Rodríguez.
* Fix comment typo. Pull request #2664 by Luis Sagastume.
* Fix comment of Gem::Specification#required_ruby_version=. Pull request
  #2732 by Alex Junger.
* Fix TODOs. Pull request #2748 by David Rodríguez.

=== 3.0.3 / 2019-03-05

Security fixes:

* Fixed following vulnerabilities:
  * CVE-2019-8320: Delete directory using symlink when decompressing tar
  * CVE-2019-8321: Escape sequence injection vulnerability in `verbose`
  * CVE-2019-8322: Escape sequence injection vulnerability in `gem owner`
  * CVE-2019-8323: Escape sequence injection vulnerability in API response handling
  * CVE-2019-8324: Installing a malicious gem may lead to arbitrary code execution
  * CVE-2019-8325: Escape sequence injection vulnerability in errors


------------------------------------------------------------------------------

RubyGems installed the following executables:
	/usr/local/Cellar/ruby/2.6.3/bin/gem
	/usr/local/Cellar/ruby/2.6.3/bin/bundle

Ruby Interactive (ri) documentation was installed. ri is kind of like man
pages for Ruby libraries. You may access it like this:
  ri Classname
  ri Classname.class_method
  ri Classname#instance_method
If you do not wish to install this documentation in the future, use the
--no-document flag, or set it as the default in your ~/.gemrc file. See
'gem help env' for details.

RubyGems system software updated
```

Check the version.

```
➜  xxd3vin.github.io git:(develop) ✗ gem -v
3.0.6
```

Successfully to call `bundle install` at last.