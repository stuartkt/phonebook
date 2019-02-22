Phonebook

# API

## User Auth

##### Sign Up

```
POST localhost:3000/api/v1/auth


{
  "email": "email",
  "password": "password"
}
```

##### Sign In

```
POST localhost:3000/api/v1/auth/sign_in

Body:
{
  "email": "email",
  "password": "password"
}

Headers:

{ uid, access-token, client }
```

## PhoneBook

#### Create Phonebook

Need to include Uid, Access-token and Client in the headers


**GET localhost:3000/api/v1/phonebook** - Gets all phonebooks for current user

`localhost:3000/api/v1/phonebook?search="search"` - Search for a phonenook with certain name


**GET localhost:3000/api/v1/phonebook/:id** - Gets one phonebook by id



**POST localhost:3000/api/v1/phonebook/:id** - Creates a new Phonebook for current user
```
{
  	"name": "Phonebook 1"
}
```

**PUT|PATCH localhost:3000/api/v1/phonebook/:id** - Updates phonebook only if it belongs to current user
```
{
  	"name": "Update Phonebook"
}
```

**DESTROY localhost:3000/api/v1/phonebook/:id** - Deletes phonebook (will also delete Contacts belonging to that phonebook) if belongs to current user


## Contacts

**GET localhost:3000/api/v1/phonebook/:id/contacts** - Gets all contacts in a phonebook

`localhost:3000/api/v1/phonebook/:id/contacts?search="search"` - Search for a contact in a phonebook with certain name


**GET localhost:3000/api/v1/contacts/:id** - Gets one contact by id


**POST localhost:3000/api/v1/phonebook/:id/contacts** - Creates a new contact in phonebook
```
{
	"contact": {
		"name": "John Doe",
		"phone_numbers_attributes":[
			{
				"phone_type": "home,
				"phone_number": "123423123"
			},
      {
				"phone_type": "work",
				"phone_number": "123423123"
			}],
			
		"address_attributes": {
			"property_number": "100",
			"street_name": "Street Lane",
			"city": "City Name",
			"area_code": "AREA CODE",
			"country": "Country"
		},
		"emails_attributes": [
			{
				"address": "email address",
				"email_type": "home"
       
			},
      {
				"address": "email address",
				"email_type": "work"
			}]
	}
   
}
```

**PUT|PATCH localhost:3000/api/v1/phonebook/:id** - Updates phonebook only if it belongs to current user. Include id of nested 
attributes.
```
{
	"contact": {
		"phone_numbers_attributes":[
			{
				"id": 15,
				"phone_type": "work",
				"phone_number": "23123"
			
			}]
	}
}

Add _destroy: true if want to delete a nested attribute

{
	"contact": {
		"phone_numbers_attributes":[
			{
				"id": 15,
				"phone_type": "work",
				"phone_number": "23123",
        "destroy": true
			
			}]
	}
}


```

**DESTROY localhost:3000/api/v1/contact/:id** - Deletes phonebook (will also delete Contacts belonging to that phonebook) if belongs to current user
