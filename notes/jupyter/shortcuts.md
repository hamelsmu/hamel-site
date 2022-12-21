---
title: My Jupyter Shortcuts
---

People complain about "state" in Jupyter.  This can be easily avoided by frequently restarting the kernel and running all cells from the top.  Thankfully, you can set a hotkey that allows you to do this effortlessly.  In Jupyter Lab, go to `Settings` then `Advanced Settings Editor`.  Copy and paste the below json into the `User Prefences` pane.  If you already have user-defined shortcuts, modify this appropriately.

```json
{
    "shortcuts": [
        {
            "args": {},
            "command": "application:activate-next-tab",
            "keys": [
                "Ctrl Shift ]"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "application:activate-next-tab-bar",
            "keys": [
                "Ctrl Shift ."
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "application:activate-previous-tab",
            "keys": [
                "Ctrl Shift ["
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "application:activate-previous-tab-bar",
            "keys": [
                "Ctrl Shift ,"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "application:close",
            "keys": [
                "Alt W"
            ],
            "selector": ".jp-Activity"
        },
        {
            "args": {},
            "command": "application:toggle-left-area",
            "keys": [
                "Accel B"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "application:toggle-mode",
            "keys": [
                "Accel Shift D"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "apputils:activate-command-palette",
            "keys": [
                "Accel Shift C"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "apputils:print",
            "keys": [
                "Accel P"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "completer:invoke-console",
            "keys": [
                "Tab"
            ],
            "selector": ".jp-CodeConsole-promptCell .jp-mod-completer-enabled"
        },
        {
            "args": {},
            "command": "completer:invoke-file",
            "keys": [
                "Tab"
            ],
            "selector": ".jp-FileEditor .jp-mod-completer-enabled"
        },
        {
            "args": {},
            "command": "completer:invoke-notebook",
            "keys": [
                "Tab"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode .jp-mod-completer-enabled"
        },
        {
            "args": {},
            "command": "console:linebreak",
            "keys": [
                "Enter"
            ],
            "selector": ".jp-CodeConsole[data-jp-interaction-mode='notebook'] .jp-CodeConsole-promptCell"
        },
        {
            "args": {},
            "command": "console:linebreak",
            "keys": [
                "Accel Enter"
            ],
            "selector": ".jp-CodeConsole[data-jp-interaction-mode='terminal'] .jp-CodeConsole-promptCell"
        },
        {
            "args": {},
            "command": "console:run-forced",
            "keys": [
                "Shift Enter"
            ],
            "selector": ".jp-CodeConsole[data-jp-interaction-mode='notebook'] .jp-CodeConsole-promptCell"
        },
        {
            "args": {},
            "command": "console:run-forced",
            "keys": [
                "Shift Enter"
            ],
            "selector": ".jp-CodeConsole[data-jp-interaction-mode='terminal'] .jp-CodeConsole-promptCell"
        },
        {
            "args": {},
            "command": "console:run-unforced",
            "keys": [
                "Enter"
            ],
            "selector": ".jp-CodeConsole[data-jp-interaction-mode='terminal'] .jp-CodeConsole-promptCell"
        },
        {
            "args": {},
            "command": "debugger:continue",
            "keys": [
                "F9"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "debugger:debug-console",
            "keys": [
                "Accel Shift I"
            ],
            "selector": ".jp-CodeConsole"
        },
        {
            "args": {},
            "command": "debugger:debug-file",
            "keys": [
                "Accel Shift I"
            ],
            "selector": ".jp-FileEditor"
        },
        {
            "args": {},
            "command": "debugger:debug-notebook",
            "keys": [
                "Accel Shift I"
            ],
            "selector": ".jp-Notebook"
        },
        {
            "args": {},
            "command": "debugger:next",
            "keys": [
                "F10"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "debugger:stepIn",
            "keys": [
                "F11"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "debugger:stepOut",
            "keys": [
                "Shift F11"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "debugger:terminate",
            "keys": [
                "Shift F9"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "docmanager:save",
            "keys": [
                "Accel S"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "docmanager:save-as",
            "keys": [
                "Accel Shift S"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "documentsearch:highlightNext",
            "keys": [
                "Accel G"
            ],
            "selector": ".jp-mod-searchable"
        },
        {
            "args": {},
            "command": "documentsearch:highlightPrevious",
            "keys": [
                "Accel Shift G"
            ],
            "selector": ".jp-mod-searchable"
        },
        {
            "args": {},
            "command": "documentsearch:start",
            "keys": [
                "Accel F"
            ],
            "selector": ".jp-mod-searchable"
        },
        {
            "args": {},
            "command": "editmenu:redo",
            "keys": [
                "Accel Shift Z"
            ],
            "selector": "[data-jp-undoer]"
        },
        {
            "args": {},
            "command": "editmenu:undo",
            "keys": [
                "Accel Z"
            ],
            "selector": "[data-jp-undoer]"
        },
        {
            "args": {},
            "command": "filebrowser:copy",
            "keys": [
                "Accel C"
            ],
            "selector": ".jp-DirListing-content .jp-DirListing-itemText"
        },
        {
            "args": {},
            "command": "filebrowser:create-main-launcher",
            "keys": [
                "Accel Shift L"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "filebrowser:cut",
            "keys": [
                "Accel X"
            ],
            "selector": ".jp-DirListing-content .jp-DirListing-itemText"
        },
        {
            "args": {},
            "command": "filebrowser:delete",
            "keys": [
                "Delete"
            ],
            "selector": ".jp-DirListing-content .jp-DirListing-itemText"
        },
        {
            "args": {},
            "command": "filebrowser:duplicate",
            "keys": [
                "Accel D"
            ],
            "selector": ".jp-DirListing-content .jp-DirListing-itemText"
        },
        {
            "args": {},
            "command": "filebrowser:go-up",
            "keys": [
                "Backspace"
            ],
            "selector": ".jp-DirListing-content .jp-DirListing-itemText"
        },
        {
            "args": {},
            "command": "filebrowser:paste",
            "keys": [
                "Accel V"
            ],
            "selector": ".jp-DirListing-content .jp-DirListing-itemText"
        },
        {
            "args": {},
            "command": "filebrowser:rename",
            "keys": [
                "F2"
            ],
            "selector": ".jp-DirListing-content .jp-DirListing-itemText"
        },
        {
            "args": {},
            "command": "filebrowser:toggle-main",
            "keys": [
                "Accel Shift F"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "filemenu:close-and-cleanup",
            "keys": [
                "Ctrl Shift Q"
            ],
            "selector": ".jp-Activity"
        },
        {
            "args": {},
            "command": "imageviewer:flip-horizontal",
            "keys": [
                "H"
            ],
            "selector": ".jp-ImageViewer"
        },
        {
            "args": {},
            "command": "imageviewer:flip-vertical",
            "keys": [
                "V"
            ],
            "selector": ".jp-ImageViewer"
        },
        {
            "args": {},
            "command": "imageviewer:invert-colors",
            "keys": [
                "I"
            ],
            "selector": ".jp-ImageViewer"
        },
        {
            "args": {},
            "command": "imageviewer:reset-image",
            "keys": [
                "0"
            ],
            "selector": ".jp-ImageViewer"
        },
        {
            "args": {},
            "command": "imageviewer:rotate-clockwise",
            "keys": [
                "]"
            ],
            "selector": ".jp-ImageViewer"
        },
        {
            "args": {},
            "command": "imageviewer:rotate-counterclockwise",
            "keys": [
                "["
            ],
            "selector": ".jp-ImageViewer"
        },
        {
            "args": {},
            "command": "imageviewer:zoom-in",
            "keys": [
                "="
            ],
            "selector": ".jp-ImageViewer"
        },
        {
            "args": {},
            "command": "imageviewer:zoom-out",
            "keys": [
                "-"
            ],
            "selector": ".jp-ImageViewer"
        },
        {
            "args": {},
            "command": "inspector:open",
            "keys": [
                "Accel I"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "kernelmenu:interrupt",
            "keys": [
                "I",
                "I"
            ],
            "selector": "[data-jp-kernel-user]:focus"
        },
        {
            "args": {},
            "command": "kernelmenu:restart",
            "keys": [
                "0",
                "0"
            ],
            "selector": "[data-jp-kernel-user]:focus"
        },
        {
            "args": {},
            "command": "runmenu:restart-and-run-all",
            "keys": [
                "0",
                "R"
            ],
            "selector": "[data-jp-kernel-user]:focus"
        },
        {
            "args": {},
            "command": "notebook:restart-and-run-to-selected",
            "keys": [
                "0",
                "S"
            ],
            "selector": "[data-jp-kernel-user]:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-code",
            "keys": [
                "Y"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-heading-1",
            "keys": [
                "1"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-heading-2",
            "keys": [
                "2"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-heading-3",
            "keys": [
                "3"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-heading-4",
            "keys": [
                "4"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-heading-5",
            "keys": [
                "5"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-heading-6",
            "keys": [
                "6"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-markdown",
            "keys": [
                "M"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:change-cell-to-raw",
            "keys": [
                "R"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:copy-cell",
            "keys": [
                "C"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:cut-cell",
            "keys": [
                "X"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:delete-cell",
            "keys": [
                "D",
                "D"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:enter-command-mode",
            "keys": [
                "Escape"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode"
        },
        {
            "args": {},
            "command": "notebook:enter-command-mode",
            "keys": [
                "Ctrl M"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode"
        },
        {
            "args": {},
            "command": "notebook:enter-edit-mode",
            "keys": [
                "Enter"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:extend-marked-cells-above",
            "keys": [
                "Shift ArrowUp"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:extend-marked-cells-above",
            "keys": [
                "Shift K"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:extend-marked-cells-below",
            "keys": [
                "Shift ArrowDown"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:extend-marked-cells-below",
            "keys": [
                "Shift J"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:extend-marked-cells-bottom",
            "keys": [
                "Shift End"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:extend-marked-cells-top",
            "keys": [
                "Shift Home"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:insert-cell-above",
            "keys": [
                "A"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:insert-cell-below",
            "keys": [
                "B"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:merge-cell-above",
            "keys": [
                "Ctrl Backspace"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:merge-cell-below",
            "keys": [
                "Ctrl Shift M"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:merge-cells",
            "keys": [
                "Shift M"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:move-cursor-down",
            "keys": [
                "ArrowDown"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:move-cursor-down",
            "keys": [
                "J"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:move-cursor-up",
            "keys": [
                "ArrowUp"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:move-cursor-up",
            "keys": [
                "K"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:paste-cell-below",
            "keys": [
                "V"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:redo-cell-action",
            "keys": [
                "Shift Z"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:run-cell",
            "keys": [],
            "macKeys": [
                "Ctrl Enter"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:run-cell",
            "keys": [],
            "macKeys": [
                "Ctrl Enter"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode"
        },
        {
            "args": {},
            "command": "notebook:run-cell",
            "keys": [
                "Accel Enter"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:run-cell",
            "keys": [
                "Accel Enter"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode"
        },
        {
            "args": {},
            "command": "notebook:run-cell-and-insert-below",
            "keys": [
                "Alt Enter"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:run-cell-and-insert-below",
            "keys": [
                "Alt Enter"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode"
        },
        {
            "args": {},
            "command": "notebook:run-cell-and-select-next",
            "keys": [
                "Shift Enter"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode"
        },
        {
            "args": {},
            "command": "runmenu:run",
            "keys": [
                "Shift Enter"
            ],
            "macKeys": [
                "Ctrl Enter"
            ],
            "selector": "[data-jp-code-runner]"
        },
        {
            "args": {},
            "command": "settingeditor:open",
            "keys": [
                "Accel ,"
            ],
            "macKeys": [
                "Ctrl Enter"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "settingeditor:save",
            "keys": [
                "Accel S"
            ],
            "selector": ".jp-SettingEditor"
        },
        {
            "args": {},
            "command": "tabsmenu:activate-previously-used-tab",
            "keys": [
                "Accel Shift '"
            ],
            "selector": "body"
        },
        {
            "args": {},
            "command": "tooltip:dismiss",
            "keys": [
                "Escape"
            ],
            "selector": "body.jp-mod-tooltip .jp-Notebook"
        },
        {
            "args": {},
            "command": "tooltip:dismiss",
            "keys": [
                "Escape"
            ],
            "selector": "body.jp-mod-tooltip .jp-CodeConsole-promptCell"
        },
        {
            "args": {},
            "command": "tooltip:launch-console",
            "keys": [
                "Shift Tab"
            ],
            "selector": ".jp-CodeConsole-promptCell .jp-InputArea-editor:not(.jp-mod-has-primary-selection):not(.jp-mod-in-leading-whitespace)"
        },
        {
            "args": {},
            "command": "tooltip:launch-file",
            "keys": [
                "Shift Tab"
            ],
            "selector": ".jp-FileEditor .jp-CodeMirrorEditor:not(.jp-mod-has-primary-selection):not(.jp-mod-in-leading-whitespace)"
        },
        {
            "args": {},
            "command": "tooltip:launch-notebook",
            "keys": [
                "Shift Tab"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode .jp-InputArea-editor:not(.jp-mod-has-primary-selection):not(.jp-mod-in-leading-whitespace):not(.jp-mod-completer-active)"
        },
        {
            "args": {},
            "command": "notebook:toggle-all-cell-line-numbers",
            "keys": [
                "Shift L"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:toggle-cell-line-numbers",
            "keys": [
                "L"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:split-cell-at-cursor",
            "keys": [
                "Ctrl Shift -"
            ],
            "selector": ".jp-Notebook.jp-mod-editMode"
        },
        {
            "args": {},
            "command": "notebook:toggle-render-side-by-side",
            "keys": [
                "Ctrl Shift R"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:select-all",
            "keys": [
                "Accel A"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:toggle-render-side-by-side-current",
            "keys": [
                "Shift R"
            ],
            "selector": ".jp-Notebook:focus"
        },
        {
            "args": {},
            "command": "notebook:undo-cell-action",
            "keys": [
                "Z"
            ],
            "selector": ".jp-Notebook:focus"
        }
    ]
}
```