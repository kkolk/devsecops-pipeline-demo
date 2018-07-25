#!/bin/bash
TOKEN=$1

if [[ $(gitlab-rails r "token = PersonalAccessToken.find_by(name: 'AnsibleAccessToken'); print token;") ]]; then
  echo "Token Exists"
else
  echo "Creating Token"
  gitlab-rails r "token = PersonalAccessToken.new(user: User.where(id: 1).first, name: 'AnsibleAccessToken', token: '$TOKEN', scopes: ['api']); token.save"'!'
fi