# Sign in to a homeserver

This document describes the flow of signin to a homeserver, and also the flow when user want to reset his password. Examples come from the `matrix.org` homeserver.

## Sign up flows

### Get the flow

Client request the sign-in flows, once the homeserver is chosen by the user and its url is known (in the example it's `https://matrix.org`)

> curl -X GET 'https://matrix.org/_matrix/client/r0/login'

200

```json
{
  "flows": [
    {
      "type": "m.login.password"
    }
  ]
}
```

### Login with username

The user is able to connect using `m.login.password`

> curl -X POST --data $'{"identifier":{"type":"m.id.user","user":"alice"},"password":"weak_password","type":"m.login.password","initial_device_display_name":"Portable"}' 'https://matrix.org/_matrix/client/r0/login'

```json
{
  "identifier": {
    "type": "m.id.user",
    "user": "alice"
  },
  "password": "weak_password",
  "type": "m.login.password",
  "initial_device_display_name": "Portable"
}
```

#### Incorrect password

403

```json
{
  "errcode": "M_FORBIDDEN",
  "error": "Invalid password"
}
```

#### Correct password:

We get credential (200)

```json
{
  "user_id": "@alice:matrix.org",
  "access_token": "MDAxOGxvY2F0aW9uIG1hdHREDACTEDb2l0MDgxNjptYXRyaXgub3JnCjAwMTZjaWQgdHlwZSA9IGFjY2VzcwowMDIxY2lkIG5vbmNlID0gfnYrSypfdTtkNXIuNWx1KgowMDJmc2lnbmF0dXJlIOsh1XqeAkXexh4qcofl_aR4kHJoSOWYGOhE7-ubX-DZCg",
  "home_server": "matrix.org",
  "device_id": "GTVREDALBF",
  "well_known": {
    "m.homeserver": {
      "base_url": "https:\/\/matrix.org\/"
    }
  }
}
```

### Login with email

If the user has associated an email with its account, he can signin using the email.

> curl -X POST --data $'{"identifier":{"type":"m.id.thirdparty","medium":"email","address":"alice@yopmail.com"},"password":"weak_password","type":"m.login.password","initial_device_display_name":"Portable"}' 'https://matrix.org/_matrix/client/r0/login'

```json
{
  "identifier": {
    "type": "m.id.thirdparty",
    "medium": "email",
    "address": "alice@yopmail.com"
  },
  "password": "weak_password",
  "type": "m.login.password",
  "initial_device_display_name": "Portable"
}
```

#### Unknown email

403

```json
{
  "errcode": "M_FORBIDDEN",
  "error": ""
}
```

#### Known email, wrong password

403

```json
{
  "errcode": "M_FORBIDDEN",
  "error": "Invalid password"
}
```

##### Known email, correct password

We get the credentials (200)

```json
{
  "user_id": "@alice:matrix.org",
  "access_token": "MDAxOGxvY2F0aW9uIG1hdHJpeC5vcmREDACTEDZXJfaWQgPSBAYmVub2l0MDgxNjptYXRyaXgub3JnCjAwMTZjaWQgdHlwZSA9IGFjY2VzcwowMDIxY2lkIG5vbmNlID0gNjtDY0MwRlNPSFFoOC5wOgowMDJmc2lnbmF0dXJlIGiTRm1mYLLxQywxOh3qzQVT8HoEorSokEP2u-bAwtnYCg",
  "home_server": "matrix.org",
  "device_id": "WBSREDASND",
  "well_known": {
    "m.homeserver": {
      "base_url": "https:\/\/matrix.org\/"
    }
  }
}
```

It's worth noting that the response from the homeserver contains the userId of Alice.

### Login with Msisdn

Not supported yet in RiotX

### Login with SSO

> curl -X GET 'https://homeserver.with.sso/_matrix/client/r0/login'

200

```json
{
  "flows": [
    {
      "type": "m.login.sso"
    }
  ]
}
```

In this case, the user can click on "Sign in with SSO" and the web screen will be displayed on the page `https://homeserver.with.sso/_matrix/static/client/login/` and the credentials will be passed back to the native code through the JS bridge

## Reset password

Ref: `https://matrix.org/docs/spec/client_server/latest#post-matrix-client-r0-account-password-email-requesttoken`

When the user has forgotten his password, he can reset it by providing an email and a new password.

Here is the flow:

### Send email

User is asked to enter the email linked to his account and a new password.
We display a warning regarding e2e.

At the first step, we do not send the password, only the email and a client secret, generated by the application

> curl -X POST --data $'{"client_secret":"6c57f284-85e2-421b-8270-fb1795a120a7","send_attempt":0,"email":"user@domain.com"}' 'https://matrix.org/_matrix/client/r0/account/password/email/requestToken'

```json
{
  "client_secret": "6c57f284-85e2-421b-8270-fb1795a120a7",
  "send_attempt": 0,
  "email": "user@domain.com"
}
```

#### When the email is not known

We get a 400

```json
{
  "errcode": "M_THREEPID_NOT_FOUND",
  "error": "Email not found"
}
```

#### When the email is known

We get a 200 with a `sid`

```json
{
  "sid": "tQNbrREDACTEDldA"
}
```

Then the user is asked to click on the link in the email he just received, and to confirm when it's done.

During this step, the new password is sent to the homeserver.

If the user confirms before the link is clicked, we get an error:

> curl -X POST --data $'{"auth":{"type":"m.login.email.identity","threepid_creds":{"client_secret":"6c57f284-85e2-421b-8270-fb1795a120a7","sid":"tQNbrREDACTEDldA"}},"new_password":"weak_password"}' 'https://matrix.org/_matrix/client/r0/account/password'

```json
{
  "auth": {
    "type": "m.login.email.identity",
    "threepid_creds": {
      "client_secret": "6c57f284-85e2-421b-8270-fb1795a120a7",
      "sid": "tQNbrREDACTEDldA"
    }
  },
  "new_password": "weak_password"
}
```

401

```json
{
  "errcode": "M_UNAUTHORIZED",
  "error": ""
}
```

### User clicks on the link

The link has the form:

https://matrix.org/_matrix/client/unstable/password_reset/email/submit_token?token=fzZLBlcqhTKeaFQFSRbsQnQCkzbwtGAD&client_secret=6c57f284-85e2-421b-8270-fb1795a120a7&sid=tQNbrREDACTEDldA

It contains the client secret, a token and the sid

When the user click the link, if validate his ownership and the new password can now be ent by the application (on user demand):

> curl -X POST --data $'{"auth":{"type":"m.login.email.identity","threepid_creds":{"client_secret":"6c57f284-85e2-421b-8270-fb1795a120a7","sid":"tQNbrREDACTEDldA"}},"new_password":"weak_password"}' 'https://matrix.org/_matrix/client/r0/account/password'

```json
{
  "auth": {
    "type": "m.login.email.identity",
    "threepid_creds": {
      "client_secret": "6c57f284-85e2-421b-8270-fb1795a120a7",
      "sid": "tQNbrREDACTEDldA"
    }
  },
  "new_password": "weak_password"
}
```

200

```json
{}
```

The password has been changed, and all the existing token are invalidated. User can now login with the new password.