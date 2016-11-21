Babylon Health Ruby Tech Test
=============================

To Run
------
pass the availability file a time in the command line e.g.

`$ ./availability.rb 12:40`

#### To Run Tests

- Make sure the dependencies are installed by running `bundle install` in the root directory.
- Run `rspec` in the root directory.

About
-----

This is a ruby based tech test for Babylon Health.  

Unfortunately I could not find enough time to get it 100% of the way there. In its present state (21/11/2016) it requires the final components linking up, final bug checks and linking up the feature testing suite.

#### Design

1. It takes the provided `availability_slots.json` file from the root directory and creates `/storage/temp.json` with it adding key : value pairs for `{ availabile:true }`.
2. It checks user input is valid.
3. It then recursively checks over `temp.json` for available time slots
4. It overwrites the file from `{ available:true }` to `{ available:false }` in order to book the slot.

##### Note

I decided to keep the storage as JSON as I thought it would be an easy way for apps to access the data.

Goal
----

Your task is to create an app that will allow patients to book appointments with a doctor, using the dataset provided.

## Requirements
You should create a command line app that accepts a single argument, which is the time that the patient
would like to book to see a doctor. Eg:

    $ ./availability.rb 12:40

The app should check which is the next available slot and book it.
It should print the time of the appointment that was booked

## Additional Requirements
Patients cannot book appointments before 8am and after 3pm. Once an availability has been
used up for an appointment it cannot be booked again.

In the dataset there are multiple doctors (id: 1 & 2) and each doctor can only have 1 appointment per slot.
For example, you could potentially book 12:20 once for doctor 1 and again for doctor 2.

## Constraints
* Please use the JSON file provided to load availability into your app.
* Your app should be an executable ruby script (command line).
* Your app should accept a time (eg: 12:40)
* Your app should print the time that was booked (eg: 1:10)
