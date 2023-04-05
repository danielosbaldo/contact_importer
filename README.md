# Contact Importer

## Description
A simple and yung app that lets users upload contacs and validates them

## General Information

* Ruby version 3.2.0

## Gems added
* Devise
  * User Authentication
  * uses email and username
* kaminari
  * adds pagination
* SimpleForm
* Test
  * Rspec
  * FactoryBot(check)
  * Facker


# How to run it

## Encryprion
 ### Need to generate the sectet key for encription rails
  we are using activestorage encription rails 7 method so we need to initialize the credential yml, remember to change the keys for your keys
  ```bash
    rails db:encryption:init
  ```
  And
  ```bash
    rails credentials:edit
  ```
remember to change the values on the yml file you can trigger the editor and change values using
```bash
EDITOR="your_favorite_editor" rails credentials:edit
```

## Set up the Database
```bash
rails db:migrate
```
## Run the Seeds To Have the Test User
* Rake Seeds: this will add the test user (user@example.com) with password: "aSecretPassword"
```bash
rails db:seed
```
## Run the Rspec Tests
* We are using Rspec so you can run it with
```bash
bundle exec rspec spec/
```
this way all the specs will be run

## **CSV location**
  you can use the csv file in the fixtures folder to test
  **spec/fixtures/files/test_contacts.csv**

