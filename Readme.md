MailCannon Outpost
==================

Use this wrapper to deploy your [MailCannon](https://github.com/lucasmartins/mailcannon) workers to the war.

**This is a work in PROGRESS, use it at your own risk**

Install
=======

Refer to the main gem for more details: [MailCannon](https://github.com/lucasmartins/mailcannon)

You should be able to clone/fork this repo and run the wrapper like this:

```bash
  $ bundle exec sidekiq -r ./runner.rb
```

You can access a console with MailCannon environment loaded like this:
```bash
  $ irb -r ./runner.rb
```

Use
===

Create a `MailCannon::Envelope`:
```ruby
envelope = MailCannon::Envelope.create(
  from: 'test@mailcannon.com',
  to: [{email: 'lucasmartins@railsnapraia.com', name: 'Lucas Martins'}],
  subject: 'Test',
  mail: MailCannon::Mail.new(text: 'you will see this when no HTML reader is available', html: 'this should be an HTML'))
```

Contribute
==========

Just fork [MailCannon Outpost](https://github.com/lucasmartins/mailcannon-outpost), add your feature/fix+spec, and make a pull request.

**NOTICE**: The project is at embrionary stage, breaking changes will apply.

Support
=======

This is an opensource project so don't expect premium support, but don't be shy, post any troubles you're having in the [Issues](https://github.com/lucasmartins/mailcannon-outpost/issues) page and we'll do what we can to help.

License
=======

MailCannon is free software under the [FreeBSD license](http://www.freebsd.org/copyright/freebsd-license.html).
