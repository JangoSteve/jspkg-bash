# JSPkg bash script

Installs JS packages from http://jspkg.com

## install

jspkg is a shell script, so just download the jspkg file and add it to your `$PATH`.

For example, on OSX, you might do:

```sh
curl -L -o jspkg https://raw.github.com/JangoSteve/jspkg-bash/master/jspkg
chmod +x jspkg
PATH=$(pwd):$PATH
export PATH
```

## usage

Run `jspkg COMMAND VALUE`. The main command you'll be using is
`install`:

```sh
jspkg install EasyTabs
```

This will install [EasyTabs from
jspkg.com/packages/easytabs](http://jspkg.com/packages/easytabs) to
`CURRENT_DIRECTORY/easytabs/`.

For more info, run `jspkg -h`

## tests

To run tests, [install roundup](https://github.com/bmizerany/roundup/blob/master/INSTALLING#files) and run `URL=http://localhost:3000 roundup jspkg-test.sh`.

You will need a local version of JSPkg running at http://localhost:3000 with
the command above. This may not be possible if you don't have access to
the repo. As such, you may point the tests at http://jspkg.com, but we
ask you to do this sparingly, as it will affect the download
counts of the production site.

## credits

Written by [Steve Schwartz (jangosteve)](http://twitter.com/jangosteve).

This script was influenced largely by [spark](https://github.com/holman/spark)
and [rbenv](https://github.com/sstephenson/rbenv).
