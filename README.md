This is a minimal example of receiving webhooks.

You can run this example by running:

```
cd path/where/you/cloned/this/repository
bundle install
ruby my_app.rb
```

You will be see the webapp startup with output like:

```
[2017-04-12 12:36:14] INFO  WEBrick 1.3.1
[2017-04-12 12:36:14] INFO  ruby 2.4.0 (2016-12-24) [x86_64-darwin15]
== Sinatra (v1.4.8) has taken the stage on 4567 for development with backup from WEBrick
[2017-04-12 12:36:14] INFO  WEBrick::HTTPServer#start: pid=78257 port=4567
```

In another terminal you can simulate a webhook by running:

```bash
$ curl -XPOST -d '{"event":"created","budget":{"category_guid":"CAT-123","amount":105}}' http://localhost:4567/hook
```

Then you will see the results of this webhook like this:

```
{"event"=>"created", "budget"=>{"category_guid"=>"CAT-123", "amount"=>105}}
::1 - - [12/Apr/2017:12:43:34 -0600] "POST /hook HTTP/1.1" 200 7 0.0034
::1 - - [12/Apr/2017:12:43:34 MDT] "POST /hook HTTP/1.1" 200 7
- -> /hook
```

In your system you could take the parsed JSON data and send it to a database or a logging system or perhaps trigger an email based on it.
