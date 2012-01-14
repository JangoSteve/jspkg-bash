#!/usr/bin/env roundup

describe "jspkg: Installs JS packages"

jspkg="./jspkg"

# Cleanup easytabs.zip and easytabs/ from previous tests
if [ -e ./easytabs.zip ]
then
  rm ./easytabs.zip
fi

if [ -d ./easytabs ]
then
  rm -r ./easytabs
fi

it_downcases_package_name() {
  permalink="$($jspkg permalink EasyTabs)"
  test $permalink = 'easytabs'
}

it_replaces_special_characters_in_name() {
  permalink="$($jspkg permalink easy\ tabs\ project)"
  test $permalink = 'easy-tabs-project'
}

it_downloads_zip() {
  download="$($jspkg download easytabs)"
  test "$download" = 'downloading easytabs'
  exists="$([ -e ./easytabs.zip ] && echo yes || echo no)"
  test $exists = 'yes'
}

it_unpacks_zip() {
  unpack="$($jspkg unpack easytabs)"
  begins="$([[ $unpack == unpacking\ easytabs.zip* ]] && echo yes || echo no)"
  test $begins = 'yes'
  exists="$([ -d ./easytabs ] && echo yes || echo no)"
  test $exists = 'yes'
  unpacked="$([ -e ./easytabs/README.markdown ] && echo yes || echo no)"
  test $unpacked = 'yes'
}

it_removes_archive() {
  cleanup="$($jspkg remove easytabs)"
  test "$cleanup" = 'cleaning up easytabs.zip'
  exists="$([ -e ./easytabs.zip ] && echo yes || echo no)"
  test $exists = 'no'
  rm -r ./easytabs
}

it_installs_package() {
  install="$($jspkg install easytabs)"
  ends="$([[ $install == *downloaded\ and\ unpacked\ to\ \"easytabs/\"\ directory\ :-\) ]] && echo yes || echo no)"
  test $ends = 'yes'
  exists="$([ -e ./easytabs/README.markdown ] && echo yes || echo no)"
  test $exists = 'yes'
}
