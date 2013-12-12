Cdo
===

Runs the same command over every entry in the quickfix list (:Cdo) or location
list (:Ldo).

Example 1: Find every instance of foo in the working directory and replace it
with bar.

    :grep foo
    :Cdo execute 's/foo/bar/c | update'
    :CdoUpdate execute 's/foo/bar/c'


Example 2: Use of normal to move up to the beginning of a function, paste
something from a register (an escape is normally required, so a nested execute
is required in this case):

    :Cdo execute "execute 'norm [{\"ip' | update"

Complete list of commands:

  :Cdo
  :CdoUpdate
  :Ldo
  :LdoUpdate

Notes
-----

These functions work great in conjunction with the
[editqf](https://github.com/jceb/vim-editqf) functions, which let you curate
your quicklist search results.

Author
------

Cdo was written by Peter Jaros (peeja).
