## GitHub Invoices

A simple [Ruby][] script that uses [Mechanize][] to sign in to our [GitHub][] account, find the most recent invoice and save it to [Dropbox][].

### Limitations

* We have to sign in to GitHub as their API doesn't give us access to payment history.
* The user we sign in as has to be a member of the Owners team of the Organisation so that they have admin access.
* You can't enable two factor authentication for this user as that would break the automated aspect of the script.

[Dropbox]: https://www.dropbox.com/
[GitHub]: https://github.com/
[Mechanize]: https://github.com/sparklemotion/mechanize
[Ruby]: https://www.ruby-lang.org/en/
