[HEART Framework](https://docs.google.com/presentation/d/1jsU74QoRvHrJOn7TNcM3Fl6loHlXznhcWcdH3AIaFAA)

**Metric collection methods**
- Net Promoter Score (NPS): Users will be prompted to review/rate the app upon exiting, where their response will be recorded into the Firebase database with the rest of the user's information.
- Daily Active Users (DAU): Firebase Analytics automatically tracks the daily active users.
- Average Trades: The number of trades (buys/sells) a user makes can be tracked as a metric in Firebase. Storing the times of them could allow the average to be taken for the day, month, year, etc.
- Lesson Completion: The percentage of a course completed can be calculated using the number of lessons completed. Firebase can track that number and specifically which lessons have been finished as well.
- Click Through Rate (CTR): Track the click-through rate with Firebase Analytics, storing each time a user clicks the buttons to complete a quiz, start/complete a lesson, or go to their portfolio. Firebase Crashlytics can record any crash reports from users.
