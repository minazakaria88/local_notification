# test_notification

flutter local notification


setup


# first mainfest file

 <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
  <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />
    <uses-permission android:name="android.permission.USE_EXACT_ALARM" />


 <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
     <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED"/>
                <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
                <action android:name="android.intent.action.QUICKBOOT_POWERON" />
                <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
            </intent-filter>
        </receiver>

# this work for debug mode


# to work in release mode

# steps

adding this file https://github.com/google/gson/blob/main/examples/android-proguard-example/proguard.cfg  to android/app

adding this file https://github.com/MaikuB/flutter_local_notifications/blob/master/flutter_local_notifications/example/android/app/src/main/res/raw/keep.xml


# greate it work 


