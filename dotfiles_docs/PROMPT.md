# PROMPT
## Spaceship ZSH

This issue is related to how your terminal emulator renders Unicode 9 characters. To fix this issue:
- Make sure terminal uses Unicode Version 9 Widths.
- Let your terminal render ambiguous-width characters as double-width.

In iTerm follow these instructions:
- Go iTerm → Preferences… (⌘,) → Profiles → Text
- Check Unicode Version 9 Widths.
- Check Threat ambiguous-width characters as double-width.
- Reload terminal's tab.

## Resources
- [Troubleshooting](https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Troubleshooting.md)
