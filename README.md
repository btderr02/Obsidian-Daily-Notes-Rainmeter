# Obsidian-Daily-Notes-Rainmeter
This simple rainmeter skin displays daily notes written with markdown formatting in Obsidian.
### 1. Motivation
I recently began using Obsidian to take notes, make to-do lists, etc. I use the Calendar community plugin to create daily notes for planning out my day. I wanted a Rainmeter skin that displayed each day's note from my Obsidian vault on my desktop. Such a skin did not exist, so I made it myself.
### 2. Functionality
- Read system time.
- Using "YYYY-MM-DD" date format, read the matching file in a given folder (the same folder that the Calendar plugin points to).
- Display the contents of the file with markdown formatting.
### 3. Usage
- Download and install
- Left click on the skin and paste your daily note file location.
### 4. Creation Process for Those Who Care
Rainmeter is not typically used for a task like this. If you are not familiar with the program, it is a desktop customization tool that is primarily used for displaying system information or providing links to external applications. User created "skins" can be thought of as widgets on the desktop and typically show things like the date and time, weather forecasts, or hardware statuses. Rainmeter allows for some functionality simply by creating and editing a new .ini file. Within a skin's .ini file there are "measures" which read information and "meters" which display information. Skin functionality is extended greatly by the ability to call lua scripts from the main .ini file. 

I started the project from a forum answer from jsmorely on the Rainmeter Forums: [Read a text file into a meter? - Rainmeter Forums](https://forum.rainmeter.net/viewtopic.php?t=6998). There is no built in way to read plaintext files in Rainmeter. This skin's "measure" points to a lua script that writes a given plaintext file into a format that Rainmeter can read. It reads the file and adds a new line character, "\\n", after every line. This is then passed to the Rainmeter "meter" as one long string. The lua script reads .md files no differently than .txt files.

With the text now displayed on the Rainmeter skin, the next step was to translate the markdown formatting. This was slightly complicated because of the way that Rainmeter handles text as one string.  In the Rainmeter .ini file, I used regular expression tags to select certain patterns in the text which match markdown formatting standards. Markdown formatting indicators are selected. Text associated with those indicators are assigned appropriate formatting. The indicators themselves are set to size 0.001 to effectively make them invisible. Most of the formatting options are native within Rainmeter. Checkboxes, however, were an exception. I used regex tags in the lua script to find check boxes and replace them with unicode filled and unfilled squares. I then tweaked the design of the skin to match Obsidian's design as closely as possible. After implementing markdown formatting, I added the GUI for entering a folder path and adjusted line indentation.

### 5. Closing
Overall, I have really enjoyed the process of working on this project. It is something that I wanted for personal use and decided others might find it useful as well. The markdown -> Rainmeter formatting might be useful for other projects and further integration between Obsidian and Rainmeter.
