Chirp: An API-driven social network
===================================
Chirp is an Indianapolis Iron Yard Project created in an effort to simulate an API-driven social network. The project is a joint effort between the Front-End and Back-End Engineers in training. This markdown file is a breakdown of the Back-End elements of the project.

### Web application development platform:
* Rails

### Notable gems used in development:
* Socialization - allows any ActiveRecord model to Follow, Like and/or Mention any other model.
* ActiveModelSerializers - brings convention over configuration to JSON generation.

Basic Models
------------
1. User

  * once created, identified by auth_token
  * has many posts
  * acts as follower
  * acts as followable

2. Post

  * may be no longer than 160 characters
  * includes posts for current user
  * includes posts of the user current user is following
  * belongs to user

3. Follow

  * users may follow or be followed by other users
  * gem Socialization allows for follow, unfollow, followees count, and followers count

Endpoints
---------
### Login

POST /users/login

* username (required)
* password (required)
* verify with auth_token

`{
  "user": {
    "id": 106,
    "name": "example",
    "username": "example",
    "auth_token": "de7e7ab1b71ccc9c9df3",
    "bio_image": null,
    "bio": null,
    "post_count": 0,
    "followers_count": 0,
    "followees_count": 0
  }
}`

### Signup
POST /users

* name (required)
* username (required)
* email (required)
* password (required)
* creates auth_token upon successful signup

`{
  "user": {
    "id": 106,
    "name": "example",
    "username": "example",
    "auth_token": "de7e7ab1b71ccc9c9df3",
    "bio_image": null,
    "bio": null,
    "post_count": 0,
    "followers_count": 0,
    "followees_count": 0
  }
}`

`{
  "password": [
    "can't be blank"
  ],
  "username": [
    "can't be blank"
  ],
  "email": [
    "can't be blank"
  ]
}`

### Timeline
Logged in user posts plus the posts of the users the logged in user is following
GET /posts

* current_user
* following
* body
* created_at

Display of all posts with no current user
GET /posts

* body
* created_at

### Follow
POST /followings

### Unfollow
DELETE /followings/:id

### User list
GET /users

* user_id
* username

### Post a chirp
POST /posts

* current_user
* body
* created_at
