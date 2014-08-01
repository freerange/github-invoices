## GitHub Invoices

A simple [Ruby][] script that uses [Mechanize][] to sign in to our [GitHub][] account, find the most recent invoice and save it to [Dropbox][].

### Usage

This assumes that you know how to create a [Dropbox App][] and obtain the generated access token.

    # Clone this repository
    $ git clone https://github.com/freerange/github-invoices.git

    # Install the gems
    $ bundle install

    # Configure the environment variables
    $ echo GITHUB_LOGIN=<your-github-username> >> .env
    $ echo GITHUB_PASSWORD=<your-github-password> >> .env
    $ echo GITHUB_ORGANISATION=<your-github-organisation> >> .env
    $ echo DROPBOX_ACCESS_TOKEN=<your-dropbox-access-token> >> .env

    # Run the script
    $ bundle exec ruby github-invoices.rb

### Limitations

* We have to sign in to GitHub as their API doesn't give us access to payment history.
* The user we sign in as has to be a member of the Owners team of the Organisation so that they have admin access.
* You can't enable two factor authentication for this user as that would break the automated aspect of the script.

### License

GitHub Invoices is released under the [MIT License][].

[Dropbox]: https://www.dropbox.com/
[Dropbox App]: https://www.dropbox.com/developers/apps
[GitHub]: https://github.com/
[Mechanize]: https://github.com/sparklemotion/mechanize
[MIT License]: http://opensource.org/licenses/MIT
[Ruby]: https://www.ruby-lang.org/en/
