#!/usr/bin/env roundup

describe "jspkg: Installs JS packages"

jspkg="./jspkg"

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
  rm ./easytabs.zip
}
