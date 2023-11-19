
# User Defaults

## what is user defaults?
A key value default database where you can store values permanently across the launch of your app
The UserDefaults class provides a programmatic interface for interacting with the defaults system. The default system allows an app to customize its behavior to match a user’s preferences. For example, you can allow users to specify their preferred mode of display like dark mode or light mode.
Apps store these preferences by assigning values to a set of parameters in a user’s defaults database. The parameters are referred to as defaults because they’re commonly used to determine an app’s default state at startup or the way it acts by default.
UserDefaults caches the information you want to store
In a word, it can be said as an ios version of a cookie that persists permanently 


## pors and cons
- Security Issue: Data of different apps can be accessed using the UserDefaults and app group. See the documentation of Apple [here](https://developer.apple.com/documentation/foundation/userdefaults). 
  
```swift

extension UserDefaults {
    static let group = UserDefaults(suiteName: "group.your.identifier")
}
```

- Memory Management: UserDefaults interacts directly with users memory. So it may be memory-consuming in case of big data storing like images. 


## using UserDefaults

 - set values
 
 ```swift
 UserDefaults.standard.setValue(currentItems, forKey: "your_key")
 
 ```
 
 - get values
 
 ```swift
 // assuming that you have stored a string array
 var yourArray = UserDefaults.standard.stringArray(forKey: "your_key") ?? []
  
  ```
  
