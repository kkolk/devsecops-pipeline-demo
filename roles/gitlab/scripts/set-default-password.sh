PASS=$1
gitlab-rails runner -e production "  \
  user = User.where(id: 1).first               \
  user.password = user.password_confirmation = '$PASS'; \
  user.save!"