Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
Method of working
------------
- I analysed the user stories and inferred the classes needed in my program. These were Order, Menu and SMSText.
- I drew a sequence diagram - see below - to show the relationship between objects and the messages they take i.e their interface methods.
- In irb I performed the feature test for the behaviour that I was currently testing
- I then created the simplest test for the interface method. Using RSpec: 
  * I saw my test fail (RED)
   * I wrote the code in order to make it pass
   * Then I saw it pass. (GREEN)
   * Then I REFACTORED it.
- I updated this README when a unit test was passed and staged all the files in Git (git add .) and did a git commit with a descriptive message.
- I ran rubocop to check adherence to coding style and format before every commit and sometimes while doing rspec.
- At certain times I did a git push to see all the changes in Github. This was useful to make sure my Git/Github was working fine and also it was a good to see the README updated in my Github homepage.
- I tried to follow a 15min period for the read & refine cycle in the context of the TDD process but I found it very difficult to do this. I hope to improve with practise.

Sequence diagram
--------------
Classes are Takeaway, Menu, Order and SMSText

Takeaway is passed 2 variables on initialization
- menu, an instance of Menu class > @menu instance variable
- order, an instance of Order class > @order instance variable

Menu is passed dishes on initialization, this is a hash containing all the dishes and their prices > @dishes instance variable

Order creates the instance variable @total_price on initialization.
```
     ┌────────┐          ┌────┐          ┌─────┐          ┌───────┐
     │Takeaway│          │Menu│          │Order│          │SMSText│
     └───┬────┘          └─┬──┘          └──┬──┘          └───┬───┘
         │     see_menu    │                │                 │    
         │ ────────────────>                │                 │    
         │                 │                │                 │    
         │       menu      │                │                 │    
         │ <────────────────                │                 │    
         │                 │                │                 │    
         │           select_items           │                 │    
         │ ────────────────────────────────>│                 │    
         │                 │                │                 │    
         │        confirm_selection         │                 │    
         │ <────────────────────────────────│                 │    
         │                 │                │                 │    
         │      see_all_selected_items      │                 │    
         │ ────────────────────────────────>│                 │    
         │                 │                │                 │    
         │          selected_items          │                 │    
         │ <────────────────────────────────│                 │    
         │                 │                │                 │    
         │          request_total           │                 │    
         │ ────────────────────────────────>│                 │    
         │                 │                │                 │    
         │              total               │                 │    
         │ <────────────────────────────────│                 │    
         │                 │                │                 │    
         │             checkout             │                 │    
         │ ────────────────────────────────>│                 │    
         │                 │                │                 │    
         │                 │                │      send       │    
         │                 │                │────────────────>│    
         │                 │                │                 │    
         │                 │                │  confirm_send   │    
         │                 │                │<────────────────│    
         │                 │                │                 │    
         │         confirm_checkout         │                 │    
         │ <────────────────────────────────│                 │    
     ┌───┴────┐          ┌─┴──┐          ┌──┴──┐          ┌───┴───┐
     │Takeaway│          │Menu│          │Order│          │SMSText│
     └────────┘          └────┘          └─────┘          └───────┘
```

### Acknowledgement
Many thanks to [Ibrahim Butt](https://github.com/ibrahimbutt) who helped me massively in understanding how the program should be structured to follow the OOP principles of single responsibility, open/closed principle, cohesion and delegation.

Original README content
=======
Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

* **WARNING** think twice before you push your mobile number or any private details to a public space like Github. Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
