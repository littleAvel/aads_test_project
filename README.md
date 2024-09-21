# AADS Test Assignment

This web application is a test assignment for AADS, developed using Ruby on Rails 7. It features user registration, subscription functionality, and a commenting system for posts.

## Project Description

The application allows users to:

- **Register and Authenticate**: Users can sign up and log in using Devise 4.9 for authentication.
- **Create Posts**: Users can create text-based posts that are visible to others.
- **Follow Other Users**: Users can subscribe to other users to see their posts in a chronological feed.
- **Comment on Posts**: Users can comment on posts. Comments can also be replies to other comments, creating a tree structure for discussions.

## Technologies Used

- **Ruby on Rails**: Version 7
- **Database**: PostgreSQL
- **Authentication**: Devise 4.9

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/littleAvel/aads_test_project.git
   cd aads_test_project
2. **Install Dependencies:**
    ```bash
    bundle install
3. **Create and set up the database**
    ```bash
    rails db:create
    rails db:migrate
2. **Run Seeds:**
    ```bash
    rails db:seed
3. **Run the Application:**
    ```bash
    rails server

## Demo

You can see the application in action in the following video:

https://github.com/user-attachments/assets/3bd8e097-9307-4654-ae0b-a670dc8d0504





