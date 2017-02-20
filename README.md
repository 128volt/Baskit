## Overview
That is demo proof-of-concept application to show Buckit's design in action at iOS devices. What is working:

* You can add new list, only one's 'text can be modified at creation page.
* You can add new thing (as new "add new thing" view was supplied random thing will be added).
* Lists can be expanded and collapsed by tapping on them.
* Data is filled randomly on each application launch (to fill it again just fully close application and launch again).

### Proposals

* For demonstration purposes I've addded 2 keyboard types (dark & white), one is on title text box, other one at tags box. Please choose what fits better for you.
* Current fonts is unreadable on all devices prior to iPhone 6 and higher, I recommend again to increase font sizes from 10points to 14-16 points. Font sized at "New Task List" are fine.

### Missing data from designer

1. Tab Bar icons (I've used example ones)
2. "Eye" icon (at the left side of list item)
3. ‼️ Create new thing (subtask) view.
4. Design of list items with share icon and number of unread messages (as we agreed before only Lists can be shared, not Subtasks inside them). 
5. "Shared with" is displayed at subtask item, but only List can be shared, so do we need to duplicate "shared with" in each subtask item?
6. You hadn't replied about meaning of "cross" and "back" buttons at new list creation, I moved "accept" button to the top-right side and removed "cross" button.
7. ‼️ I have only 2 view, I've implemented it. There are no Things, Profile, Create New Thing, Set Due/Location (at create New List) etc were provided. I've said before that it maybe better me to find some designer that can do *secondary* views based on your designs for me, I again recommend to do so.

I can do some secondary view by myself, but you're using non-standart design (for iOS) so it will be quite hard for me to make it look very good as your designs, I afraid to spoil your design with my elements :(

### Questions

1. No tags list from subtask items are displayed on main page. Don't you need it? If not, what will be the goal of tags? If "health" is a tag, how will be multiple tags displayed?
2. I don't see any indication that list is expanded or collapsed, how user will know current state of list? How will user know that there are any subtasks inside that list? 
3. We got a missing indication if task is "repeated" at new task list creation view.
