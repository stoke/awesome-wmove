awesome-wmove
-------------

Shitty code that adds some keybindings (`Mod4 + Ctrl + <direction>` by default) to move windows around while in floating mode.

Installation
------------

`git clone git://github.com/stoke/awesome-wmove.git /usr/share/awesome/lib/wmove -b install`

Usage
-----

```lua
globalkeys = awful.util.table.join(require('wmove').table(), globalkeys)
root.keys(globalkeys)
```
