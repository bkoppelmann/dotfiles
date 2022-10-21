local snip = require('luasnip')

snip.add_snippets('mail', {
    snip.parser.parse_snippet('mfg', 'Mit freundliche Grűßen,\nBastian Koppelmann'),
    snip.parser.parse_snippet('gr', 'Schönen Gruß,\nBastian'),
    snip.parser.parse_snippet('ch', 'Cheers,\nBastian'),
    snip.parser.parse_snippet('br', 'Best Regards,\nBastian'),
})

vim.keymap.set('i', '<Tab>', snip.expand_or_jump, options)
