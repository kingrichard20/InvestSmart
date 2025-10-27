**Quiz Button or Pop Up**  
**User Story 9: Metrics Collection for Task Success**  
**Metric**: Average completion of quizes and their scores.  
**Problem**: Users are not completing the quizes at the end of the lessons. Possibly unaware and not seeing the button for it.  
**Experiment**: Split the users randomly 50/50 to see which option works best to increase engagement.  
**Variations**: Change the button located at the bottom of the screen to a pop up that appears after a user completes a lesson to ensure the user sees the quiz.  

**Investments or Lessons**  
**User Story 2 (User Log In)**  
**Metric**: NPS / Lessons completion rate  
**Problems**: Should we send users to the lesson page when they first sign in, or directly to the "trading" screen  
**Experiments**: Create 2 groups, have 1 go directly to the "trading" screen and the other go to the lessons screen  
**Variations**: Either take the user to the lessons tab after login or the trading tab after sign in. IE, should the user be assumed to know how to trade, or should we have to teach them the basics first.  

**Profile vs Lessons**
**User Story 10: Metrics Collection for Average Session Frequency**
**Metric**: Average sessions per user (7-day window)
**Problem**: The app currently opens to the Profile screen after log in. While users can navigate to other tabs using the navigation bar, starting on the Profile screen may not immediately engage them. We want to test if landing directly on the Lessons tab encourages users to return more frequently.
**Experiment**: Randomly split users 50/50. One group lands on the Profile screen (current setup), and the other lands on the Lessons or another page upon login. Compare average sessions per user over a 7-day period.
**Variations**: Default screen = Profile Default screen = Lessons or another page

**Current lesson format vs. Short-form content**

# User Story 4: Lessons

## Metrics

- Task Success

## Problem

Users get bored while viewing lessons. Users do not successfully complete post-lesson quizzes, and spend too little time on lessons.

## Hypothesis

Short videos improve engagement and lead to more retention by users.

## Experiment

A random group of 25% of users can choose to see short videos instead of articles. Users complete quizzes after the lesson, the results of which we compare against quizzes done after standard lessons. In Firestore, quizzes done after short lessons can have a special property to differentiate between them and normal quiz results.

## Variations

We can "chain" short videos to convey more information in an engaging manner. Users can swipe up/down or left/right to watch each video.
