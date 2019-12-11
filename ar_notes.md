## Active Record migrations etc

Create a migration using a generator. Example:

``` 
$ rails g migration add_image_url_to_articles
```

Deleting a migration using a generator:

```
$ rails d migration add_image_url_to_articles
```

Adding a new attribute.

Add `image_url` as a string to the `articles` table:

```
$ rails g migration add_image_url_to_articles image_url:string
```

Once the migration has been created, I have to run the code and modify the db:

```
$ rails db:migrate
```



