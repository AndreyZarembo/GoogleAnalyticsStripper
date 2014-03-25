GoogleAnalyticsStripper
=======================

This shell script strips all Tag libraries from google analytics 3.03a and creates library without any references to ASIdentifierManager.

Use this AS-IS for you own risk.

This library can be used with Cocoapods GoogleAnalytics.

***IMPORTANT***

My app successfully passed Apple Review with this library.


How to use
----------

1. Download Latest GoogleAnalytics SDK for iOS. Current version is 3.03a
2. Copy script **stripTag.sh** into folder with libGoogleAnalyticsServices.a
3. Open **Terminal.app** goto folder with GA lib and chmod **stripTag.sh** to allow execution


		chmod a+x stripTag.sh
	
4. Run it from GA lib folder with command

		. stringTag.sh
	
	(dot, space, script name. Don't use slashed)
	
5. libGoogleAnalyticsServices-strip.a should appear in this folder. 
6. Check it for **ASIdentifierManager** with this command

		nm libGoogleAnalyticsServices-strip.a | grep ASIdentifierManager
7. Rename it into libGoogleAnalyticsServices.a and use it.

Cocoapods
---------

Add GoogleAnalytics pod as usual, create sripped version of library and place it into 

		$(ProjectDir)/Pods/GoogleAnalytics-iOS-SDK

Thanks
------

Special thanks to Falko Buttler for great idea from this post

https://groups.google.com/forum/#!topic/ga-mobile-app-analytics/0mr85C7704M

And thanks to author of this article

http://atnan.com/blog/2012/01/12/avoiding-duplicate-symbol-errors-during-linking-by-removing-classes-from-static-libraries
	
	
