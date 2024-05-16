# MOI InnovateX Hackathon: App prototype

This repository contains the work done for our MOI app prototype. The app is programmed using Flutter, a framework for Dart.

The challenge presented to us is that the MOI found that users were not actively engaging with the features of their website and application. How can we make the app more accessible and user-friendly, especially for people of determination and senior citizens? Additionally, how can we "gamify" the process and add incentive for people to use the MOI app?

## Accessibility features

To make the app more accessible and easy to use, we propose three changes.

First, a **redesign of the user interface** to have clearer categorizing of services and less clutter. The app at its current state is fully functional and presents its services on the home screen, but the presentation can be overwhelming for the average user, as they're presented with too much at once. It would be beneficial to categorize everything so that users aren't presented with too many options immediately. The newly proposed designs can be found in the repository.

Secondly, an **AI assistant** that takes both text input and speech input, and is able to output both text and speech as well. As of right now, the chatbot in the app is not capable of responding to user input very well. With this new assistant, which is also easier to use for POD, we have an algorithm which will be able to process input from users and guide them to the correct page/service. This can also eliminate the need for the manual PDFs and videos in the app, which are not very user-friendly.

Thirdly, a **text-to-speech on press** feature, which will make it so whenever any text is tapped on, it will be spoken aloud, which will be helpful to anyone with eyesight issues, especially senior citizens.

## Gamification

"Gamifying" the app can be a great way to encourage users to engage with the app more often. We propose a **points system**, in which you gain points for completing certain tasks. For example, paying a fine within a certain period of time can award points, to encourage people to pay their fines as soon as possible to receive a benefit. Another good example is that users can receive points simply for _not_ receiving any sort of fine or penalty for an extended period of time. This will encourage people to download and use the app even if they don't have any fines to pay, because they will simply receive a benefit over time.

## Using the app

The prototype app is developed using Flutter, and our team worked together using flutlab.io, an online IDE with emulation capabilities. Simply compress the contents of this repository to a .zip file, import that into FlutLab and build the project. The design was made with a display size of 393 x 808. The prototype does not contain the proposed redesigns, it simply contains the functionality of our accessibility features.
