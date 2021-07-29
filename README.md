## Why this exists

So that I can finish my Sinatra Project on my path to becoming a Flatiron graduate. 

    rails new APP-NAME

Install the gem, run `corneal new APP-NAME`, run `bundle install`, and you're all set! You can start up your server with `shotgun` and verify everything is working. It is as simple as that.

It uses a file structure similar to what you would see with Rails.

Directory structure:
```
├── config.ru
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── README
├── app
│   ├── controllers
│   │   └── application_controller.rb
│   ├── models
│   └── views
│       ├── layout.erb
│       └── welcome.erb
├── config
│   ├── initializers
│   └── environment.rb
├── db
│   └── migrate
├── lib
│   └── .gitkeep
└── public
|   ├── images
|   ├── javascripts
|   └── stylesheets
|       └── main.css
└── spec
    ├── application_controller_spec.rb
    └── spec_helper.rb
```

## Using Corneal

To generate your app:

    corneal new APP-NAME

After Corneal is done generating your app, run `bundle install` from your app's directory:

    cd APP-NAME
    bundle install

You can then start your server with `shotgun`:

    shotgun

You can generate a model and migration file:

    corneal model NAME

You can also generate an entire MVC structure complete with a migration file:

    corneal scaffold NAME

The resulting structure will look like this:

```
└─app
  ├── controllers
  │   ├──application_controller.rb
  │   └──new_model_controller.rb
  ├── models
  │   └──new_model.rb
  └── views
      ├──new_models
      │  ├──index.html.rb.erb
      │  ├──show.html.rb.erb
      │  ├──new.html.rb.erb
      │  └──edit.html.rb.erb
      ├── layout.erb
      └── welcome.erb
```

You can also add your model attributes when you generate the scaffold structure and have them added to your migration file:

    corneal [model/scaffold] NAME name:string age:integer

```
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.age :integer

      t.timestamps null: false
    end
  end
end
```

Visit [http://localhost:9393/](http://localhost:9393/) to verify your app is running.

You can also verify it is working by running `rspec` to see the passing test:

    1 example, 0 failures

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thebrianemory/corneal This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

    Copyright (c) 2021 NOBODY, HAVE IT SEE IF I CARE. 

