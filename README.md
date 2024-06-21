# NaviTogether App

NaviTogether is a web-based app that keeps you connected with friends and family. Share your real-time whereabouts and enjoy unique social interactions. With NaviTogether, you'll never lose track of a friend again—connect, explore, and create memorable moments together!

Please also note the Web API that it uses: https://github.com/CryptoAlphaa/cryal-api

## Feature existed in this version
- Home Page
- Login
- Logout
- Register New Account (Token Based)
- Email Verification For New Account
- GitHub SSO Login
- Signed Client Requests
- XSS Prevention
- CSRF Prevention
- Code Injection Prevention
- Forge Asssets Prevention
- Asset Integrity : CSP
- Auth Token
- Auth Scopes
- Distributed Pool
- Encrypt and Decrypt data (App Level)
- Flash Bar
- Create Room (Room owner are set as an admin)
- Delete Room
- Join Room (Room member are set as a member)
- Exit Room
- Create Plan
- Delete Plan
- Create Waypoint
- Delete Waypoint
- View Profile
- API Token
- Get Location
- Map Visualization
- View My Room (List of joined and owned room with the authorization)

## Install

Install this application by cloning the *relevant branch* and use bundler to install specified gems from `Gemfile.lock`:

```shell
bundle install
```

## Test

This web app does not contain any tests yet :(

## Execute

Launch the application using:

Web API (https://github.com/CryptoAlphaa/cryal-api)
```shell
Puma
```
Web Application (https://github.com/CryptoAlphaa/navi-together-app)
```shell
rake run:dev
```

The application expects the API application to also be running (see `config/app.yml` for specifying its URL)
