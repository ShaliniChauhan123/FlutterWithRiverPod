const SignInMutation = '''

mutation SignIn(\$phoneNumber: String!, \$password: String!) {
  signin(phoneNumber: \$phoneNumber, password: \$password) {
    accessToken {
      token
      expiresAt
    }
    user {
      id
      isOnboarded
    }
  }
}
''';
