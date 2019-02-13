For this project, I repurposed my existing Ruby on Rails Marvel app to a jQuery one. I use jQuery for some aspects of a few routes.

It was somewhat difficult. The idea of partial JS use in a few places is tough to understand. Where I used Ruby before, now I had to interrupt certain actions and use jQuery.

I had to add serializers to edit the data I would post and get, and convert that data to JSON. I had to add logic in my controllers that gave HTML if it was Rails request, and JSON for a javascript request. It was quite strange. 

I had to get new forms and logic to use jQuery and not Ruby. I had to do this for all of my different tables. 

It is weird. One time I caught myself putting a console.log inside Ruby! That is very wrong! But hilarious.

If felt weird spending a lot of time on a project, but not adding any new features or items. Just refactoring into a new language.