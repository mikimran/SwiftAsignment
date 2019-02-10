# SwiftAsignment
SwiftAsignment

NY Times Top Stories Articles

Description
A simple iOS Native app developed in Swift to hit the The NY Times TopStories Articles API and show a list of articles, that shows details when items on the list are tapped (a typical master/detail app).

Demonstrations

Covers the following:

	•	  Object Oriented Programming Approach
	•	  MVVM Approach
	•	  Unit Tests
	•	  Simple UI Test by Record UI Test
	•	  Generic and simple code

App Features:

	•	  SingleView applciation
	•	  Auto layout with Dynamic Cell Resizing
	•	  Dynamic Time Period Configuration

Pod Library :

  library used for an async image downloader with cache support.

	  •	  pod 'SDWebImage', '~> 4.0'


Installation :

	⁃	Pods are made available as part of repository, to facilitate simplicity in checkout and execution. Simply checkout and run the project.

Build :

To build using xcodebuild without code signing

	xcodebuild clean build -workspace "SwiftAsignment.xcworkspace" -scheme "SwiftAsignment" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

Tests :

To run tests using xcodebuild.

	xcodebuild -workspace "SwiftAsignment.xcworkspace" -scheme "SwiftAsignment" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS 10.3' test
