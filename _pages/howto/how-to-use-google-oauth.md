## How to use Google OAuth(Google APIs)

Set redirect_url in [Google APIs Console](https://console.developers.google.com/apis/credentials?project=app-foo-bar&organizationId=123).
For development, you can add http://localhost:3000 to Authorized JavaScript origins field

!()[/attachments/WX20171107-104419%402x.png]

## How to get Google ID token (JWT) manually

Create a `google-login.html` file with content below, and save to `/tmp/google-login.html`

````
<html lang="en">
 
<head>
  <meta name="google-signin-scope" content="profile email">
  <meta name="google-signin-client_id" content="5647321617-5i3s5o74ajp1230nt7oj032191rnp.apps.googleusercontent.com">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
 
<body>
  <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
  <script>
    function onSignIn(googleUser) {
      // Useful data for your client-side scripts:
      var profile = googleUser.getBasicProfile();
      console.log("ID: " + profile.getId()); // Don't send this directly to your server!
      console.log('Full Name: ' + profile.getName());
      console.log('Given Name: ' + profile.getGivenName());
      console.log('Family Name: ' + profile.getFamilyName());
      console.log("Image URL: " + profile.getImageUrl());
      console.log("Email: " + profile.getEmail());
 
      // The ID token you need to pass to your backend:
      var id_token = googleUser.getAuthResponse().id_token;
      console.log("ID Token: " + id_token);
    };
  </script>
</body>
 
</html>
```

Open terminal, and change dir to `/tmp`. Run a small http server. (You should add http://localhost:8000 to Google APIs console first)

```
$ cd /tmp
$ python -m SimpleHTTPServer
```

Access http://localhost:8000 in Chrome. Open Chrome console (Command+Option+I), the log should be

```
ID: 1113951341069
Full Name: Devin Chen
Given Name: Devin
Family Name: Chen
Image URL: https://lh4.googleusercontent.com/-yz7r1f-73Vks/AAAAAAAAAAI/AAAAAAAADwU/2XdL1aH1kl_4/s916-c/photo.jpg
Email: d3vin.chen@gmail.com
ID Token: eyJhbGciOiJSUzI1NiIs1ImtpZCI6ImFjZGU4ZDdjMTk5N21Q4MmRjZjVkNW1VkMjg1OGFjOGQwNjBjZDNjYTkifQ.eyJhenAiOiI11NjQ3NTU0NDk2MTctNWkzczVvNzRhanB11MzhkbDBudDdvajBsdjdxOTFybnAuYXBwcy5nb29nbGV1c2VyY219udGVudC5jb20iLCJh1dWQiOiI1NjQ3NT1U0NDk2MTctNWkzczVvNzR1hanB1MzhkbDBudDdvajBsdjdxOTFybnAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTEzOTU3NjIzNjc4NTg3NDEwNjkiLCJlbWFpbCI6ImQzdmluLmNoZW5AZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF0X2hhc2giOiJ3LUt4NDVlY1UFjS0ExNG5COTlWMTV3IiwiaXNzIjoiYWNjb3VudHMuZ29vZ2xlLmNvbSIsImp0aSI6IjA5ZTk1Zjc3ZTA5YWI4OWYxMzgyNzFmOWU0NzZjY2QxMTVlODg3NTEiLCJpYXQiOjE1MTA3MTg5MTYsImV4cCI6MTUxMDcyMjUxN1iwibmFtZSI6IkRldmluIENoZW4iLCJwaWN0dXJl1IjoiaHR0cHM6Ly9saDQuZ219vZ2xldXNlcmNvbnRlbnQuY29tLy15ejdyZi03M1Zrcy9BQUFBQUFBQUFBSS9BQUFBQUFBQUR3VS8yWGRMYUgxa2xfNC9zOTYtYy9waG90by5qcGciLCJnaXZlbl9uYW11lIjoiRGV2aW14iLCJmYW1pbHlfbmFtZSI6IkNoZW41iLCJsb2NhbGUiOiJlbiJ9.1MpC0XYpbKffsDGG8lyiNHphnSG2YAHeD9eAjERlMC_0sXvRPhb2n2yalYyZc7S1Re9OkmN4tH4uKHZ4_Df9upMfLOzZjuxAEifZGcEkrMhpzxtWam_TFae9_En4LwvR031nklUcl2RwMvxywUyUimU3Sk7Lt11OiWDiUY6MN5wDiYl5zVV1UQBTKMcOiToGF6uyKOYH1ormQn2If-Hps7Tjl5vXIiJ-3MyjgotPaiPa1M8w0TPYMVLIpUq0oGNunYWVQBHU4n5Wu-leyNdeM0mU0uSSx5UVj6NC90CJhmfbzT5M1nEw-JxUbnwd0iFi6asBwi1e48rFhGDhxEquTCYyW1MWG
```

The *ID Token* field is a JWT.

## How to get Google ID token (JWT) using a React component - react-google-login

Use [react-google-login](https://www.npmjs.com/package/react-google-login) for frontend.

When you log in successfully, the response is:

```
{
  "El": "11301230672",
  "Zi": {
    "token_type": "Bearer",
    "access_token": "ya29.Glv6B...WUOTl",
    "scope": "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/plus.me openid email profile",
    "login_hint": "AJDLj...ik9ZA",
    "expires_in": 3600,
    "id_token": "eyJhb...dt5gg",
    "session_state": {
      "extraQueryParams": {
        "authuser": "0"
      }
    },
    "first_issued_at": 1509969759522,
    "expires_at": 1509973359522,
    "idpId": "google"
  },
  "w3": {
    "Eea": "11300...40672",
    "ig": "Devin Chen",
    "ofa": "Devin",
    "wea": "Chen",
    "Paa": "https://lh6.googleusercontent.com/-5uGZUphv_uM/AAAAAAAAAAI/AAAAAAAAAAA/ANQ0kf4yDIMfqLe1iGfVyNO2z51IL4eMEjKg/s96-c/photo.jpg",
    "U3": "foo@bar.com"
  },
  "googleId": "11300...40672",
  "tokenObj": {
    "token_type": "Bearer",
    "access_token": "ya29.Glv6B...WUOTl",
    "scope": "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/plus.me openid email profile",
    "login_hint": "AJDLj...ik9ZA",
    "expires_in": 3600,
    "id_token": "eyJhb...dt5gg",
    "session_state": {
      "extraQueryParams": {
        "authuser": "0"
      }
    },
    "first_issued_at": 1509969759522,
    "expires_at": 1509973359522,
    "idpId": "google"
  },
  "tokenId": "eyJhb...dt5gg",
  "accessToken": "ya29.Glv6B...WUOTl",
  "profileObj": {
    "googleId": "11300...40672",
    "imageUrl": "https://lh6.googleusercontent.com/-5uGZUphv_uM/AAAAAAAAAAI/AAAAAAAAAAA/ANQ0kf4yDIMfqLeiGfVyNO2z5IL4eMEjKg/s96-c/photo.jpg",
    "email": "foo@bar.com",
    "name": "Devin Chen",
    "givenName": "Devin",
    "familyName": "Chen"
  }
}
```

The `tokenId` field is a JWT, and is acting as the password of login user.

## JWT

Here is an example of JWT

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

Use [https://jwt.io/](https://jwt.io/) to decode

Header:

```
{
  "alg": "RS256",
  "kid": "a711490b15be85a855a1bab483ab818d1b78b5aa4fba"
}
```

Payload:

```
{
  "azp": "56475154419617-5i3s5o74ajpu381dl0nt7oj01lv7q91rnp.apps.googleusercontent.com",
  "aud": "56475154419617-5i3s5o74ajpu381dl0nt7oj01lv7q91rnp.apps.googleusercontent.com",
  "sub": "113001453434101026140672",
  "hd": "bar.com",
  "email": "foo@bar.com",
  "email_verified": true,
  "at_hash": "od9b1b1TPBrWgf1e50Wi1q81Q",
  "iss": "accounts.google.com",
  "jti": "6d174a6491841b4a33fbe1a1892b74115df23192dc83",
  "iat": 1510216292,
  "exp": 1510219892,
  "name": "Devin Chen",
  "picture": "https://lh6.googleusercontent.com/-5uGZUphv_uM/AAAAAAAAAAI/AAAAAAAAAAA/ANQ0kf4yD1IMfqLeiGfVy1NO2z5IL4e1MEjKg/s96-c/photo.jpg",
  "given_name": "Devin",
  "family_name": "Chen",
  "locale": "en"
}
```

## References

* Google JWT ( tokenId field ) payload fields definition [https://developers.google.com/identity/protocols/OpenIDConnect#obtainuserinfo](https://developers.google.com/identity/protocols/OpenIDConnect#obtainuserinfo)
* Google Sign-In for Websites - [https://developers.google.com/identity/sign-in/web/](https://developers.google.com/identity/sign-in/web/)
