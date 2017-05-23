# Surrogate

We've run into the issue where some schools block APIs that our workshops use (like Twilio). Surrogate is our way of making those workshops work.

Surrogate is an HTTP proxy that we use to bypass school networks in our workshops.

## Configuration

Make sure you have the following env variables set up in CircleCI

```shell
HEROKU_EMAIL # Your Heroku account's email
HEROKU_AUTH_TOKEN # Your Heroku auth token. You can get this from their CLI with `heroku auth:token`
```

## License

See [LICENSE](LICENSE).
