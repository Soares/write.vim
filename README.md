# Write.vim
## Get your author on

Write.vim helps you turn vim into not just a code editor, but an editor for
plain text (novels, stories, papers, articles, etc.).

This plugin provides the commands :WriteOn, :WriteOff, and :Write. It's
recommended that you add your own mappings to trigger these commands, such as:

    noremap <leader>w :WriteOn
    noremap <leader>W :WriteOff

or

    noremap <leader>w :Write

to toggle writer mode. Statusline hooks are also provided. See doc/write.txt for
details.

You can use the 'g:write\_auto' setting to mark a list of filetypes that go into
write mode automatically.
