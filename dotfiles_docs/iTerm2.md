## Setting up iTerm2

Thanks to a [great blog post][stratus3d] by Trevor Brown, I learned that you can quickly set up iTerm2 by exporting your profile. Here are the steps.

1. Open iTerm2.
2. Select iTerm2 > Preferences.
3. Under the General tab, check the box labeled "Load preferences from a custom folder or URL:"
4. Press "Browse" and point it to `~/dotfiles/iterm2/<desired-machine-folder>/com.googlecode.iterm2.plist`.
5. Restart iTerm2.

### [Themes](https://github.com/mbadolato/iTerm2-Color-Schemes)

#### Installation Instructions

There are 2 ways to install an iTerm theme (both go to the same configuration location):

* Direct way via keyboard shortcut:
	* Launch iTerm 2. Get the latest version at <a href="http://www.iterm2.com">iterm2.com</a>
	* Type CMD+i (⌘+i)
	* Navigate to **Colors** tab
	* Click on **Color Presets**
	* Click on **Import**
	* Click on the **schemes** folder
	* Select the **.itermcolors** profiles you would like to import
	* Click on **Color Presets** and choose a color scheme

* Via iTerm preferences
	* Launch iTerm 2. Get the latest version at <a href="http://www.iterm2.com">iterm2.com</a>
	* Click on **iTerm2** menu title
	* Select **Preferences...** option
	* Select **Profiles**
	* Navigate to **Colors** tab
	* Click on **Color Presets**
	* Click on **Import**
	* Select the .itermcolors file(s) of the [schemes](schemes/) you'd like to use
	* Click on **Color Presets** and choose a color scheme

## Setting up Terminal.app

Getting set up after a fresh install is simple.

1. Open Terminal.app.
1. Select Terminal > Preferences. (But really you'll just press &#8984;, right? So much faster.)
1. Select the Profiles tab.
1. Click the gear icon and select Import...
1. Select `~/dotfiles/terminal/<desired-profile>.terminal` and click Open.
1. Click the Default button to keep using this profile in new Terminal windows.
