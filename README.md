JNPieLoader
===========

A pie loader for iOS

[<img src="https://github.com/FastSociety/cameo-encyclopedia/blob/master/images/Server.Architecture.Branded.png?raw=true" width="300" height="187"/>](https://github.com/FastSociety/cameo-encyclopedia/blob/master/images/Server.Architecture.Branded.png)

See a screenshot of the default loader in the piescreenshot.png file, or check it out on my [blog](http://nicholjs.com/post/24228867084/i-created-a-simple-pie-loader-for-ios-fork-it).

You can change the background image (defualt is the 40x40 pixel image included), edit the circle stroke color, and change the pie fill color. Update by passing values between 0 and 1.0 to:

    - (void)updateCurrentValue:(float)value