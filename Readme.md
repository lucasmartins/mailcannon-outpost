MailCannon Outpost
==================

Use this wrapper to deploy your [MailCannon](https://github.com/lucasmartins/mailcannon) workers to the war.

**This is a work in PROGRESS, use it at your own risk**

Install
=======

Refer to the main gem for more details: [MailCannon](https://github.com/lucasmartins/mailcannon)

[Download](https://github.com/lucasmartins/mailcannon-outpost/archive/master.zip) (or Clone/Fork) this repo, modify `env.sh` to meet your own variables and run it:
```bash
  $ git clone git@github.com:lucasmartins/mailcannon-outpost.git
  $ cd mailcannon-outpost
  $ . ./env.sample.sh # this will create an env.sh file.
  $ vim env.sh
  $ . ./env.sh
```

You should be able to and run the wrapper like this:

```bash
  $ be sidekiq -r ./runner.rb --config=config/sidekiq.yml -v
```

You can access a console with MailCannon environment loaded like this:
```bash
  $ irb -r ./runner.rb
```

MailCannon Outpost will use your `MONGOBD_URL`, and you should check `config/mongoid.yml` file.

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
