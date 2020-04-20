# NYLisiting
This is a project to demonstrate working or internal communication of multiple project under a workspace, in a form of an iPhone application presenting the list of most viewed articles from the New York Times using SwiftUI.

### Requirements

In order to use the app, you will need to install carthage on your Mac OSX machine. ([how to install carthage on Mac OSX])(http://macappstore.org/carthage/). 
You will also need XCode installed on your computer version 11.3.1 or later. Available for free on the App Store.
The target version of this app is iOS 13.2+.
You need to signup for an API key at: [new york times developer protal](https://developer.nytimes.com/get-started), then replace the ‘sample-key’ with
the API key assigned to your account. 


### Installation
for Installing the App
 * Press `Command+Space` and type `Terminal` 
  and press enter/return key.

 * Then Run in Terminal app:
  `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null`
  and press enter/return key.

  If the screen prompts you to enter a password, please enter your Mac's user password to continue. When you type the         password, it won't be displayed on screen, but the system would accept it. So just type your password and press *ENTER/RETURN  key*. Then wait for the command to finish.
* Run: `brew install carthage`
* To build and run the project, Press the play button at the top of XCode or type `CMD + r`

### Fetch API Key...

For getting the api-key , you need to signup at [new york times developer protal](https://developer.nytimes.com/get-started), then replace the ‘sample-key’ with
the API key assigned to your account.

 * Create your account with the desired credentials.
 * Go to your profile section , and click `Apps`.
 * Create an app to get the api-key.
 * Enable the most popular articles api and create the Api-key.
 * Copy the `key` to paste it in the project.
 * Open the `NYListing.xcworkspace` with `Xcode`.
 * Traverse to `NYLisiting/EndPoints/EndPoints/Requisites/APIConstants` and replace the `apiKey` with your own key.
 * Build and run the project, Press the play button at the top of XCode or type `CMD + r`.
 
