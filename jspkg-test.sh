#!/usr/bin/env roundup

describe "jspkg: Installs JS packages"

jspkg="./jspkg"

it_downcases_package_name() {
  permalink="$($jspkg permalink EasyTabs)"
  test $permalink = 'easytabs'
}

it_replaces_special_characters_in_name() {
  permalink="$($jspkg permalink easy\ tabs)"
  test $permalink = 'easy-tabs'
}
