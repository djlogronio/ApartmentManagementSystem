# API

- [API](#api)
  - [Auth](#auth)
    - [Login](#login)
      - [Login Request](#login-request)
      - [Login Response](#login-response)
    - [Register](#register)
      - [Register Request](#register-request)
      - [Register Response](#register-response)

## Auth

### Login

```js
POST {{host}}/api/auth/login
```

#### Login Request

```json
{
  "email": "dalton@email.com",
  "password": "dalton123"
}
```

#### Login Response

```json
{
  "id": "d12r1f1-g23y246g-g46y1",
  "firstName": "Dalton John",
  "lastName": "Logronio",
  "email": "dalton@email.com",
  "token": "token"
}
```

### Register

```js
POST {{host}}/api/auth/register
```

#### Register Request

```json
{
  "firstName": "Dalton John",
  "lastName": "Logronio",
  "email": "dalton@email.com",
  "password": "dalton123"
}
```

#### Register Response

```json
{
  "id": "d12r1f1-g23y246g-g46y1",
  "firstName": "Dalton John",
  "lastName": "Logronio",
  "email": "dalton@email.com",
  "token": "token"
}
```
