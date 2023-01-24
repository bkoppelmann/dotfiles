local snip = require('luasnip')

snip.add_snippets('mail', {
    snip.parser.parse_snippet('mfg', 'Mit freundlichen Grüßen,\nBastian Koppelmann'),
    snip.parser.parse_snippet('gr', 'Schönen Gruß,\nBastian'),
    snip.parser.parse_snippet('ch', 'Cheers,\nBastian'),
    snip.parser.parse_snippet('br', 'Best Regards,\nBastian'),
    snip.parser.parse_snippet('rb', 'Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>'),
    snip.parser.parse_snippet('ab', 'Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>'),
    snip.parser.parse_snippet('tb', 'Tested-by Bastian Koppelmann <kbastian@mail.uni-paderborn.de>'),
})

vim.keymap.set('i', '<Tab>', snip.expand_or_jump, options)
