# GameGather

===

# GamerGather

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
[This app enable user to post request for forming a gaming team. Making friends with other gamers and ask for guidance on specific game. People can sign up and log in the app. User can also post ther game progress, their ranking or strategy and so on]

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social
- **Mobile:** Mobile only, uses photo
- **Story:** Allow users to make posts for finding teammates and exchange information on games, including ranking, strategy and others. 
- **Market:** Mostly teenagers and gamers. Providing a platform for people who don't have friends to play together or those who like to delve into gameplay.
- **Habit:** User can create posts and team up request throughout the day. List the user's gaming achievement to encourage them spend more time on certain game. Show excellent member's hight ratings to increase their population, and encourage more user to compete to be better game tutors.
- **Scope:** The earlies version focuses on mobile game players, and porvide basic function like posting game snapshots and viewing feeds. Later version wil expand to support web games or console games, and add tutor ranking feature.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [fill in your required user stories here]
* [X] User post team up request 
* [X] User can view game info from the games page
* [X] User profile: username displayed and user can upload profile image
* [ ] Users respond to teams' posts to form groups.
* [X] User can sign up and sign in.
* [X] App icon and Launch scene 



**Optional Nice-to-have Stories**

* [fill in your optional user stories here]
* [ ] User can rate a previous cooperation
* [ ] User can dislike someone and never be in the same game with that person.

### 2. Screen Archetypes

* Login and sign up
   * Froce users to build up basic personal profile
* Game Gallery
   * Select the game that the user want to know about
* Team up & Make Posts
   * Making a post to find teammates
* Community page with game discussion and news   
   

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* First tab: Tab to choose/view the game the user is playing. 
* Second tab: Add details on the team up request info in text field, like number of members needed, time to meet together, ect. post the request.
* Third tab: return to home page.
* Fourth tab: Community, view game info, latest news etc.

**Flow Navigation** (Screen to Screen)

* Forced Login or Sign up
* Sign up -> Forced personal profile build up
* Game selecion -> Jumps to post area
* Post -> post text editing
* Exit -> exit to the game selection screen

## Wireframes
[Add picture of your hand sketched wireframes in this section]
* Note: We directly used Figma
<img src="https://i.imgur.com/aJlsrp1.png" width=600>
<img src="https://i.imgur.com/vSQ2EwA.png" width=600>

### [BONUS] Digital Wireframes & Mockups
<img src="https://i.imgur.com/aJlsrp1.png" width=600>
<img src="https://i.imgur.com/vSQ2EwA.png" width=600>

### [BONUS] Interactive Prototype
<img src='https://i.imgur.com/HkNlsKu.gif' width='300' alt='Video Walkthrough' />


## Schema 
[This section will be completed in Unit 9]
### Models

Team up posts

| Property      | Type            | Description                         |
|---------------|-----------------|-------------------------------------|
| objectID      | String          | unique id for the team request post |
| author        | Pointer to User | post author                         |
| image         | file            | image the user uploaded             |
| caption       | String          | detail info to find team members    |
| commentsCount | Number          | numbers of comments to the post     |
| likesCount    | Number          | numbers of likes to the post        |
| createdAt     | DateTime        | date when post is created           |
| commentedAt   | DateTime        | date when post last commented       |

Community posts

| Property      | Type            | Description                         |
|---------------|-----------------|-------------------------------------|
| objectID      | String          | unique id for the user post         |
| author        | Pointer to User | post author                         |
| image         | file            | image the user uploaded             |
| caption       | String          | post caption by author              |
| commentsCount | Number          | numbers of comments to the post     |
| likesCount    | Number          | numbers of likes to the post        |
| createdAt     | DateTime        | date when post is created           |
| commentedAt   | DateTime        | date when post last commented       |

### Networking
- [Add list of network requests by screen ]

Login and sign up Screen
 - (Read/Get) Query logged in user object
 - (Create) new user object when sign up

Team up & Make Posts Screen
 - (Read/Get) Query all posts where user is author

Create post Screen
 - (Create/Post) Create a new post object

Games Gallery Screen
 - (Read/Get) Query all games object

Community Scree 
 - (Read/Get) Query all community posts where user is author

Profile Screen
- (Read/GET) Query logged in user object
- (Update/PUT) Update user profile image and information

---------------------------------------------------------------
- [Create basic snippets for each Parse network request]
    * user 

    '''
        
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                //self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    '''
    
- [OPTIONAL: List endpoints if using existing API such as Yelp]


<img src='http://g.recordit.co/UFuyR8ZCfn.gif' width='900'/>

### Milestone 1

<img src='https://i.imgur.com/ORZjkDf.gif' width='300' alt='Video Walkthrough' />

<img src='https://i.imgur.com/PbTwquV.gif' width='300' alt='Video Walkthrough' />

<img src='https://i.imgur.com/2Od7SiB.gif' width='300' alt='Video Walkthrough' />


### Milestone 2

<img src='https://i.imgur.com/bcFBsWg.gif' width='300' alt='Video Walkthrough' />

<img src='https://i.imgur.com/J4OvgL7.gif' width='300' alt='Video Walkthrough' />


### Milestone 3

<img src='https://i.imgur.com/SLphegh.gif' width='300' alt='Video Walkthrough' />

<img src='https://i.imgur.com/rnX1CCk.gif' width='300' alt='Video Walkthrough' />



