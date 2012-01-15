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

This will install the [easytabs project from
jspkg.com](http://jspkg.com/packages/easytabs).
